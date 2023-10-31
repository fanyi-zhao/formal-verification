                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/array-class-enclosing.sink:              
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class C {                                                                                       
      array T = int[holds(this, tid) ? B : E]                                                       
                                                                                                    
       [C.T{this}] a N                                                                              
                                                                                                    
    }                                                                                               
    class D {                                                                                       
       C c N                                                                                        
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void f() {                                                                                    
        C c;                                                                                        
        c := this.c;                                                                                
        yield;                                                                                      
        [C.T{c}] a;                                                                                 
        a := c.a;                                                                                   
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void f2() {                                                                                   
        assume this.c != C.null;                                                                    
        C c;                                                                                        
        c := this.c;                                                                                
        yield;                                                                                      
        [C.T{c}] a;                                                                                 
        a = new [C.T{c}](10);                                                                       
        yield;                                                                                      
        c.a := a;                                                                                   
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class C {                                                                                       
      array T = int[holds(this, tid) ? B : E]                                                       
                                                                                                    
       [C.T{this}] a N                                                                              
                                                                                                    
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
                                                                                                    
                                                                                                    
    }                                                                                               
    class D {                                                                                       
       C c N                                                                                        
                                                                                                    
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
      void f() {                                                                                    
        C c;                                                                                        
        c := this.c;                                                                                
        yield;                                                                                      
        [C.T{c}] a;                                                                                 
        a := c.a;                                                                                   
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void f2() {                                                                                   
        assume this.c != C.null;                                                                    
        C c;                                                                                        
        c := this.c;                                                                                
        yield;                                                                                      
        [C.T{c}] a;                                                                                 
        a = new [C.T{c}](10);                                                                       
        yield;                                                                                      
        c.a := a;                                                                                   
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class C {                                                                                       
      array T = int[holds(this, tid) ? B : E]                                                       
                                                                                                    
       [C.T{this}] a N                                                                              
                                                                                                    
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
                                                                                                    
                                                                                                    
    }                                                                                               
    class D {                                                                                       
       C c N                                                                                        
                                                                                                    
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
      void f() {                                                                                    
        C c;                                                                                        
        c := this.c;                                                                                
        yield;                                                                                      
        [C.T{c}] a;                                                                                 
        a := c.a;                                                                                   
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void f2() {                                                                                   
        assume this.c != C.null;                                                                    
        C c;                                                                                        
        c := this.c;                                                                                
        yield;                                                                                      
        [C.T{c}] a;                                                                                 
        a = new [C.T{c}](10);                                                                       
        yield;                                                                                      
        c.a := a;                                                                                   
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class C {                                                                                       
      array T = int[holds(this, tid) ? B : E]                                                       
                                                                                                    
       [C.T{this}] a N                                                                              
                                                                                                    
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
                                                                                                    
                                                                                                    
    }                                                                                               
    class D {                                                                                       
       C c N                                                                                        
                                                                                                    
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
      void f() {                                                                                    
        C c;                                                                                        
        c := this.c;                                                                                
        yield;                                                                                      
        [C.T{c}] a;                                                                                 
        a := c.a;                                                                                   
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void f2() {                                                                                   
        assume this.c != C.null;                                                                    
        C c;                                                                                        
        c := this.c;                                                                                
        yield;                                                                                      
        [C.T{c}] a;                                                                                 
        a = new [C.T{c}](10);                                                                       
        yield;                                                                                      
        c.a := a;                                                                                   
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
                                                                                                    
                                                                                                    
/*** Class Decl C ***/                                                                              
                                                                                                    
type C;                                                                                             
const unique C.null: C;                                                                             
var C._state: [C]State;                                                                             
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var C.a: [C]Array.C.T;                                                                              
                                                                                                    
function {:inline} ReadEval.C.a(tid: Tid,this : C,C._state: [C]State,C.a: [C]Array.C.T,C._lock: [C]Tid,Array.C.T._state: [Array.C.T]State,Array.C.T._elems: [Array.C.T]([int]int),Array.C.T._length: [Array.C.T]int,D._state: [D]State,D.c: [D]C,D._lock: [D]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Array.C.T.null;                                                                   
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.C.a(tid: Tid,this : C,newValue: Array.C.T,C._state: [C]State,C.a: [C]Array.C.T,C._lock: [C]Tid,Array.C.T._state: [Array.C.T]State,Array.C.T._elems: [Array.C.T]([int]int),Array.C.T._length: [Array.C.T]int,D._state: [D]State,D.c: [D]C,D._lock: [D]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var C._lock: [C]Tid;                                                                                
                                                                                                    
function {:inline} ReadEval.C._lock(tid: Tid,this : C,C._state: [C]State,C.a: [C]Array.C.T,C._lock: [C]Tid,Array.C.T._state: [Array.C.T]State,Array.C.T._elems: [Array.C.T]([int]int),Array.C.T._length: [Array.C.T]int,D._state: [D]State,D.c: [D]C,D._lock: [D]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(C._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((C._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((C._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((C._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.C._lock(tid: Tid,this : C,newValue: Tid,C._state: [C]State,C.a: [C]Array.C.T,C._lock: [C]Tid,Array.C.T._state: [Array.C.T]State,Array.C.T._elems: [Array.C.T]([int]int),Array.C.T._length: [Array.C.T]int,D._state: [D]State,D.c: [D]C,D._lock: [D]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(C._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((C._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((C._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((C._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/*** Array Array.C.T ***/                                                                           
                                                                                                    
type Array.C.T;                                                                                     
const unique Array.C.T.null: Array.C.T;                                                             
var Array.C.T._state: [Array.C.T]State;                                                             
                                                                                                    
const Array.C.T._this : [Array.C.T]C;                                                               
const Array.C.T._length : [Array.C.T]int;                                                           
var Array.C.T._elems  : [Array.C.T]([int]int);                                                      
                                                                                                    
axiom (forall $this : Array.C.T :: Array.C.T._length[$this] >= 0);                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.C.T: Spec(Cond(Holds(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.C.T(tid: Tid,this : C,athis : Array.C.T,index : int,C._state: [C]State,C.a: [C]Array.C.T,C._lock: [C]Tid,Array.C.T._state: [Array.C.T]State,Array.C.T._elems: [Array.C.T]([int]int),Array.C.T._length: [Array.C.T]int,D._state: [D]State,D.c: [D]C,D._lock: [D]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 if ((isAccessible(C._state[this], tid) && C._lock[this] == tid)) then                              
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.C.T: Spec(Cond(Holds(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.C.T(tid: Tid,this : C,athis : Array.C.T,index : int,newValue: int,C._state: [C]State,C.a: [C]Array.C.T,C._lock: [C]Tid,Array.C.T._state: [Array.C.T]State,Array.C.T._elems: [Array.C.T]([int]int),Array.C.T._length: [Array.C.T]int,D._state: [D]State,D.c: [D]C,D._lock: [D]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(C._state[this], tid) && C._lock[this] == tid)) then                              
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl D ***/                                                                              
                                                                                                    
type D;                                                                                             
const unique D.null: D;                                                                             
var D._state: [D]State;                                                                             
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var D.c: [D]C;                                                                                      
                                                                                                    
function {:inline} ReadEval.D.c(tid: Tid,this : D,C._state: [C]State,C.a: [C]Array.C.T,C._lock: [C]Tid,Array.C.T._state: [Array.C.T]State,Array.C.T._elems: [Array.C.T]([int]int),Array.C.T._length: [Array.C.T]int,D._state: [D]State,D.c: [D]C,D._lock: [D]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := C.null;                                                                           
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.D.c(tid: Tid,this : D,newValue: C,C._state: [C]State,C.a: [C]Array.C.T,C._lock: [C]Tid,Array.C.T._state: [Array.C.T]State,Array.C.T._elems: [Array.C.T]([int]int),Array.C.T._length: [Array.C.T]int,D._state: [D]State,D.c: [D]C,D._lock: [D]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var D._lock: [D]Tid;                                                                                
                                                                                                    
function {:inline} ReadEval.D._lock(tid: Tid,this : D,C._state: [C]State,C.a: [C]Array.C.T,C._lock: [C]Tid,Array.C.T._state: [Array.C.T]State,Array.C.T._elems: [Array.C.T]([int]int),Array.C.T._length: [Array.C.T]int,D._state: [D]State,D.c: [D]C,D._lock: [D]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(D._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((D._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((D._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((D._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.D._lock(tid: Tid,this : D,newValue: Tid,C._state: [C]State,C.a: [C]Array.C.T,C._lock: [C]Tid,Array.C.T._state: [Array.C.T]State,Array.C.T._elems: [Array.C.T]([int]int),Array.C.T._length: [Array.C.T]int,D._state: [D]State,D.c: [D]C,D._lock: [D]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(D._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((D._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((D._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((D._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(C._state: [C]State,C.a: [C]Array.C.T,C._lock: [C]Tid,Array.C.T._state: [Array.C.T]State,Array.C.T._elems: [Array.C.T]([int]int),Array.C.T._length: [Array.C.T]int,D._state: [D]State,D.c: [D]C,D._lock: [D]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: C  :: _i == C.null <==> isNull(C._state[_i])) &&                                      
  (forall _i: Array.C.T  :: _i == Array.C.T.null <==> isNull(Array.C.T._state[_i])) &&              
  (forall _i: D  :: _i == D.null <==> isNull(D._state[_i])) &&                                      
  (forall _t: Tid, _i: Array.C.T  :: ValidTid(_t) && isAccessible(Array.C.T._state[_i], _t) ==> isAccessible(C._state[Array.C.T._this[_i]], _t)) &&
  (forall _i: C ::  (isShared(C._state[_i]) ==> isSharedAssignable(Array.C.T._state[C.a[_i]]))) &&  
  (forall _i: C ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(C._state[_i],_t) ==> isLocalAssignable(Array.C.T._state[C.a[_i]], _t)))) &&
  (forall _i: C :: { C.a[_i] } Array.C.T._this[C.a[_i]] == _i) &&                                   
  (forall _i: D ::  (isShared(D._state[_i]) ==> isSharedAssignable(C._state[D.c[_i]]))) &&          
  (forall _i: D ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(D._state[_i],_t) ==> isLocalAssignable(C._state[D.c[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.C.a(t: Tid, u: Tid, v: Array.C.T, w: Array.C.T, x: C)        
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[x], u);                                                             
 modifies C.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 C.a[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.C.a(u: Tid,x: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (6.5): C.a failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.C.a(t: Tid, u: Tid, v: Array.C.T, w: Array.C.T, x: C)         
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[x], u);                                                             
 modifies C.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 C.a[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.C.a(u: Tid,x: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (6.5): C.a failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.C.a(t: Tid, u: Tid, v: Array.C.T, w: Array.C.T, x: C)         
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[x], u);                                                             
 modifies C.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.C.T;                                                                        
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == C.a[x];                                                                                
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 C.a[x] := havocValue;                                                                              
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.C.a(u: Tid,x: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (6.5): C.a failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.C.a(t: Tid, u: Tid, v: Array.C.T, w: Array.C.T, x: C)          
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[x], u);                                                             
 modifies C.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Array.C.T;                                                                        
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == C.a[x];                                                                                
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.C.a(u: Tid,x: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (6.5): C.a failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.C.a(t: Tid, u: Tid, v: Array.C.T, w: Array.C.T, x: C)              
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[x], u);                                                             
 modifies C.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.C.a(t: Tid,x: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.C.a(u: Tid,x: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.5): C.a failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.C.a(t: Tid, u: Tid, v: Array.C.T, w: Array.C.T, x: C)               
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[x], u);                                                             
 modifies C.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.C.T;                                                                        
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == C.a[x];                                                                                
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.C.a(t: Tid,x: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 C.a[x] := havocValue;                                                                              
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.C.a(u: Tid,x: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.5): C.a failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.C.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: C, x: Array.C.T, i: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(Array.C.T._state[x], u);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 modifies Array.C.T._elems;                                                                         
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.C.T._elems[x][i] := v;                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.C.T(u: Tid,x_owner: C,x: Array.C.T,i: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.C.T failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.C.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: C, x: Array.C.T, i: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(Array.C.T._state[x], u);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 modifies Array.C.T._elems;                                                                         
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.C.T._elems[x][i] := v;                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.C.T(u: Tid,x_owner: C,x: Array.C.T,i: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): Array Array.C.T failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.C.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: C, x: Array.C.T, i: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(Array.C.T._state[x], u);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 modifies Array.C.T._elems;                                                                         
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 assume w == Array.C.T._elems[x][i];                                                                
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.C.T._elems[x][i] := havocValue;                                                              
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.C.T(u: Tid,x_owner: C,x: Array.C.T,i: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.C.T failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.C.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: C, x: Array.C.T, i: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(Array.C.T._state[x], u);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 modifies Array.C.T._elems;                                                                         
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 assume w == Array.C.T._elems[x][i];                                                                
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.C.T(u: Tid,x_owner: C,x: Array.C.T,i: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Array Array.C.T failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.C.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: C, x: Array.C.T, i: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(Array.C.T._state[x], u);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 modifies Array.C.T._elems;                                                                         
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.C.T(u: Tid,x_owner: C,x: Array.C.T,i: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.C.T failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.C.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: C, x: Array.C.T, i: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(Array.C.T._state[x], u);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 modifies Array.C.T._elems;                                                                         
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
 assume w == Array.C.T._elems[x][i];                                                                
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.C.T._elems[x][i] := havocValue;                                                              
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.C.T(u: Tid,x_owner: C,x: Array.C.T,i: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.C.T failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.D.c(t: Tid, u: Tid, v: C, w: C, x: D)                        
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(D._state[x], u);                                                             
 modifies D.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 D.c[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.D.c(u: Tid,x: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (12.5): D.c failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.D.c(t: Tid, u: Tid, v: C, w: C, x: D)                         
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(D._state[x], u);                                                             
 modifies D.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 D.c[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.D.c(u: Tid,x: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (12.5): D.c failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.D.c(t: Tid, u: Tid, v: C, w: C, x: D)                         
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(D._state[x], u);                                                             
 modifies D.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : C;                                                                                
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 assume w == D.c[x];                                                                                
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 D.c[x] := havocValue;                                                                              
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.D.c(u: Tid,x: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (12.5): D.c failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.D.c(t: Tid, u: Tid, v: C, w: C, x: D)                          
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(D._state[x], u);                                                             
 modifies D.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : C;                                                                                
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 assume w == D.c[x];                                                                                
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.D.c(u: Tid,x: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (12.5): D.c failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.D.c(t: Tid, u: Tid, v: C, w: C, x: D)                              
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(D._state[x], u);                                                             
 modifies D.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.D.c(t: Tid,x: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.D.c(u: Tid,x: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (12.5): D.c failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.D.c(t: Tid, u: Tid, v: C, w: C, x: D)                               
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(D._state[x], u);                                                             
 modifies D.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : C;                                                                                
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
 assume w == D.c[x];                                                                                
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.D.c(t: Tid,x: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 D.c[x] := havocValue;                                                                              
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.D.c(u: Tid,x: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (12.5): D.c failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.C.a.C.a(t: Tid, u: Tid, v: Array.C.T, w: Array.C.T, w0: Array.C.T, x: C, y: C)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies C.a;                                                                                      
 modifies C.a;                                                                                      
                                                                                                    
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 C.a[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to C.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.5): C.a is not Write-Write Stable with respect to C.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to C.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.C.a.C.a(t: Tid, u: Tid, v: Array.C.T, w: Array.C.T, w0: Array.C.T, x: C, y: C)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies C.a;                                                                                      
 modifies C.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : Array.C.T;                                                                              
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: Array.C.T;                                                                              
 var y_mid: C;                                                                                      
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var x_mid: C;                                                                                      
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var w0_mid: Array.C.T;                                                                             
 var v_mid: Array.C.T;                                                                              
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := C.a[x];                                                                                    
 C.a[x] := v;                                                                                       
                                                                                                    
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 C.a[x] := tmpV;                                                                                    
 C.a[y] := w;                                                                                       
 _writeByTPost := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to C.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.C.a.C.a(t: Tid, u: Tid, v: Array.C.T, w: Array.C.T, w0: Array.C.T, x: C, y: C)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies C.a;                                                                                      
 modifies C.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : Array.C.T;                                                                              
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: Array.C.T;                                                                              
 var y_mid: C;                                                                                      
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var x_mid: C;                                                                                      
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var w0_mid: Array.C.T;                                                                             
 var v_mid: Array.C.T;                                                                              
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := C.a[x];                                                                                    
 C.a[x] := v;                                                                                       
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 C.a[x] := tmpV;                                                                                    
 C.a[y] := w;                                                                                       
 _writeByTPost := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to C.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to C.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.C.a.C.a(t: Tid, u: Tid, v: Array.C.T, w: Array.C.T, w0: Array.C.T, x: C, y: C)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies C.a;                                                                                      
 modifies C.a;                                                                                      
                                                                                                    
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.C.a(t: Tid,x: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 C.a[y] := w;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.C.a(t: Tid,x: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): C.a is not Read-Write Stable with respect to C.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): C.a is not Read-Write Stable with respect to C.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): C.a is not Read-Write Stable with respect to C.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.C.a.C.a(t: Tid, u: Tid, v: Array.C.T, w: Array.C.T, w0: Array.C.T, x: C, y: C)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies C.a;                                                                                      
 modifies C.a;                                                                                      
                                                                                                    
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.C.a(u: Tid,y: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 C.a[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.C.a(u: Tid,y: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): C.a is not Write-Read Stable with respect to C.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): C.a is not Write-Read Stable with respect to C.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.5): C.a is not Write-Read Stable with respect to C.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.C.a.Array.C.T._elems(t: Tid, u: Tid, v: Array.C.T, w: int, w0: int, x: C, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies C.a;                                                                                      
 modifies Array.C.T._elems;                                                                         
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var w_pre: int;                                                                                    
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 C.a[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to C.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to C.a (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to C.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.C.a.Array.C.T._elems(t: Tid, u: Tid, v: Array.C.T, w: int, w0: int, x: C, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies C.a;                                                                                      
 modifies Array.C.T._elems;                                                                         
                                                                                                    
 {                                                                                                  
 var tmpV : Array.C.T;                                                                              
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var w_pre: int;                                                                                    
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var y_mid: Array.C.T;                                                                              
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var x_mid: C;                                                                                      
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var y_owner_mid: C;                                                                                
 var j_mid: int;                                                                                    
 var v_mid: Array.C.T;                                                                              
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := C.a[x];                                                                                    
 C.a[x] := v;                                                                                       
                                                                                                    
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 C.a[x] := tmpV;                                                                                    
 Array.C.T._elems[y][j] := w;                                                                       
 _writeByTPost := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to Array Array.C.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.C.a.Array.C.T._elems(t: Tid, u: Tid, v: Array.C.T, w: int, w0: int, x: C, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies C.a;                                                                                      
 modifies Array.C.T._elems;                                                                         
                                                                                                    
 {                                                                                                  
 var tmpV : Array.C.T;                                                                              
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var w_pre: int;                                                                                    
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var y_mid: Array.C.T;                                                                              
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var x_mid: C;                                                                                      
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var y_owner_mid: C;                                                                                
 var j_mid: int;                                                                                    
 var v_mid: Array.C.T;                                                                              
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := C.a[x];                                                                                    
 C.a[x] := v;                                                                                       
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 C.a[x] := tmpV;                                                                                    
 Array.C.T._elems[y][j] := w;                                                                       
 _writeByTPost := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to Array Array.C.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to Array Array.C.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.C.a.Array.C.T._elems(t: Tid, u: Tid, v: Array.C.T, w: int, w0: int, x: C, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies C.a;                                                                                      
 modifies Array.C.T._elems;                                                                         
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var w_pre: int;                                                                                    
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.C.a(t: Tid,x: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.C.T._elems[y][j] := w;                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.C.a(t: Tid,x: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): C.a is not Read-Write Stable with respect to Array Array.C.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): C.a is not Read-Write Stable with respect to Array Array.C.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): C.a is not Read-Write Stable with respect to Array Array.C.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.C.a.Array.C.T._elems(t: Tid, u: Tid, v: Array.C.T, w: int, w0: int, x: C, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies C.a;                                                                                      
 modifies Array.C.T._elems;                                                                         
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var w_pre: int;                                                                                    
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 C.a[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.C.T is not Write-Read Stable with respect to C.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.C.T is not Write-Read Stable with respect to C.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Array Array.C.T is not Write-Read Stable with respect to C.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.C.a.D.c(t: Tid, u: Tid, v: Array.C.T, w: C, w0: C, x: C, y: D)            
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(D._state[y], u);                                                             
 modifies C.a;                                                                                      
 modifies D.c;                                                                                      
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 C.a[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to C.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): D.c is not Write-Write Stable with respect to C.a (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to C.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.C.a.D.c(t: Tid, u: Tid, v: Array.C.T, w: C, w0: C, x: C, y: D)            
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(D._state[y], u);                                                             
 modifies C.a;                                                                                      
 modifies D.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : Array.C.T;                                                                              
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var w0_mid: C;                                                                                     
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var x_mid: C;                                                                                      
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var y_mid: D;                                                                                      
 var v_mid: Array.C.T;                                                                              
 var w_mid: C;                                                                                      
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := C.a[x];                                                                                    
 C.a[x] := v;                                                                                       
                                                                                                    
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 C.a[x] := tmpV;                                                                                    
 D.c[y] := w;                                                                                       
 _writeByTPost := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to D.c (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.C.a.D.c(t: Tid, u: Tid, v: Array.C.T, w: C, w0: C, x: C, y: D)           
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(D._state[y], u);                                                             
 modifies C.a;                                                                                      
 modifies D.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : Array.C.T;                                                                              
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var w0_mid: C;                                                                                     
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var x_mid: C;                                                                                      
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var y_mid: D;                                                                                      
 var v_mid: Array.C.T;                                                                              
 var w_mid: C;                                                                                      
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := C.a[x];                                                                                    
 C.a[x] := v;                                                                                       
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 C.a[x] := tmpV;                                                                                    
 D.c[y] := w;                                                                                       
 _writeByTPost := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to D.c (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to D.c (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.C.a.D.c(t: Tid, u: Tid, v: Array.C.T, w: C, w0: C, x: C, y: D)          
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(D._state[y], u);                                                             
 modifies C.a;                                                                                      
 modifies D.c;                                                                                      
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 _readByT := ReadEval.C.a(t: Tid,x: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 D.c[y] := w;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.C.a(t: Tid,x: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): C.a is not Read-Write Stable with respect to D.c (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): C.a is not Read-Write Stable with respect to D.c (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): C.a is not Read-Write Stable with respect to D.c (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.C.a.D.c(t: Tid, u: Tid, v: Array.C.T, w: C, w0: C, x: C, y: D)          
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(D._state[y], u);                                                             
 modifies C.a;                                                                                      
 modifies D.c;                                                                                      
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var v_pre: Array.C.T;                                                                              
 var x_pre: C;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_post: Array.C.T;                                                                             
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 _readByU := ReadEval.D.c(u: Tid,y: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.C.a(t: Tid,x: C,v: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 C.a[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.D.c(u: Tid,y: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): D.c is not Write-Read Stable with respect to C.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): D.c is not Write-Read Stable with respect to C.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): D.c is not Write-Read Stable with respect to C.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.C.T._elems.C.a(t: Tid, u: Tid, v: int, w: Array.C.T, w0: Array.C.T, x_owner: C, x: Array.C.T, i: int, y: C)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(C._state[y], u);                                                             
 modifies Array.C.T._elems;                                                                         
 modifies C.a;                                                                                      
                                                                                                    
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.C.T._elems[x][i] := v;                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to Array Array.C.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.5): C.a is not Write-Write Stable with respect to Array Array.C.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to Array Array.C.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.C.T._elems.C.a(t: Tid, u: Tid, v: int, w: Array.C.T, w0: Array.C.T, x_owner: C, x: Array.C.T, i: int, y: C)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(C._state[y], u);                                                             
 modifies Array.C.T._elems;                                                                         
 modifies C.a;                                                                                      
                                                                                                    
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var x_mid: Array.C.T;                                                                              
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: Array.C.T;                                                                              
 var y_mid: C;                                                                                      
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var w0_mid: Array.C.T;                                                                             
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.C.T._elems[x][i];                                                                    
 Array.C.T._elems[x][i] := v;                                                                       
                                                                                                    
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.C.T._elems[x][i] := tmpV;                                                                    
 C.a[y] := w;                                                                                       
 _writeByTPost := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to C.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.C.T._elems.C.a(t: Tid, u: Tid, v: int, w: Array.C.T, w0: Array.C.T, x_owner: C, x: Array.C.T, i: int, y: C)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(C._state[y], u);                                                             
 modifies Array.C.T._elems;                                                                         
 modifies C.a;                                                                                      
                                                                                                    
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var x_mid: Array.C.T;                                                                              
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: Array.C.T;                                                                              
 var y_mid: C;                                                                                      
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var w0_mid: Array.C.T;                                                                             
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.C.T._elems[x][i];                                                                    
 Array.C.T._elems[x][i] := v;                                                                       
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.C.T._elems[x][i] := tmpV;                                                                    
 C.a[y] := w;                                                                                       
 _writeByTPost := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to C.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to C.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.C.T._elems.C.a(t: Tid, u: Tid, v: int, w: Array.C.T, w0: Array.C.T, x_owner: C, x: Array.C.T, i: int, y: C)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(C._state[y], u);                                                             
 modifies Array.C.T._elems;                                                                         
 modifies C.a;                                                                                      
                                                                                                    
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 C.a[y] := w;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Read-Write Stable with respect to C.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Read-Write Stable with respect to C.a (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Read-Write Stable with respect to C.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.C.T._elems.C.a(t: Tid, u: Tid, v: int, w: Array.C.T, w0: Array.C.T, x_owner: C, x: Array.C.T, i: int, y: C)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(C._state[y], u);                                                             
 modifies Array.C.T._elems;                                                                         
 modifies C.a;                                                                                      
                                                                                                    
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 _readByU := ReadEval.C.a(u: Tid,y: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.C.T._elems[x][i] := v;                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.C.a(u: Tid,y: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): C.a is not Write-Read Stable with respect to Array Array.C.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): C.a is not Write-Read Stable with respect to Array Array.C.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.5): C.a is not Write-Read Stable with respect to Array Array.C.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.C.T._elems.Array.C.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: C, x: Array.C.T, i: int, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies Array.C.T._elems;                                                                         
 modifies Array.C.T._elems;                                                                         
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.C.T._elems[x][i] := v;                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to Array Array.C.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to Array Array.C.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to Array Array.C.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.C.T._elems.Array.C.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: C, x: Array.C.T, i: int, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies Array.C.T._elems;                                                                         
 modifies Array.C.T._elems;                                                                         
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var y_mid: Array.C.T;                                                                              
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var x_mid: Array.C.T;                                                                              
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var y_owner_mid: C;                                                                                
 var v_mid: int;                                                                                    
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var x_owner_mid: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.C.T._elems[x][i];                                                                    
 Array.C.T._elems[x][i] := v;                                                                       
                                                                                                    
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.C.T._elems[x][i] := tmpV;                                                                    
 Array.C.T._elems[y][j] := w;                                                                       
 _writeByTPost := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to Array Array.C.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.C.T._elems.Array.C.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: C, x: Array.C.T, i: int, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies Array.C.T._elems;                                                                         
 modifies Array.C.T._elems;                                                                         
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var y_mid: Array.C.T;                                                                              
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var x_mid: Array.C.T;                                                                              
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var y_owner_mid: C;                                                                                
 var v_mid: int;                                                                                    
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var x_owner_mid: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.C.T._elems[x][i];                                                                    
 Array.C.T._elems[x][i] := v;                                                                       
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.C.T._elems[x][i] := tmpV;                                                                    
 Array.C.T._elems[y][j] := w;                                                                       
 _writeByTPost := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to Array Array.C.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to Array Array.C.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.C.T._elems.Array.C.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: C, x: Array.C.T, i: int, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies Array.C.T._elems;                                                                         
 modifies Array.C.T._elems;                                                                         
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.C.T._elems[y][j] := w;                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Read-Write Stable with respect to Array Array.C.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Read-Write Stable with respect to Array Array.C.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Read-Write Stable with respect to Array Array.C.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.C.T._elems.Array.C.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: C, x: Array.C.T, i: int, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies Array.C.T._elems;                                                                         
 modifies Array.C.T._elems;                                                                         
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.C.T._elems[x][i] := v;                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.C.T is not Write-Read Stable with respect to Array Array.C.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.C.T is not Write-Read Stable with respect to Array Array.C.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Array Array.C.T is not Write-Read Stable with respect to Array Array.C.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.C.T._elems.D.c(t: Tid, u: Tid, v: int, w: C, w0: C, x_owner: C, x: Array.C.T, i: int, y: D)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(D._state[y], u);                                                             
 modifies Array.C.T._elems;                                                                         
 modifies D.c;                                                                                      
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.C.T._elems[x][i] := v;                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to Array Array.C.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): D.c is not Write-Write Stable with respect to Array Array.C.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to Array Array.C.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.C.T._elems.D.c(t: Tid, u: Tid, v: int, w: C, w0: C, x_owner: C, x: Array.C.T, i: int, y: D)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(D._state[y], u);                                                             
 modifies Array.C.T._elems;                                                                         
 modifies D.c;                                                                                      
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var w0_mid: C;                                                                                     
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var x_mid: Array.C.T;                                                                              
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var y_mid: D;                                                                                      
 var v_mid: int;                                                                                    
 var w_mid: C;                                                                                      
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.C.T._elems[x][i];                                                                    
 Array.C.T._elems[x][i] := v;                                                                       
                                                                                                    
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.C.T._elems[x][i] := tmpV;                                                                    
 D.c[y] := w;                                                                                       
 _writeByTPost := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to D.c (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.C.T._elems.D.c(t: Tid, u: Tid, v: int, w: C, w0: C, x_owner: C, x: Array.C.T, i: int, y: D)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(D._state[y], u);                                                             
 modifies Array.C.T._elems;                                                                         
 modifies D.c;                                                                                      
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var w0_mid: C;                                                                                     
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var x_mid: Array.C.T;                                                                              
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var y_mid: D;                                                                                      
 var v_mid: int;                                                                                    
 var w_mid: C;                                                                                      
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.C.T._elems[x][i];                                                                    
 Array.C.T._elems[x][i] := v;                                                                       
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.C.T._elems[x][i] := tmpV;                                                                    
 D.c[y] := w;                                                                                       
 _writeByTPost := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to D.c (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to D.c (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.C.T._elems.D.c(t: Tid, u: Tid, v: int, w: C, w0: C, x_owner: C, x: Array.C.T, i: int, y: D)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(D._state[y], u);                                                             
 modifies Array.C.T._elems;                                                                         
 modifies D.c;                                                                                      
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 D.c[y] := w;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Read-Write Stable with respect to D.c (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Read-Write Stable with respect to D.c (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.C.T is not Read-Write Stable with respect to D.c (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.C.T._elems.D.c(t: Tid, u: Tid, v: int, w: C, w0: C, x_owner: C, x: Array.C.T, i: int, y: D)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.C.T._state[x], t);                                                     
 requires Array.C.T._this[x] == x_owner;                                                            
 requires isAccessible(D._state[y], u);                                                             
 modifies Array.C.T._elems;                                                                         
 modifies D.c;                                                                                      
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var v_pre: int;                                                                                    
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var x_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var i_pre: int;                                                                                    
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
 var x_owner_pre: C;                                                                                
                                                                                                    
 var x_post: Array.C.T;                                                                             
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
 var x_owner_post: C;                                                                               
                                                                                                    
                                                                                                    
 _readByU := ReadEval.D.c(u: Tid,y: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.C.T(t: Tid,x_owner: C,x: Array.C.T,i: int,v: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.C.T._elems[x][i] := v;                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.D.c(u: Tid,y: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): D.c is not Write-Read Stable with respect to Array Array.C.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): D.c is not Write-Read Stable with respect to Array Array.C.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): D.c is not Write-Read Stable with respect to Array Array.C.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.D.c.C.a(t: Tid, u: Tid, v: C, w: Array.C.T, w0: Array.C.T, x: D, y: C)    
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies D.c;                                                                                      
 modifies C.a;                                                                                      
                                                                                                    
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var v_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 D.c[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to D.c (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.5): C.a is not Write-Write Stable with respect to D.c (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.5): C.a is not Write-Write Stable with respect to D.c (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.D.c.C.a(t: Tid, u: Tid, v: C, w: Array.C.T, w0: Array.C.T, x: D, y: C)    
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies D.c;                                                                                      
 modifies C.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : C;                                                                                      
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var v_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: Array.C.T;                                                                              
 var x_mid: D;                                                                                      
 var y_mid: C;                                                                                      
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var v_mid: C;                                                                                      
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var w0_mid: Array.C.T;                                                                             
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := D.c[x];                                                                                    
 D.c[x] := v;                                                                                       
                                                                                                    
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 D.c[x] := tmpV;                                                                                    
 C.a[y] := w;                                                                                       
 _writeByTPost := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to C.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.D.c.C.a(t: Tid, u: Tid, v: C, w: Array.C.T, w0: Array.C.T, x: D, y: C)   
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies D.c;                                                                                      
 modifies C.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : C;                                                                                      
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var v_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: Array.C.T;                                                                              
 var x_mid: D;                                                                                      
 var y_mid: C;                                                                                      
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var v_mid: C;                                                                                      
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var w0_mid: Array.C.T;                                                                             
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := D.c[x];                                                                                    
 D.c[x] := v;                                                                                       
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 D.c[x] := tmpV;                                                                                    
 C.a[y] := w;                                                                                       
 _writeByTPost := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to C.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to C.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.D.c.C.a(t: Tid, u: Tid, v: C, w: Array.C.T, w0: Array.C.T, x: D, y: C)  
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies D.c;                                                                                      
 modifies C.a;                                                                                      
                                                                                                    
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var v_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.D.c(t: Tid,x: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.C.a(u: Tid,y: C,w: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 C.a[y] := w;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.D.c(t: Tid,x: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): D.c is not Read-Write Stable with respect to C.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): D.c is not Read-Write Stable with respect to C.a (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): D.c is not Read-Write Stable with respect to C.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.D.c.C.a(t: Tid, u: Tid, v: C, w: Array.C.T, w0: Array.C.T, x: D, y: C)  
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies D.c;                                                                                      
 modifies C.a;                                                                                      
                                                                                                    
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
 var w0_pre: Array.C.T;                                                                             
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w_pre: Array.C.T;                                                                              
 var v_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: Array.C.T;                                                                             
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var y_post: C;                                                                                     
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var w0_post: Array.C.T;                                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.C.a(u: Tid,y: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 D.c[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.C.a(u: Tid,y: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): C.a is not Write-Read Stable with respect to D.c (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): C.a is not Write-Read Stable with respect to D.c (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.5): C.a is not Write-Read Stable with respect to D.c (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.D.c.Array.C.T._elems(t: Tid, u: Tid, v: C, w: int, w0: int, x: D, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies D.c;                                                                                      
 modifies Array.C.T._elems;                                                                         
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var w_pre: int;                                                                                    
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 D.c[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to D.c (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to D.c (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Array Array.C.T is not Write-Write Stable with respect to D.c (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.D.c.Array.C.T._elems(t: Tid, u: Tid, v: C, w: int, w0: int, x: D, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies D.c;                                                                                      
 modifies Array.C.T._elems;                                                                         
                                                                                                    
 {                                                                                                  
 var tmpV : C;                                                                                      
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var w_pre: int;                                                                                    
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var y_mid: Array.C.T;                                                                              
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var x_mid: D;                                                                                      
 var w_mid: int;                                                                                    
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var v_mid: C;                                                                                      
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var y_owner_mid: C;                                                                                
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := D.c[x];                                                                                    
 D.c[x] := v;                                                                                       
                                                                                                    
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 D.c[x] := tmpV;                                                                                    
 Array.C.T._elems[y][j] := w;                                                                       
 _writeByTPost := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to Array Array.C.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.D.c.Array.C.T._elems(t: Tid, u: Tid, v: C, w: int, w0: int, x: D, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies D.c;                                                                                      
 modifies Array.C.T._elems;                                                                         
                                                                                                    
 {                                                                                                  
 var tmpV : C;                                                                                      
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var w_pre: int;                                                                                    
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var y_mid: Array.C.T;                                                                              
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var x_mid: D;                                                                                      
 var w_mid: int;                                                                                    
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var v_mid: C;                                                                                      
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var y_owner_mid: C;                                                                                
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := D.c[x];                                                                                    
 D.c[x] := v;                                                                                       
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 D.c[x] := tmpV;                                                                                    
 Array.C.T._elems[y][j] := w;                                                                       
 _writeByTPost := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to Array Array.C.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to Array Array.C.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.D.c.Array.C.T._elems(t: Tid, u: Tid, v: C, w: int, w0: int, x: D, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies D.c;                                                                                      
 modifies Array.C.T._elems;                                                                         
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var w_pre: int;                                                                                    
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.D.c(t: Tid,x: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,w: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.C.T._elems[y][j] := w;                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.D.c(t: Tid,x: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): D.c is not Read-Write Stable with respect to Array Array.C.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): D.c is not Read-Write Stable with respect to Array Array.C.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): D.c is not Read-Write Stable with respect to Array Array.C.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.D.c.Array.C.T._elems(t: Tid, u: Tid, v: C, w: int, w0: int, x: D, y_owner: C, y: Array.C.T, j: int)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(Array.C.T._state[y], u);                                                     
 requires Array.C.T._this[y] == y_owner;                                                            
 modifies D.c;                                                                                      
 modifies Array.C.T._elems;                                                                         
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var j_pre: int;                                                                                    
 var D._lock_pre: [D]Tid;                                                                           
 var C.a_pre: [C]Array.C.T;                                                                         
 var y_pre: Array.C.T;                                                                              
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var w_pre: int;                                                                                    
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var y_owner_pre: C;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var w_post: int;                                                                                   
 var y_post: Array.C.T;                                                                             
 var C._state_post: [C]State;                                                                       
 var y_owner_post: C;                                                                               
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 D.c[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.C.T(u: Tid,y_owner: C,y: Array.C.T,j: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.C.T is not Write-Read Stable with respect to D.c (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.C.T is not Write-Read Stable with respect to D.c (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Array Array.C.T is not Write-Read Stable with respect to D.c (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.D.c.D.c(t: Tid, u: Tid, v: C, w: C, w0: C, x: D, y: D)                    
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(D._state[y], u);                                                             
 modifies D.c;                                                                                      
 modifies D.c;                                                                                      
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 D.c[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to D.c (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): D.c is not Write-Write Stable with respect to D.c (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to D.c (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.D.c.D.c(t: Tid, u: Tid, v: C, w: C, w0: C, x: D, y: D)                    
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(D._state[y], u);                                                             
 modifies D.c;                                                                                      
 modifies D.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : C;                                                                                      
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var w0_mid: C;                                                                                     
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var x_mid: D;                                                                                      
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var v_mid: C;                                                                                      
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var y_mid: D;                                                                                      
 var w_mid: C;                                                                                      
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := D.c[x];                                                                                    
 D.c[x] := v;                                                                                       
                                                                                                    
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 D.c[x] := tmpV;                                                                                    
 D.c[y] := w;                                                                                       
 _writeByTPost := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to D.c (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.D.c.D.c(t: Tid, u: Tid, v: C, w: C, w0: C, x: D, y: D)                   
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(D._state[y], u);                                                             
 modifies D.c;                                                                                      
 modifies D.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : C;                                                                                      
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Array.C.T._state_mid: [Array.C.T]State;                                                        
 var w0_mid: C;                                                                                     
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var D._state_mid: [D]State;                                                                        
 var D.c_mid: [D]C;                                                                                 
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var x_mid: D;                                                                                      
 var Array.C.T._length_mid: [Array.C.T]int;                                                         
 var v_mid: C;                                                                                      
 var Array.C.T._elems_mid: [Array.C.T]([int]int);                                                   
 var C.a_mid: [C]Array.C.T;                                                                         
 var D._lock_mid: [D]Tid;                                                                           
 var y_mid: D;                                                                                      
 var w_mid: C;                                                                                      
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := D.c[x];                                                                                    
 D.c[x] := v;                                                                                       
 assume C._state_mid == C._state && C.a_mid == C.a && C._lock_mid == C._lock && Array.C.T._state_mid == Array.C.T._state && Array.C.T._elems_mid == Array.C.T._elems && Array.C.T._length_mid == Array.C.T._length && D._state_mid == D._state && D.c_mid == D.c && D._lock_mid == D._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 D.c[x] := tmpV;                                                                                    
 D.c[y] := w;                                                                                       
 _writeByTPost := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to D.c (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): D.c is not Write-Write Stable with respect to D.c (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.D.c.D.c(t: Tid, u: Tid, v: C, w: C, w0: C, x: D, y: D)                  
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(D._state[y], u);                                                             
 modifies D.c;                                                                                      
 modifies D.c;                                                                                      
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 _readByT := ReadEval.D.c(t: Tid,x: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.D.c(u: Tid,y: D,w: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 D.c[y] := w;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.D.c(t: Tid,x: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): D.c is not Read-Write Stable with respect to D.c (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): D.c is not Read-Write Stable with respect to D.c (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): D.c is not Read-Write Stable with respect to D.c (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.D.c.D.c(t: Tid, u: Tid, v: C, w: C, w0: C, x: D, y: D)                  
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(D._state[x], t);                                                             
 requires isAccessible(D._state[y], u);                                                             
 modifies D.c;                                                                                      
 modifies D.c;                                                                                      
                                                                                                    
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
 var D._state_pre: [D]State;                                                                        
 var D._lock_pre: [D]Tid;                                                                           
 var y_pre: D;                                                                                      
 var C.a_pre: [C]Array.C.T;                                                                         
 var Array.C.T._state_pre: [Array.C.T]State;                                                        
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var D.c_pre: [D]C;                                                                                 
 var C._lock_pre: [C]Tid;                                                                           
 var w0_pre: C;                                                                                     
 var Array.C.T._length_pre: [Array.C.T]int;                                                         
 var x_pre: D;                                                                                      
 var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                   
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var v_pre: C;                                                                                      
 var w_pre: C;                                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_post: C;                                                                                    
 var D.c_post: [D]C;                                                                                
 var $recorded.state_post: int;                                                                     
 var y_post: D;                                                                                     
 var C.a_post: [C]Array.C.T;                                                                        
 var Array.C.T._state_post: [Array.C.T]State;                                                       
 var x_post: D;                                                                                     
 var D._state_post: [D]State;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var D._lock_post: [D]Tid;                                                                          
 var C._lock_post: [C]Tid;                                                                          
 var Array.C.T._elems_post: [Array.C.T]([int]int);                                                  
 var v_post: C;                                                                                     
 var Array.C.T._length_post: [Array.C.T]int;                                                        
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var w_post: C;                                                                                     
                                                                                                    
                                                                                                    
 _readByU := ReadEval.D.c(u: Tid,y: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.D.c(t: Tid,x: D,v: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 D.c[x] := v;                                                                                       
 assume C._state_post == C._state && C.a_post == C.a && C._lock_post == C._lock && Array.C.T._state_post == Array.C.T._state && Array.C.T._elems_post == Array.C.T._elems && Array.C.T._length_post == Array.C.T._length && D._state_post == D._state && D.c_post == D.c && D._lock_post == D._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.D.c(u: Tid,y: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): D.c is not Write-Read Stable with respect to D.c (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): D.c is not Write-Read Stable with respect to D.c (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): D.c is not Write-Read Stable with respect to D.c (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
requires ValidTid(tid);                                                                             
modifies C._state;                                                                                  
modifies C.a;                                                                                       
modifies C._lock;                                                                                   
modifies Array.C.T._state;                                                                          
modifies Array.C.T._elems;                                                                          
modifies D._state;                                                                                  
modifies D.c;                                                                                       
modifies D._lock;                                                                                   
ensures StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
ensures Y(tid , old(C._state), old(C.a), old(C._lock), old(Array.C.T._state), old(Array.C.T._elems), old(Array.C.T._length), old(D._state), old(D.c), old(D._lock) , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
                                                                                                    
// C.a:                                                                                             
                                                                                                    
function {:inline} Y_C.a(tid : Tid, this: C, newValue: Array.C.T , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid): bool
{                                                                                                   
 ((isAccessible(C._state[this], tid) && leq(m#moverPath(ReadEval.C.a(tid: Tid,this: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock)), _R)) ==> (C.a[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_C.a(tid : Tid, this: C, newValue: Array.C.T , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_C.a.Subsumes.W(tid : Tid, u : Tid, this: C, newValue: Array.C.T , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var D._lock_yield: [D]Tid;                                                                          
var this_yield: C;                                                                                  
var D._state_yield: [D]State;                                                                       
var tid_yield: Tid;                                                                                 
var Array.C.T._elems_yield: [Array.C.T]([int]int);                                                  
var $pc_yield: Phase;                                                                               
var newValue_yield: Array.C.T;                                                                      
var C.a_yield: [C]Array.C.T;                                                                        
var Array.C.T._length_yield: [Array.C.T]int;                                                        
var u_yield: Tid;                                                                                   
var Array.C.T._state_yield: [Array.C.T]State;                                                       
var D.c_yield: [D]C;                                                                                
var C._lock_yield: [C]Tid;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(C._state[this], tid);                                                          
 assume isAccessible(C._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.C.a(u: Tid,this: C,newValue: Array.C.T,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock)));
                                                                                                    
assume C._state_yield == C._state && C.a_yield == C.a && C._lock_yield == C._lock && Array.C.T._state_yield == Array.C.T._state && Array.C.T._elems_yield == Array.C.T._elems && Array.C.T._length_yield == Array.C.T._length && D._state_yield == D._state && D.c_yield == D.c && D._lock_yield == D._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_C.a(tid, this, newValue , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
                                                                                                    
procedure Y_C.a.Reflexive(tid : Tid, this: C , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var D._lock_yield: [D]Tid;                                                                          
var this_yield: C;                                                                                  
var D._state_yield: [D]State;                                                                       
var tid_yield: Tid;                                                                                 
var Array.C.T._elems_yield: [Array.C.T]([int]int);                                                  
var $pc_yield: Phase;                                                                               
var C.a_yield: [C]Array.C.T;                                                                        
var Array.C.T._length_yield: [Array.C.T]int;                                                        
var Array.C.T._state_yield: [Array.C.T]State;                                                       
var D.c_yield: [D]C;                                                                                
var C._lock_yield: [C]Tid;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(C._state[this], tid);                                                          
assume C._state_yield == C._state && C.a_yield == C.a && C._lock_yield == C._lock && Array.C.T._state_yield == Array.C.T._state && Array.C.T._elems_yield == Array.C.T._elems && Array.C.T._length_yield == Array.C.T._length && D._state_yield == D._state && D.c_yield == D.c && D._lock_yield == D._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_C.a(tid, this, C.a[this] , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
                                                                                                    
procedure Y_C.a.Transitive(tid : Tid, this: C, newValue : Array.C.T , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid , C._state_p: [C]State, C.a_p: [C]Array.C.T, C._lock_p: [C]Tid, Array.C.T._state_p: [Array.C.T]State, Array.C.T._elems_p: [Array.C.T]([int]int), Array.C.T._length_p: [Array.C.T]int, D._state_p: [D]State, D.c_p: [D]C, D._lock_p: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires StateInvariant(C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var D._state_pre: [D]State;                                                                         
var D._lock_pre: [D]Tid;                                                                            
var C.a_pre: [C]Array.C.T;                                                                          
var this_pre: C;                                                                                    
var Array.C.T._state_pre: [Array.C.T]State;                                                         
var $recorded.state_pre: int;                                                                       
var newValue_pre: Array.C.T;                                                                        
var D.c_pre: [D]C;                                                                                  
var C._lock_pre: [C]Tid;                                                                            
var Array.C.T._length_pre: [Array.C.T]int;                                                          
var tid_pre: Tid;                                                                                   
var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                    
var C._state_pre: [C]State;                                                                         
var $pc_pre: Phase;                                                                                 
                                                                                                    
var D.c_post: [D]C;                                                                                 
var $recorded.state_post: int;                                                                      
var C.a_post: [C]Array.C.T;                                                                         
var Array.C.T._state_post: [Array.C.T]State;                                                        
var D._state_post: [D]State;                                                                        
var $pc_post: Phase;                                                                                
var D._lock_post: [D]Tid;                                                                           
var C._lock_post: [C]Tid;                                                                           
var Array.C.T._elems_post: [Array.C.T]([int]int);                                                   
var tid_post: Tid;                                                                                  
var Array.C.T._length_post: [Array.C.T]int;                                                         
var newValue_post: Array.C.T;                                                                       
var this_post: C;                                                                                   
var C._state_post: [C]State;                                                                        
                                                                                                    
assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(C._state[this], tid);                                                          
 assume Y(tid , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock , C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
 assume Y_C.a(tid, this, newValue , C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
assume C._state_post == C._state_p && C.a_post == C.a_p && C._lock_post == C._lock_p && Array.C.T._state_post == Array.C.T._state_p && Array.C.T._elems_post == Array.C.T._elems_p && Array.C.T._length_post == Array.C.T._length_p && D._state_post == D._state_p && D.c_post == D.c_p && D._lock_post == D._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_C.a(tid, this, newValue , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
// C._lock:                                                                                         
                                                                                                    
function {:inline} Y_C._lock(tid : Tid, this: C, newValue: Tid , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid): bool
{                                                                                                   
 ((isAccessible(C._state[this], tid) && leq(m#moverPath(ReadEval.C._lock(tid: Tid,this: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock)), _R)) ==> (C._lock[this] == newValue))
 &&(((C._lock[this]==tid)==(newValue==tid)))                                                        
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_C._lock(tid : Tid, this: C, newValue: Tid , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_C._lock.Subsumes.W(tid : Tid, u : Tid, this: C, newValue: Tid , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var D._lock_yield: [D]Tid;                                                                          
var this_yield: C;                                                                                  
var newValue_yield: Tid;                                                                            
var D._state_yield: [D]State;                                                                       
var tid_yield: Tid;                                                                                 
var Array.C.T._elems_yield: [Array.C.T]([int]int);                                                  
var $pc_yield: Phase;                                                                               
var C.a_yield: [C]Array.C.T;                                                                        
var Array.C.T._length_yield: [Array.C.T]int;                                                        
var u_yield: Tid;                                                                                   
var Array.C.T._state_yield: [Array.C.T]State;                                                       
var D.c_yield: [D]C;                                                                                
var C._lock_yield: [C]Tid;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(C._state[this], tid);                                                          
 assume isAccessible(C._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.C._lock(u: Tid,this: C,newValue: Tid,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock)));
 assume leq(m#moverPath(ReadEval.C._lock(tid: Tid,this: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock)), _N);
assume C._state_yield == C._state && C.a_yield == C.a && C._lock_yield == C._lock && Array.C.T._state_yield == Array.C.T._state && Array.C.T._elems_yield == Array.C.T._elems && Array.C.T._length_yield == Array.C.T._length && D._state_yield == D._state && D.c_yield == D.c && D._lock_yield == D._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_C._lock(tid, this, newValue , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
                                                                                                    
procedure Y_C._lock.Reflexive(tid : Tid, this: C , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var D._lock_yield: [D]Tid;                                                                          
var this_yield: C;                                                                                  
var D._state_yield: [D]State;                                                                       
var tid_yield: Tid;                                                                                 
var Array.C.T._elems_yield: [Array.C.T]([int]int);                                                  
var $pc_yield: Phase;                                                                               
var C.a_yield: [C]Array.C.T;                                                                        
var Array.C.T._length_yield: [Array.C.T]int;                                                        
var Array.C.T._state_yield: [Array.C.T]State;                                                       
var D.c_yield: [D]C;                                                                                
var C._lock_yield: [C]Tid;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(C._state[this], tid);                                                          
assume C._state_yield == C._state && C.a_yield == C.a && C._lock_yield == C._lock && Array.C.T._state_yield == Array.C.T._state && Array.C.T._elems_yield == Array.C.T._elems && Array.C.T._length_yield == Array.C.T._length && D._state_yield == D._state && D.c_yield == D.c && D._lock_yield == D._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_C._lock(tid, this, C._lock[this] , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
                                                                                                    
procedure Y_C._lock.Transitive(tid : Tid, this: C, newValue : Tid , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid , C._state_p: [C]State, C.a_p: [C]Array.C.T, C._lock_p: [C]Tid, Array.C.T._state_p: [Array.C.T]State, Array.C.T._elems_p: [Array.C.T]([int]int), Array.C.T._length_p: [Array.C.T]int, D._state_p: [D]State, D.c_p: [D]C, D._lock_p: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires StateInvariant(C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var D._state_pre: [D]State;                                                                         
var D._lock_pre: [D]Tid;                                                                            
var C.a_pre: [C]Array.C.T;                                                                          
var this_pre: C;                                                                                    
var Array.C.T._state_pre: [Array.C.T]State;                                                         
var $recorded.state_pre: int;                                                                       
var D.c_pre: [D]C;                                                                                  
var C._lock_pre: [C]Tid;                                                                            
var Array.C.T._length_pre: [Array.C.T]int;                                                          
var tid_pre: Tid;                                                                                   
var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                    
var C._state_pre: [C]State;                                                                         
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var D.c_post: [D]C;                                                                                 
var $recorded.state_post: int;                                                                      
var C.a_post: [C]Array.C.T;                                                                         
var Array.C.T._state_post: [Array.C.T]State;                                                        
var D._state_post: [D]State;                                                                        
var $pc_post: Phase;                                                                                
var D._lock_post: [D]Tid;                                                                           
var C._lock_post: [C]Tid;                                                                           
var Array.C.T._elems_post: [Array.C.T]([int]int);                                                   
var tid_post: Tid;                                                                                  
var Array.C.T._length_post: [Array.C.T]int;                                                         
var this_post: C;                                                                                   
var C._state_post: [C]State;                                                                        
var newValue_post: Tid;                                                                             
                                                                                                    
assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(C._state[this], tid);                                                          
 assume Y(tid , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock , C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
 assume Y_C._lock(tid, this, newValue , C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
assume C._state_post == C._state_p && C.a_post == C.a_p && C._lock_post == C._lock_p && Array.C.T._state_post == Array.C.T._state_p && Array.C.T._elems_post == Array.C.T._elems_p && Array.C.T._length_post == Array.C.T._length_p && D._state_post == D._state_p && D.c_post == D.c_p && D._lock_post == D._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_C._lock(tid, this, newValue , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
// Array.C.T:                                                                                       
                                                                                                    
function {:inline} Y_Array.C.T(tid : Tid, athis: Array.C.T, index: int, newValue: int , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid): bool
{                                                                                                   
(var this := Array.C.T._this[athis];                                                                
 ((isAccessible(Array.C.T._state[athis], tid) && leq(m#moverPath(ReadEval.Array.C.T(tid: Tid,Array.C.T._this[athis]: C,athis: Array.C.T,index: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock)), _R)) ==> (Array.C.T._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.C.T(tid : Tid, athis: Array.C.T, index: int, newValue: int , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid): bool
{                                                                                                   
(var this := Array.C.T._this[athis];                                                                
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.C.T.Subsumes.W(tid : Tid, u : Tid, this: C, athis: Array.C.T, index: int, newValue: int , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.C.T._this[athis];                                                           
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var D._lock_yield: [D]Tid;                                                                          
var this_yield: C;                                                                                  
var D._state_yield: [D]State;                                                                       
var tid_yield: Tid;                                                                                 
var Array.C.T._elems_yield: [Array.C.T]([int]int);                                                  
var $pc_yield: Phase;                                                                               
var C.a_yield: [C]Array.C.T;                                                                        
var Array.C.T._length_yield: [Array.C.T]int;                                                        
var Array.C.T._state_yield: [Array.C.T]State;                                                       
var D.c_yield: [D]C;                                                                                
var index_yield: int;                                                                               
var C._lock_yield: [C]Tid;                                                                          
var athis_yield: Array.C.T;                                                                         
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.C.T._state[athis], u);                                                   
 assume !isError(m#moverPath(WriteEval.Array.C.T(u: Tid,Array.C.T._this[athis]: C,athis: Array.C.T,index: int,newValue: int,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock)));
                                                                                                    
assume C._state_yield == C._state && C.a_yield == C.a && C._lock_yield == C._lock && Array.C.T._state_yield == Array.C.T._state && Array.C.T._elems_yield == Array.C.T._elems && Array.C.T._length_yield == Array.C.T._length && D._state_yield == D._state && D.c_yield == D.c && D._lock_yield == D._lock && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.C.T(tid, athis, index, newValue , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
                                                                                                    
procedure Y_Array.C.T.Reflexive(tid : Tid, this: C, athis: Array.C.T, index: int , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(tid);                                                                            
 requires this == Array.C.T._this[athis];                                                           
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var D._lock_yield: [D]Tid;                                                                          
var this_yield: C;                                                                                  
var D._state_yield: [D]State;                                                                       
var tid_yield: Tid;                                                                                 
var Array.C.T._elems_yield: [Array.C.T]([int]int);                                                  
var $pc_yield: Phase;                                                                               
var C.a_yield: [C]Array.C.T;                                                                        
var Array.C.T._length_yield: [Array.C.T]int;                                                        
var Array.C.T._state_yield: [Array.C.T]State;                                                       
var D.c_yield: [D]C;                                                                                
var index_yield: int;                                                                               
var C._lock_yield: [C]Tid;                                                                          
var athis_yield: Array.C.T;                                                                         
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.C.T._state[athis], tid);                                                 
assume C._state_yield == C._state && C.a_yield == C.a && C._lock_yield == C._lock && Array.C.T._state_yield == Array.C.T._state && Array.C.T._elems_yield == Array.C.T._elems && Array.C.T._length_yield == Array.C.T._length && D._state_yield == D._state && D.c_yield == D.c && D._lock_yield == D._lock && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.C.T(tid, athis, index, Array.C.T._elems[athis][index] , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
                                                                                                    
procedure Y_Array.C.T.Transitive(tid : Tid, this: C, athis: Array.C.T, index: int, newValue : int , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid , C._state_p: [C]State, C.a_p: [C]Array.C.T, C._lock_p: [C]Tid, Array.C.T._state_p: [Array.C.T]State, Array.C.T._elems_p: [Array.C.T]([int]int), Array.C.T._length_p: [Array.C.T]int, D._state_p: [D]State, D.c_p: [D]C, D._lock_p: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires StateInvariant(C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
                                                                                                    
 requires this == Array.C.T._this[athis];                                                           
 requires ValidTid(tid);                                                                            
{                                                                                                   
var D._state_pre: [D]State;                                                                         
var D._lock_pre: [D]Tid;                                                                            
var C.a_pre: [C]Array.C.T;                                                                          
var this_pre: C;                                                                                    
var Array.C.T._state_pre: [Array.C.T]State;                                                         
var $recorded.state_pre: int;                                                                       
var D.c_pre: [D]C;                                                                                  
var C._lock_pre: [C]Tid;                                                                            
var index_pre: int;                                                                                 
var Array.C.T._length_pre: [Array.C.T]int;                                                          
var tid_pre: Tid;                                                                                   
var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                    
var C._state_pre: [C]State;                                                                         
var $pc_pre: Phase;                                                                                 
var athis_pre: Array.C.T;                                                                           
                                                                                                    
var D.c_post: [D]C;                                                                                 
var $recorded.state_post: int;                                                                      
var C.a_post: [C]Array.C.T;                                                                         
var Array.C.T._state_post: [Array.C.T]State;                                                        
var D._state_post: [D]State;                                                                        
var $pc_post: Phase;                                                                                
var D._lock_post: [D]Tid;                                                                           
var C._lock_post: [C]Tid;                                                                           
var Array.C.T._elems_post: [Array.C.T]([int]int);                                                   
var tid_post: Tid;                                                                                  
var Array.C.T._length_post: [Array.C.T]int;                                                         
var index_post: int;                                                                                
var this_post: C;                                                                                   
var C._state_post: [C]State;                                                                        
var athis_post: Array.C.T;                                                                          
                                                                                                    
assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume C._state_post == C._state_p && C.a_post == C.a_p && C._lock_post == C._lock_p && Array.C.T._state_post == Array.C.T._state_p && Array.C.T._elems_post == Array.C.T._elems_p && Array.C.T._length_post == Array.C.T._length_p && D._state_post == D._state_p && D.c_post == D.c_p && D._lock_post == D._lock_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.C.T._state[athis], tid);                                                 
 assume Y(tid , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock , C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
 assume Y_Array.C.T(tid, athis, index, newValue , C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
 assert Y_Array.C.T(tid, athis, index, newValue , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
// D.c:                                                                                             
                                                                                                    
function {:inline} Y_D.c(tid : Tid, this: D, newValue: C , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid): bool
{                                                                                                   
 ((isAccessible(D._state[this], tid) && leq(m#moverPath(ReadEval.D.c(tid: Tid,this: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock)), _R)) ==> (D.c[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_D.c(tid : Tid, this: D, newValue: C , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_D.c.Subsumes.W(tid : Tid, u : Tid, this: D, newValue: C , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var this_yield: D;                                                                                  
var D._lock_yield: [D]Tid;                                                                          
var D._state_yield: [D]State;                                                                       
var tid_yield: Tid;                                                                                 
var Array.C.T._elems_yield: [Array.C.T]([int]int);                                                  
var $pc_yield: Phase;                                                                               
var C.a_yield: [C]Array.C.T;                                                                        
var Array.C.T._length_yield: [Array.C.T]int;                                                        
var u_yield: Tid;                                                                                   
var Array.C.T._state_yield: [Array.C.T]State;                                                       
var D.c_yield: [D]C;                                                                                
var C._lock_yield: [C]Tid;                                                                          
var newValue_yield: C;                                                                              
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(D._state[this], tid);                                                          
 assume isAccessible(D._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.D.c(u: Tid,this: D,newValue: C,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock)));
                                                                                                    
assume C._state_yield == C._state && C.a_yield == C.a && C._lock_yield == C._lock && Array.C.T._state_yield == Array.C.T._state && Array.C.T._elems_yield == Array.C.T._elems && Array.C.T._length_yield == Array.C.T._length && D._state_yield == D._state && D.c_yield == D.c && D._lock_yield == D._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_D.c(tid, this, newValue , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
                                                                                                    
procedure Y_D.c.Reflexive(tid : Tid, this: D , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var this_yield: D;                                                                                  
var D._lock_yield: [D]Tid;                                                                          
var D._state_yield: [D]State;                                                                       
var tid_yield: Tid;                                                                                 
var Array.C.T._elems_yield: [Array.C.T]([int]int);                                                  
var $pc_yield: Phase;                                                                               
var C.a_yield: [C]Array.C.T;                                                                        
var Array.C.T._length_yield: [Array.C.T]int;                                                        
var Array.C.T._state_yield: [Array.C.T]State;                                                       
var D.c_yield: [D]C;                                                                                
var C._lock_yield: [C]Tid;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(D._state[this], tid);                                                          
assume C._state_yield == C._state && C.a_yield == C.a && C._lock_yield == C._lock && Array.C.T._state_yield == Array.C.T._state && Array.C.T._elems_yield == Array.C.T._elems && Array.C.T._length_yield == Array.C.T._length && D._state_yield == D._state && D.c_yield == D.c && D._lock_yield == D._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_D.c(tid, this, D.c[this] , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
                                                                                                    
procedure Y_D.c.Transitive(tid : Tid, this: D, newValue : C , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid , C._state_p: [C]State, C.a_p: [C]Array.C.T, C._lock_p: [C]Tid, Array.C.T._state_p: [Array.C.T]State, Array.C.T._elems_p: [Array.C.T]([int]int), Array.C.T._length_p: [Array.C.T]int, D._state_p: [D]State, D.c_p: [D]C, D._lock_p: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires StateInvariant(C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var D._state_pre: [D]State;                                                                         
var newValue_pre: C;                                                                                
var D._lock_pre: [D]Tid;                                                                            
var C.a_pre: [C]Array.C.T;                                                                          
var Array.C.T._state_pre: [Array.C.T]State;                                                         
var $recorded.state_pre: int;                                                                       
var D.c_pre: [D]C;                                                                                  
var C._lock_pre: [C]Tid;                                                                            
var Array.C.T._length_pre: [Array.C.T]int;                                                          
var tid_pre: Tid;                                                                                   
var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                    
var C._state_pre: [C]State;                                                                         
var $pc_pre: Phase;                                                                                 
var this_pre: D;                                                                                    
                                                                                                    
var D.c_post: [D]C;                                                                                 
var $recorded.state_post: int;                                                                      
var C.a_post: [C]Array.C.T;                                                                         
var Array.C.T._state_post: [Array.C.T]State;                                                        
var D._state_post: [D]State;                                                                        
var $pc_post: Phase;                                                                                
var D._lock_post: [D]Tid;                                                                           
var C._lock_post: [C]Tid;                                                                           
var Array.C.T._elems_post: [Array.C.T]([int]int);                                                   
var tid_post: Tid;                                                                                  
var Array.C.T._length_post: [Array.C.T]int;                                                         
var C._state_post: [C]State;                                                                        
var newValue_post: C;                                                                               
var this_post: D;                                                                                   
                                                                                                    
assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(D._state[this], tid);                                                          
 assume Y(tid , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock , C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
 assume Y_D.c(tid, this, newValue , C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
assume C._state_post == C._state_p && C.a_post == C.a_p && C._lock_post == C._lock_p && Array.C.T._state_post == Array.C.T._state_p && Array.C.T._elems_post == Array.C.T._elems_p && Array.C.T._length_post == Array.C.T._length_p && D._state_post == D._state_p && D.c_post == D.c_p && D._lock_post == D._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_D.c(tid, this, newValue , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
// D._lock:                                                                                         
                                                                                                    
function {:inline} Y_D._lock(tid : Tid, this: D, newValue: Tid , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid): bool
{                                                                                                   
 ((isAccessible(D._state[this], tid) && leq(m#moverPath(ReadEval.D._lock(tid: Tid,this: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock)), _R)) ==> (D._lock[this] == newValue))
 &&(((D._lock[this]==tid)==(newValue==tid)))                                                        
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_D._lock(tid : Tid, this: D, newValue: Tid , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_D._lock.Subsumes.W(tid : Tid, u : Tid, this: D, newValue: Tid , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var this_yield: D;                                                                                  
var D._lock_yield: [D]Tid;                                                                          
var newValue_yield: Tid;                                                                            
var D._state_yield: [D]State;                                                                       
var tid_yield: Tid;                                                                                 
var Array.C.T._elems_yield: [Array.C.T]([int]int);                                                  
var $pc_yield: Phase;                                                                               
var C.a_yield: [C]Array.C.T;                                                                        
var Array.C.T._length_yield: [Array.C.T]int;                                                        
var u_yield: Tid;                                                                                   
var Array.C.T._state_yield: [Array.C.T]State;                                                       
var D.c_yield: [D]C;                                                                                
var C._lock_yield: [C]Tid;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(D._state[this], tid);                                                          
 assume isAccessible(D._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.D._lock(u: Tid,this: D,newValue: Tid,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock)));
 assume leq(m#moverPath(ReadEval.D._lock(tid: Tid,this: D,C._state,C.a,C._lock,Array.C.T._state,Array.C.T._elems,Array.C.T._length,D._state,D.c,D._lock)), _N);
assume C._state_yield == C._state && C.a_yield == C.a && C._lock_yield == C._lock && Array.C.T._state_yield == Array.C.T._state && Array.C.T._elems_yield == Array.C.T._elems && Array.C.T._length_yield == Array.C.T._length && D._state_yield == D._state && D.c_yield == D.c && D._lock_yield == D._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_D._lock(tid, this, newValue , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
                                                                                                    
procedure Y_D._lock.Reflexive(tid : Tid, this: D , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var this_yield: D;                                                                                  
var D._lock_yield: [D]Tid;                                                                          
var D._state_yield: [D]State;                                                                       
var tid_yield: Tid;                                                                                 
var Array.C.T._elems_yield: [Array.C.T]([int]int);                                                  
var $pc_yield: Phase;                                                                               
var C.a_yield: [C]Array.C.T;                                                                        
var Array.C.T._length_yield: [Array.C.T]int;                                                        
var Array.C.T._state_yield: [Array.C.T]State;                                                       
var D.c_yield: [D]C;                                                                                
var C._lock_yield: [C]Tid;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(D._state[this], tid);                                                          
assume C._state_yield == C._state && C.a_yield == C.a && C._lock_yield == C._lock && Array.C.T._state_yield == Array.C.T._state && Array.C.T._elems_yield == Array.C.T._elems && Array.C.T._length_yield == Array.C.T._length && D._state_yield == D._state && D.c_yield == D.c && D._lock_yield == D._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_D._lock(tid, this, D._lock[this] , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
                                                                                                    
procedure Y_D._lock.Transitive(tid : Tid, this: D, newValue : Tid , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid , C._state_p: [C]State, C.a_p: [C]Array.C.T, C._lock_p: [C]Tid, Array.C.T._state_p: [Array.C.T]State, Array.C.T._elems_p: [Array.C.T]([int]int), Array.C.T._length_p: [Array.C.T]int, D._state_p: [D]State, D.c_p: [D]C, D._lock_p: [D]Tid)
 requires StateInvariant(C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
 requires StateInvariant(C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var D._state_pre: [D]State;                                                                         
var D._lock_pre: [D]Tid;                                                                            
var C.a_pre: [C]Array.C.T;                                                                          
var Array.C.T._state_pre: [Array.C.T]State;                                                         
var $recorded.state_pre: int;                                                                       
var D.c_pre: [D]C;                                                                                  
var C._lock_pre: [C]Tid;                                                                            
var Array.C.T._length_pre: [Array.C.T]int;                                                          
var tid_pre: Tid;                                                                                   
var Array.C.T._elems_pre: [Array.C.T]([int]int);                                                    
var C._state_pre: [C]State;                                                                         
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
var this_pre: D;                                                                                    
                                                                                                    
var D.c_post: [D]C;                                                                                 
var $recorded.state_post: int;                                                                      
var C.a_post: [C]Array.C.T;                                                                         
var Array.C.T._state_post: [Array.C.T]State;                                                        
var D._state_post: [D]State;                                                                        
var $pc_post: Phase;                                                                                
var D._lock_post: [D]Tid;                                                                           
var C._lock_post: [C]Tid;                                                                           
var Array.C.T._elems_post: [Array.C.T]([int]int);                                                   
var tid_post: Tid;                                                                                  
var Array.C.T._length_post: [Array.C.T]int;                                                         
var C._state_post: [C]State;                                                                        
var newValue_post: Tid;                                                                             
var this_post: D;                                                                                   
                                                                                                    
assume C._state_pre == C._state && C.a_pre == C.a && C._lock_pre == C._lock && Array.C.T._state_pre == Array.C.T._state && Array.C.T._elems_pre == Array.C.T._elems && Array.C.T._length_pre == Array.C.T._length && D._state_pre == D._state && D.c_pre == D.c && D._lock_pre == D._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(D._state[this], tid);                                                          
 assume Y(tid , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock , C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
 assume Y_D._lock(tid, this, newValue , C._state_p, C.a_p, C._lock_p, Array.C.T._state_p, Array.C.T._elems_p, Array.C.T._length_p, D._state_p, D.c_p, D._lock_p);
assume C._state_post == C._state_p && C.a_post == C.a_p && C._lock_post == C._lock_p && Array.C.T._state_post == Array.C.T._state_p && Array.C.T._elems_post == Array.C.T._elems_p && Array.C.T._length_post == Array.C.T._length_p && D._state_post == D._state_p && D.c_post == D.c_p && D._lock_post == D._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_D._lock(tid, this, newValue , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , C._state: [C]State, C.a: [C]Array.C.T, C._lock: [C]Tid, Array.C.T._state: [Array.C.T]State, Array.C.T._elems: [Array.C.T]([int]int), Array.C.T._length: [Array.C.T]int, D._state: [D]State, D.c: [D]C, D._lock: [D]Tid , C._state_p: [C]State, C.a_p: [C]Array.C.T, C._lock_p: [C]Tid, Array.C.T._state_p: [Array.C.T]State, Array.C.T._elems_p: [Array.C.T]([int]int), Array.C.T._length_p: [Array.C.T]int, D._state_p: [D]State, D.c_p: [D]C, D._lock_p: [D]Tid): bool
{                                                                                                   
 (forall this: C :: Y_C.a(tid : Tid, this, C.a_p[this] , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock))
 && (forall this: C :: Y_C._lock(tid : Tid, this, C._lock_p[this] , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock))
 && (forall this: D :: Y_D.c(tid : Tid, this, D.c_p[this] , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock))
 && (forall this: D :: Y_D._lock(tid : Tid, this, D._lock_p[this] , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock))
 && (forall athis: Array.C.T, index: int :: Y_Array.C.T(tid : Tid, athis, index, Array.C.T._elems_p[athis][index] , C._state, C.a, C._lock, Array.C.T._state, Array.C.T._elems, Array.C.T._length, D._state, D.c, D._lock))
 && (forall _i : C :: isShared(C._state[_i]) ==> isShared(C._state_p[_i]))                          
 && (forall _i : C :: isLocal(C._state[_i], tid) <==> isLocal(C._state_p[_i], tid))                 
 && (forall _i : D :: isShared(D._state[_i]) ==> isShared(D._state_p[_i]))                          
 && (forall _i : D :: isLocal(D._state[_i], tid) <==> isLocal(D._state_p[_i], tid))                 
 && (forall _i : Array.C.T :: isShared(Array.C.T._state[_i]) ==> isShared(Array.C.T._state_p[_i]))  
 && (forall _i : Array.C.T :: Array.C.T._length[_i] == Array.C.T._length_p[_i])                     
 && (forall _i : Array.C.T :: isLocal(Array.C.T._state[_i], tid) <==> isLocal(Array.C.T._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 747.1-747.34: (6.5): C.a failed Write-Write Right-Mover Check
// 816.1-816.30: (6.5): C.a failed Write-Read Right-Mover Check
// 889.1-889.34: (6.5): C.a failed Write-Write Left-Mover Check
// 959.1-959.30: (6.5): C.a failed Write-Read Left-Mover Check
// 1026.1-1026.34: (6.5): C.a failed Read-Write Right-Mover Check
// 1096.1-1096.34: (6.5): C.a failed Read-Write Left-Mover Check
// 1171.1-1171.34: (4.5): Array Array.C.T failed Write-Write Right-Mover Check
// 1246.1-1246.30: (4.5): Array Array.C.T failed Write-Read Right-Mover Check
// 1325.1-1325.34: (4.5): Array Array.C.T failed Write-Write Left-Mover Check
// 1401.1-1401.30: (4.5): Array Array.C.T failed Write-Read Left-Mover Check
// 1474.1-1474.34: (4.5): Array Array.C.T failed Read-Write Right-Mover Check
// 1550.1-1550.34: (4.5): Array Array.C.T failed Read-Write Left-Mover Check
// 1619.1-1619.34: (12.5): D.c failed Write-Write Right-Mover Check
// 1688.1-1688.30: (12.5): D.c failed Write-Read Right-Mover Check
// 1761.1-1761.34: (12.5): D.c failed Write-Write Left-Mover Check
// 1831.1-1831.30: (12.5): D.c failed Write-Read Left-Mover Check
// 1898.1-1898.34: (12.5): D.c failed Read-Write Right-Mover Check
// 1968.1-1968.34: (12.5): D.c failed Read-Write Left-Mover Check
// 2049.1-2049.140: (6.5): C.a is not Write-Write Stable with respect to C.a (case A.1)
// 2050.1-2050.101: (6.5): C.a is not Write-Write Stable with respect to C.a (case A.2)
// 2051.1-2051.158: (6.5): C.a is not Write-Write Stable with respect to C.a (case A.3)
// 2162.1-2162.140: (6.5): C.a is not Write-Write Stable with respect to C.a (case C)
// 2278.1-2278.144: (6.5): C.a is not Write-Write Stable with respect to C.a (case D)
// 2279.1-2279.144: (6.5): C.a is not Write-Write Stable with respect to C.a (case R)
// 2360.1-2360.136: (6.5): C.a is not Read-Write Stable with respect to C.a (case F)
// 2361.1-2361.136: (6.5): C.a is not Read-Write Stable with respect to C.a (case H)
// 2362.1-2362.146: (6.5): C.a is not Read-Write Stable with respect to C.a (case I)
// 2442.1-2442.136: (6.5): C.a is not Write-Read Stable with respect to C.a (case J)
// 2443.1-2443.136: (6.5): C.a is not Write-Read Stable with respect to C.a (case K)
// 2444.1-2444.99: (6.5): C.a is not Write-Read Stable with respect to C.a (case L)
// 2531.1-2531.140: (4.5): Array Array.C.T is not Write-Write Stable with respect to C.a (case A.1)
// 2532.1-2532.101: (4.5): Array Array.C.T is not Write-Write Stable with respect to C.a (case A.2)
// 2533.1-2533.156: (4.5): Array Array.C.T is not Write-Write Stable with respect to C.a (case A.3)
// 2651.1-2651.140: (6.5): C.a is not Write-Write Stable with respect to Array Array.C.T (case C)
// 2774.1-2774.144: (6.5): C.a is not Write-Write Stable with respect to Array Array.C.T (case D)
// 2775.1-2775.144: (6.5): C.a is not Write-Write Stable with respect to Array Array.C.T (case R)
// 2861.1-2861.136: (6.5): C.a is not Read-Write Stable with respect to Array Array.C.T (case F)
// 2862.1-2862.136: (6.5): C.a is not Read-Write Stable with respect to Array Array.C.T (case H)
// 2863.1-2863.144: (6.5): C.a is not Read-Write Stable with respect to Array Array.C.T (case I)
// 2948.1-2948.136: (4.5): Array Array.C.T is not Write-Read Stable with respect to C.a (case J)
// 2949.1-2949.136: (4.5): Array Array.C.T is not Write-Read Stable with respect to C.a (case K)
// 2950.1-2950.99: (4.5): Array Array.C.T is not Write-Read Stable with respect to C.a (case L)
// 3032.1-3032.140: (12.5): D.c is not Write-Write Stable with respect to C.a (case A.1)
// 3033.1-3033.101: (12.5): D.c is not Write-Write Stable with respect to C.a (case A.2)
// 3034.1-3034.156: (12.5): D.c is not Write-Write Stable with respect to C.a (case A.3)
// 3145.1-3145.140: (6.5): C.a is not Write-Write Stable with respect to D.c (case C)
// 3261.1-3261.144: (6.5): C.a is not Write-Write Stable with respect to D.c (case D)
// 3262.1-3262.144: (6.5): C.a is not Write-Write Stable with respect to D.c (case R)
// 3343.1-3343.136: (6.5): C.a is not Read-Write Stable with respect to D.c (case F)
// 3344.1-3344.136: (6.5): C.a is not Read-Write Stable with respect to D.c (case H)
// 3345.1-3345.144: (6.5): C.a is not Read-Write Stable with respect to D.c (case I)
// 3425.1-3425.136: (12.5): D.c is not Write-Read Stable with respect to C.a (case J)
// 3426.1-3426.136: (12.5): D.c is not Write-Read Stable with respect to C.a (case K)
// 3427.1-3427.99: (12.5): D.c is not Write-Read Stable with respect to C.a (case L)
// 3514.1-3514.140: (6.5): C.a is not Write-Write Stable with respect to Array Array.C.T (case A.1)
// 3515.1-3515.101: (6.5): C.a is not Write-Write Stable with respect to Array Array.C.T (case A.2)
// 3516.1-3516.156: (6.5): C.a is not Write-Write Stable with respect to Array Array.C.T (case A.3)
// 3634.1-3634.140: (4.5): Array Array.C.T is not Write-Write Stable with respect to C.a (case C)
// 3757.1-3757.144: (4.5): Array Array.C.T is not Write-Write Stable with respect to C.a (case D)
// 3758.1-3758.144: (4.5): Array Array.C.T is not Write-Write Stable with respect to C.a (case R)
// 3844.1-3844.136: (4.5): Array Array.C.T is not Read-Write Stable with respect to C.a (case F)
// 3845.1-3845.136: (4.5): Array Array.C.T is not Read-Write Stable with respect to C.a (case H)
// 3846.1-3846.144: (4.5): Array Array.C.T is not Read-Write Stable with respect to C.a (case I)
// 3931.1-3931.136: (6.5): C.a is not Write-Read Stable with respect to Array Array.C.T (case J)
// 3932.1-3932.136: (6.5): C.a is not Write-Read Stable with respect to Array Array.C.T (case K)
// 3933.1-3933.99: (6.5): C.a is not Write-Read Stable with respect to Array Array.C.T (case L)
// 4025.1-4025.140: (4.5): Array Array.C.T is not Write-Write Stable with respect to Array Array.C.T (case A.1)
// 4026.1-4026.101: (4.5): Array Array.C.T is not Write-Write Stable with respect to Array Array.C.T (case A.2)
// 4027.1-4027.156: (4.5): Array Array.C.T is not Write-Write Stable with respect to Array Array.C.T (case A.3)
// 4152.1-4152.140: (4.5): Array Array.C.T is not Write-Write Stable with respect to Array Array.C.T (case C)
// 4282.1-4282.144: (4.5): Array Array.C.T is not Write-Write Stable with respect to Array Array.C.T (case D)
// 4283.1-4283.144: (4.5): Array Array.C.T is not Write-Write Stable with respect to Array Array.C.T (case R)
// 4374.1-4374.136: (4.5): Array Array.C.T is not Read-Write Stable with respect to Array Array.C.T (case F)
// 4375.1-4375.136: (4.5): Array Array.C.T is not Read-Write Stable with respect to Array Array.C.T (case H)
// 4376.1-4376.144: (4.5): Array Array.C.T is not Read-Write Stable with respect to Array Array.C.T (case I)
// 4466.1-4466.136: (4.5): Array Array.C.T is not Write-Read Stable with respect to Array Array.C.T (case J)
// 4467.1-4467.136: (4.5): Array Array.C.T is not Write-Read Stable with respect to Array Array.C.T (case K)
// 4468.1-4468.99: (4.5): Array Array.C.T is not Write-Read Stable with respect to Array Array.C.T (case L)
// 4555.1-4555.140: (12.5): D.c is not Write-Write Stable with respect to Array Array.C.T (case A.1)
// 4556.1-4556.101: (12.5): D.c is not Write-Write Stable with respect to Array Array.C.T (case A.2)
// 4557.1-4557.156: (12.5): D.c is not Write-Write Stable with respect to Array Array.C.T (case A.3)
// 4675.1-4675.140: (4.5): Array Array.C.T is not Write-Write Stable with respect to D.c (case C)
// 4798.1-4798.144: (4.5): Array Array.C.T is not Write-Write Stable with respect to D.c (case D)
// 4799.1-4799.144: (4.5): Array Array.C.T is not Write-Write Stable with respect to D.c (case R)
// 4885.1-4885.136: (4.5): Array Array.C.T is not Read-Write Stable with respect to D.c (case F)
// 4886.1-4886.136: (4.5): Array Array.C.T is not Read-Write Stable with respect to D.c (case H)
// 4887.1-4887.144: (4.5): Array Array.C.T is not Read-Write Stable with respect to D.c (case I)
// 4972.1-4972.136: (12.5): D.c is not Write-Read Stable with respect to Array Array.C.T (case J)
// 4973.1-4973.136: (12.5): D.c is not Write-Read Stable with respect to Array Array.C.T (case K)
// 4974.1-4974.99: (12.5): D.c is not Write-Read Stable with respect to Array Array.C.T (case L)
// 5056.1-5056.140: (6.5): C.a is not Write-Write Stable with respect to D.c (case A.1)
// 5057.1-5057.101: (6.5): C.a is not Write-Write Stable with respect to D.c (case A.2)
// 5058.1-5058.156: (6.5): C.a is not Write-Write Stable with respect to D.c (case A.3)
// 5169.1-5169.140: (12.5): D.c is not Write-Write Stable with respect to C.a (case C)
// 5285.1-5285.144: (12.5): D.c is not Write-Write Stable with respect to C.a (case D)
// 5286.1-5286.144: (12.5): D.c is not Write-Write Stable with respect to C.a (case R)
// 5367.1-5367.136: (12.5): D.c is not Read-Write Stable with respect to C.a (case F)
// 5368.1-5368.136: (12.5): D.c is not Read-Write Stable with respect to C.a (case H)
// 5369.1-5369.144: (12.5): D.c is not Read-Write Stable with respect to C.a (case I)
// 5449.1-5449.136: (6.5): C.a is not Write-Read Stable with respect to D.c (case J)
// 5450.1-5450.136: (6.5): C.a is not Write-Read Stable with respect to D.c (case K)
// 5451.1-5451.99: (6.5): C.a is not Write-Read Stable with respect to D.c (case L)
// 5538.1-5538.140: (4.5): Array Array.C.T is not Write-Write Stable with respect to D.c (case A.1)
// 5539.1-5539.101: (4.5): Array Array.C.T is not Write-Write Stable with respect to D.c (case A.2)
// 5540.1-5540.156: (4.5): Array Array.C.T is not Write-Write Stable with respect to D.c (case A.3)
// 5658.1-5658.140: (12.5): D.c is not Write-Write Stable with respect to Array Array.C.T (case C)
// 5781.1-5781.144: (12.5): D.c is not Write-Write Stable with respect to Array Array.C.T (case D)
// 5782.1-5782.144: (12.5): D.c is not Write-Write Stable with respect to Array Array.C.T (case R)
// 5868.1-5868.136: (12.5): D.c is not Read-Write Stable with respect to Array Array.C.T (case F)
// 5869.1-5869.136: (12.5): D.c is not Read-Write Stable with respect to Array Array.C.T (case H)
// 5870.1-5870.144: (12.5): D.c is not Read-Write Stable with respect to Array Array.C.T (case I)
// 5955.1-5955.136: (4.5): Array Array.C.T is not Write-Read Stable with respect to D.c (case J)
// 5956.1-5956.136: (4.5): Array Array.C.T is not Write-Read Stable with respect to D.c (case K)
// 5957.1-5957.99: (4.5): Array Array.C.T is not Write-Read Stable with respect to D.c (case L)
// 6039.1-6039.140: (12.5): D.c is not Write-Write Stable with respect to D.c (case A.1)
// 6040.1-6040.101: (12.5): D.c is not Write-Write Stable with respect to D.c (case A.2)
// 6041.1-6041.158: (12.5): D.c is not Write-Write Stable with respect to D.c (case A.3)
// 6152.1-6152.140: (12.5): D.c is not Write-Write Stable with respect to D.c (case C)
// 6268.1-6268.144: (12.5): D.c is not Write-Write Stable with respect to D.c (case D)
// 6269.1-6269.144: (12.5): D.c is not Write-Write Stable with respect to D.c (case R)
// 6350.1-6350.136: (12.5): D.c is not Read-Write Stable with respect to D.c (case F)
// 6351.1-6351.136: (12.5): D.c is not Read-Write Stable with respect to D.c (case H)
// 6352.1-6352.146: (12.5): D.c is not Read-Write Stable with respect to D.c (case I)
// 6432.1-6432.136: (12.5): D.c is not Write-Read Stable with respect to D.c (case J)
// 6433.1-6433.136: (12.5): D.c is not Write-Read Stable with respect to D.c (case K)
// 6434.1-6434.99: (12.5): D.c is not Write-Read Stable with respect to D.c (case L)
// 6470.1-6495.2: (6.5): yields_as clause for C.a is not valid
// 6500.1-6520.2: (6.5): yields_as clause for C.a is not reflexive
// 6526.1-6566.2: (6.5): yields_as clause for C.a is not transitive
// 6586.1-6611.2: (7.32): yields_as clause for C._lock is not valid
// 6616.1-6636.2: (7.32): yields_as clause for C._lock is not reflexive
// 6642.1-6682.2: (7.32): yields_as clause for C._lock is not transitive
// 6700.1-6729.2: (4.5): yields_as clause for Array.C.T is not valid
// 6730.1-6756.2: (4.5): yields_as clause for Array.C.T is not reflexive
// 6761.1-6805.2: (4.5): yields_as clause for Array.C.T is not transitive
// 6824.1-6849.2: (12.5): yields_as clause for D.c is not valid
// 6854.1-6874.2: (12.5): yields_as clause for D.c is not reflexive
// 6880.1-6920.2: (12.5): yields_as clause for D.c is not transitive
// 6940.1-6965.2: (7.32): yields_as clause for D._lock is not valid
// 6970.1-6990.2: (7.32): yields_as clause for D._lock is not reflexive
// 6996.1-7036.2: (7.32): yields_as clause for D._lock is not transitive
