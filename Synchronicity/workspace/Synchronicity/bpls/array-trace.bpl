                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/array-trace.anchor:                      
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Vector {                                                                                  
      array T = int[index == tid ? B : E]                                                           
                                                                                                    
       [Vector.T{this}] elems isRead ? B : E                                                        
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.elems == [Vector.T{this}].null;                                                 
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        [Vector.T{this}] tmp1;                                                                      
        tmp1 := this.elems;                                                                         
        int tmp2;                                                                                   
        tmp2 = 0;                                                                                   
        int tmp3;                                                                                   
        tmp3 = 3;                                                                                   
        tmp1[tmp2] := tmp3;                                                                         
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Vector {                                                                                  
      array T = int[index == tid ? B : E]                                                           
                                                                                                    
       [Vector.T{this}] elems isRead ? B : E                                                        
                                                                                                    
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
        assume this.elems == [Vector.T{this}].null;                                                 
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        [Vector.T{this}] tmp1;                                                                      
        tmp1 := this.elems;                                                                         
        int tmp2;                                                                                   
        tmp2 = 0;                                                                                   
        int tmp3;                                                                                   
        tmp3 = 3;                                                                                   
        tmp1[tmp2] := tmp3;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Vector {                                                                                  
      array T = int[index == tid ? B : E]                                                           
                                                                                                    
       [Vector.T{this}] elems isRead ? B : E                                                        
                                                                                                    
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
        assume this.elems == [Vector.T{this}].null;                                                 
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        [Vector.T{this}] tmp1;                                                                      
        tmp1 := this.elems;                                                                         
        int tmp2;                                                                                   
        tmp2 = 0;                                                                                   
        int tmp3;                                                                                   
        tmp3 = 3;                                                                                   
        tmp1[tmp2] := tmp3;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Vector {                                                                                  
      array T = int[index == tid ? B : E]                                                           
                                                                                                    
       [Vector.T{this}] elems isRead ? B : E                                                        
                                                                                                    
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
        assume this.elems == [Vector.T{this}].null;                                                 
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        [Vector.T{this}] tmp1;                                                                      
        tmp1 := this.elems;                                                                         
        int tmp2;                                                                                   
        tmp2 = 0;                                                                                   
        int tmp3;                                                                                   
        tmp3 = 3;                                                                                   
        tmp1[tmp2] := tmp3;                                                                         
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
                                                                                                    
                                                                                                    
/*** Class Decl Vector ***/                                                                         
                                                                                                    
type Vector;                                                                                        
const unique Vector.null: Vector;                                                                   
var Vector._state: [Vector]State;                                                                   
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Vector.elems: [Vector]Array.Vector.T;                                                           
                                                                                                    
function {:inline} ReadEval.Vector.elems(tid: Tid,this : Vector,Vector._state: [Vector]State,Vector.elems: [Vector]Array.Vector.T,Vector._lock: [Vector]Tid,Array.Vector.T._state: [Array.Vector.T]State,Array.Vector.T._elems: [Array.Vector.T]([int]int),Array.Vector.T._length: [Array.Vector.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Array.Vector.T.null;                                                              
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Vector.elems(tid: Tid,this : Vector,newValue: Array.Vector.T,Vector._state: [Vector]State,Vector.elems: [Vector]Array.Vector.T,Vector._lock: [Vector]Tid,Array.Vector.T._state: [Array.Vector.T]State,Array.Vector.T._elems: [Array.Vector.T]([int]int),Array.Vector.T._length: [Array.Vector.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Vector._lock: [Vector]Tid;                                                                      
                                                                                                    
function {:inline} ReadEval.Vector._lock(tid: Tid,this : Vector,Vector._state: [Vector]State,Vector.elems: [Vector]Array.Vector.T,Vector._lock: [Vector]Tid,Array.Vector.T._state: [Array.Vector.T]State,Array.Vector.T._elems: [Array.Vector.T]([int]int),Array.Vector.T._length: [Array.Vector.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Vector._state[this], tid)) then                                                        
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Vector._lock[this]==tid)) then                                                              
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Vector._lock[this]==Tid.null)&&(newValue==tid))) then                                      
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Vector._lock[this]==tid)&&(newValue==Tid.null))) then                                     
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Vector._lock(tid: Tid,this : Vector,newValue: Tid,Vector._state: [Vector]State,Vector.elems: [Vector]Array.Vector.T,Vector._lock: [Vector]Tid,Array.Vector.T._state: [Array.Vector.T]State,Array.Vector.T._elems: [Array.Vector.T]([int]int),Array.Vector.T._length: [Array.Vector.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Vector._state[this], tid)) then                                                        
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Vector._lock[this]==tid)) then                                                              
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Vector._lock[this]==Tid.null)&&(newValue==tid))) then                                      
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Vector._lock[this]==tid)&&(newValue==Tid.null))) then                                     
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Vector.f(tid:Tid, this : Vector)                                                         
modifies Vector._state;                                                                             
modifies Vector.elems;                                                                              
modifies Vector._lock;                                                                              
modifies Array.Vector.T._state;                                                                     
modifies Array.Vector.T._elems;                                                                     
                                                                                                    
requires ValidTid(tid);                                                                                    // (10.5): Bad tid
requires isShared(Vector._state[this]);                                                                    // (10.5): this is not global
                                                                                                    
requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
                                                                                                    
ensures StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
{                                                                                                   
 var Vector.elems144842: [Vector]Array.Vector.T;                                                    
 var tmp1144824: Array.Vector.T;                                                                    
 var Array.Vector.T._state144824: [Array.Vector.T]State;                                            
 var tid144842: Tid;                                                                                
 var path144842: int;                                                                               
 var Vector._lock144842: [Vector]Tid;                                                               
 var $pc144842: Phase;                                                                              
 var $recorded.state144824: int;                                                                    
 var tmp2144843: int;                                                                               
 var Vector.elems144843: [Vector]Array.Vector.T;                                                    
 var tmp2144842: int;                                                                               
 var this144843: Vector;                                                                            
 var mover144824: Mover;                                                                            
 var $recorded.state144843: int;                                                                    
 var tmp3144843: int;                                                                               
 var Array.Vector.T._elems144824: [Array.Vector.T]([int]int);                                       
 var tid144824: Tid;                                                                                
 var Vector._state144843: [Vector]State;                                                            
 var Array.Vector.T._state144843: [Array.Vector.T]State;                                            
 var Vector.elems144824: [Vector]Array.Vector.T;                                                    
 var Vector._state144842: [Vector]State;                                                            
 var mover144842: Mover;                                                                            
 var $pc144824: Phase;                                                                              
 var $pc144843: Phase;                                                                              
 var moverPath144824: MoverPath;                                                                    
 var Vector._lock144843: [Vector]Tid;                                                               
 var tmp1144842: Array.Vector.T;                                                                    
 var Array.Vector.T._length144843: [Array.Vector.T]int;                                             
 var Array.Vector.T._state144842: [Array.Vector.T]State;                                            
 var Array.Vector.T._elems144843: [Array.Vector.T]([int]int);                                       
 var path144824: int;                                                                               
 var this144824: Vector;                                                                            
 var $recorded.state144842: int;                                                                    
 var moverPath144842: MoverPath;                                                                    
 var tmp3144842: int;                                                                               
 var Array.Vector.T._elems144842: [Array.Vector.T]([int]int);                                       
 var this144842: Vector;                                                                            
 var tmp3: int;                                                                                     
 var Vector._state144824: [Vector]State;                                                            
 var tmp1144843: Array.Vector.T;                                                                    
 var tmp1: Array.Vector.T;                                                                          
 var Array.Vector.T._length144824: [Array.Vector.T]int;                                             
 var tmp2: int;                                                                                     
 var Vector._lock144824: [Vector]Tid;                                                               
 var tid144843: Tid;                                                                                
 var Array.Vector.T._length144842: [Array.Vector.T]int;                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 11.9: [Vector.T{this}] tmp1;                                                                    
                                                                                                    
                                                                                                    
 // 11.9: tmp1 := this.elems;                                                                       
                                                                                                    
                                                                                                    
 moverPath144824 := ReadEval.Vector.elems(tid: Tid,this: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 mover144824 := m#moverPath(moverPath144824);                                                       
 path144824 := p#moverPath(moverPath144824);                                                        
 assume Vector._state144824 == Vector._state && Vector.elems144824 == Vector.elems && Vector._lock144824 == Vector._lock && Array.Vector.T._state144824 == Array.Vector.T._state && Array.Vector.T._elems144824 == Array.Vector.T._elems && Array.Vector.T._length144824 == Array.Vector.T._length && tmp1144824 == tmp1 && this144824 == this && tid144824 == tid && $pc144824 == $pc;
 assume $recorded.state144824 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Vector.null;                                                                       
 } else {                                                                                           
  assert this != Vector.null;                                                                              // (11.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover144824);                                                               
 assert $pc != PhaseError;                                                                                 // (11.9): Reduction failure
 tmp1 := Vector.elems[this];                                                                        
                                                                                                    
 // 11.9: int tmp2;                                                                                 
                                                                                                    
                                                                                                    
 // 11.9: tmp2 = 0;                                                                                 
                                                                                                    
 tmp2 := 0;                                                                                         
                                                                                                    
 // 11.9: int tmp3;                                                                                 
                                                                                                    
                                                                                                    
 // 11.9: tmp3 = 3;                                                                                 
                                                                                                    
 tmp3 := 3;                                                                                         
                                                                                                    
 // 11.9: tmp1[tmp2] := tmp3;                                                                       
                                                                                                    
                                                                                                    
 moverPath144842 := WriteEval.Array.Vector.T(tid: Tid,this: Vector,tmp1: Array.Vector.T,tmp2: int,tmp3: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 mover144842 := m#moverPath(moverPath144842);                                                       
 path144842 := p#moverPath(moverPath144842);                                                        
 assume Vector._state144842 == Vector._state && Vector.elems144842 == Vector.elems && Vector._lock144842 == Vector._lock && Array.Vector.T._state144842 == Array.Vector.T._state && Array.Vector.T._elems144842 == Array.Vector.T._elems && Array.Vector.T._length144842 == Array.Vector.T._length && tmp3144842 == tmp3 && tmp2144842 == tmp2 && tmp1144842 == tmp1 && this144842 == this && tid144842 == tid && $pc144842 == $pc;
 assume $recorded.state144842 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume tmp1 != Array.Vector.T.null;                                                               
 } else {                                                                                           
  assert tmp1 != Array.Vector.T.null;                                                                      // (11.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tmp2;                                                                                 
 } else {                                                                                           
  assert 0 <= tmp2;                                                                                        // (11.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tmp2 < Array.Vector.T._length[tmp1];                                                       
 } else {                                                                                           
  assert tmp2 < Array.Vector.T._length[tmp1];                                                              // (11.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover144842);                                                               
 assert $pc != PhaseError;                                                                                 // (11.9): Reduction failure
 Array.Vector.T._elems[tmp1][tmp2] := tmp3;                                                         
                                                                                                    
 // 10.21: // return;                                                                               
                                                                                                    
 assume Vector._state144843 == Vector._state && Vector.elems144843 == Vector.elems && Vector._lock144843 == Vector._lock && Array.Vector.T._state144843 == Array.Vector.T._state && Array.Vector.T._elems144843 == Array.Vector.T._elems && Array.Vector.T._length144843 == Array.Vector.T._length && tmp3144843 == tmp3 && tmp2144843 == tmp2 && tmp1144843 == tmp1 && this144843 == this && tid144843 == tid;
 assume $recorded.state144843 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
/*** Array Array.Vector.T ***/                                                                      
                                                                                                    
type Array.Vector.T;                                                                                
const unique Array.Vector.T.null: Array.Vector.T;                                                   
var Array.Vector.T._state: [Array.Vector.T]State;                                                   
                                                                                                    
const Array.Vector.T._this : [Array.Vector.T]Vector;                                                
const Array.Vector.T._length : [Array.Vector.T]int;                                                 
var Array.Vector.T._elems  : [Array.Vector.T]([int]int);                                            
                                                                                                    
axiom (forall $this : Array.Vector.T :: Array.Vector.T._length[$this] >= 0);                        
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.Vector.T: Spec(Cond(BinaryExpr(VarAccess(index),VarAccess(tid),EQ()),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.Vector.T(tid: Tid,this : Vector,athis : Array.Vector.T,index : int,Vector._state: [Vector]State,Vector.elems: [Vector]Array.Vector.T,Vector._lock: [Vector]Tid,Array.Vector.T._state: [Array.Vector.T]State,Array.Vector.T._elems: [Array.Vector.T]([int]int),Array.Vector.T._length: [Array.Vector.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 if ((index==tid)) then                                                                             
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.Vector.T: Spec(Cond(BinaryExpr(VarAccess(index),VarAccess(tid),EQ()),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.Vector.T(tid: Tid,this : Vector,athis : Array.Vector.T,index : int,newValue: int,Vector._state: [Vector]State,Vector.elems: [Vector]Array.Vector.T,Vector._lock: [Vector]Tid,Array.Vector.T._state: [Array.Vector.T]State,Array.Vector.T._elems: [Array.Vector.T]([int]int),Array.Vector.T._length: [Array.Vector.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((index==tid)) then                                                                             
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Vector._state: [Vector]State,Vector.elems: [Vector]Array.Vector.T,Vector._lock: [Vector]Tid,Array.Vector.T._state: [Array.Vector.T]State,Array.Vector.T._elems: [Array.Vector.T]([int]int),Array.Vector.T._length: [Array.Vector.T]int) returns (bool) {
  true &&                                                                                           
  (forall _i: Vector  :: _i == Vector.null <==> isNull(Vector._state[_i])) &&                       
  (forall _i: Array.Vector.T  :: _i == Array.Vector.T.null <==> isNull(Array.Vector.T._state[_i])) &&
  (forall _t: Tid, _i: Array.Vector.T  :: ValidTid(_t) && isAccessible(Array.Vector.T._state[_i], _t) ==> isAccessible(Vector._state[Array.Vector.T._this[_i]], _t)) &&
  (forall _i: Vector ::  (isShared(Vector._state[_i]) ==> isSharedAssignable(Array.Vector.T._state[Vector.elems[_i]]))) &&
  (forall _i: Vector ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Vector._state[_i],_t) ==> isLocalAssignable(Array.Vector.T._state[Vector.elems[_i]], _t)))) &&
  (forall _i: Vector :: { Vector.elems[_i] } Array.Vector.T._this[Vector.elems[_i]] == _i) &&       
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Vector.elems(t: Tid, u: Tid, v: Array.Vector.T, w: Array.Vector.T, x: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Vector._state[x], u);                                                        
 modifies Vector.elems;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var w_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var Vector._state_post: [Vector]State;                                                             
 var w_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Vector.elems[x] := v;                                                                              
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Vector.elems(u: Tid,x: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.5): Vector.elems failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Vector.elems(t: Tid, u: Tid, v: Array.Vector.T, w: Array.Vector.T, x: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Vector._state[x], u);                                                        
 modifies Vector.elems;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var w_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var Vector._state_post: [Vector]State;                                                             
 var w_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Vector.elems[x] := v;                                                                              
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Vector.elems(u: Tid,x: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (8.5): Vector.elems failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Vector.elems(t: Tid, u: Tid, v: Array.Vector.T, w: Array.Vector.T, x: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Vector._state[x], u);                                                        
 modifies Vector.elems;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.Vector.T;                                                                   
 var w_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var Vector._state_post: [Vector]State;                                                             
 var w_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Vector.elems[x];                                                                       
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Vector.elems[x] := havocValue;                                                                     
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Vector.elems(u: Tid,x: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.5): Vector.elems failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Vector.elems(t: Tid, u: Tid, v: Array.Vector.T, w: Array.Vector.T, x: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Vector._state[x], u);                                                        
 modifies Vector.elems;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Array.Vector.T;                                                                   
 var w_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var Vector._state_post: [Vector]State;                                                             
 var w_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Vector.elems[x];                                                                       
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Vector.elems(u: Tid,x: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (8.5): Vector.elems failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Vector.elems(t: Tid, u: Tid, v: Array.Vector.T, w: Array.Vector.T, x: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Vector._state[x], u);                                                        
 modifies Vector.elems;                                                                             
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var w_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var Vector._state_post: [Vector]State;                                                             
 var w_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Vector.elems(t: Tid,x: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Vector.elems(u: Tid,x: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.5): Vector.elems failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Vector.elems(t: Tid, u: Tid, v: Array.Vector.T, w: Array.Vector.T, x: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Vector._state[x], u);                                                        
 modifies Vector.elems;                                                                             
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.Vector.T;                                                                   
 var w_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var Vector._state_post: [Vector]State;                                                             
 var w_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Vector.elems[x];                                                                       
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Vector.elems(t: Tid,x: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Vector.elems[x] := havocValue;                                                                     
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Vector.elems(u: Tid,x: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.5): Vector.elems failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.Vector.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Vector, x: Array.Vector.T, i: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Array.Vector.T._state[x], u);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Vector.T._elems[x][i] := v;                                                                  
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Vector.T(u: Tid,x_owner: Vector,x: Array.Vector.T,i: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (7.5): Array Array.Vector.T failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.Vector.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Vector, x: Array.Vector.T, i: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Array.Vector.T._state[x], u);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Vector.T._elems[x][i] := v;                                                                  
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.Vector.T(u: Tid,x_owner: Vector,x: Array.Vector.T,i: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (7.5): Array Array.Vector.T failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.Vector.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Vector, x: Array.Vector.T, i: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Array.Vector.T._state[x], u);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.Vector.T._elems[x][i];                                                           
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.Vector.T._elems[x][i] := havocValue;                                                         
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Vector.T(u: Tid,x_owner: Vector,x: Array.Vector.T,i: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (7.5): Array Array.Vector.T failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.Vector.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Vector, x: Array.Vector.T, i: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Array.Vector.T._state[x], u);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.Vector.T._elems[x][i];                                                           
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.Vector.T(u: Tid,x_owner: Vector,x: Array.Vector.T,i: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (7.5): Array Array.Vector.T failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.Vector.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Vector, x: Array.Vector.T, i: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Array.Vector.T._state[x], u);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.Vector.T(u: Tid,x_owner: Vector,x: Array.Vector.T,i: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.5): Array Array.Vector.T failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.Vector.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Vector, x: Array.Vector.T, i: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Array.Vector.T._state[x], u);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Array.Vector.T._elems[x][i];                                                           
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.Vector.T._elems[x][i] := havocValue;                                                         
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.Vector.T(u: Tid,x_owner: Vector,x: Array.Vector.T,i: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.5): Array Array.Vector.T failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Vector.elems.Vector.elems(t: Tid, u: Tid, v: Array.Vector.T, w: Array.Vector.T, w0: Array.Vector.T, x: Vector, y: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Vector._state[y], u);                                                        
 modifies Vector.elems;                                                                             
 modifies Vector.elems;                                                                             
                                                                                                    
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
 var w_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var y_pre: Vector;                                                                                 
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var $pc_pre: Phase;                                                                                
 var w0_pre: Array.Vector.T;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var Vector._state_post: [Vector]State;                                                             
 var w0_post: Array.Vector.T;                                                                       
 var w_post: Array.Vector.T;                                                                        
 var y_post: Vector;                                                                                
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Vector.elems(u: Tid,y: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Vector.elems[x] := v;                                                                              
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Vector.elems(u: Tid,y: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.5): Vector.elems is not Write-Write Stable with respect to Vector.elems (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.5): Vector.elems is not Write-Write Stable with respect to Vector.elems (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.5): Vector.elems is not Write-Write Stable with respect to Vector.elems (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Vector.elems.Vector.elems(t: Tid, u: Tid, v: Array.Vector.T, w: Array.Vector.T, w0: Array.Vector.T, x: Vector, y: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Vector._state[y], u);                                                        
 modifies Vector.elems;                                                                             
 modifies Vector.elems;                                                                             
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Vector.T;                                                                         
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var w_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var y_pre: Vector;                                                                                 
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var $pc_pre: Phase;                                                                                
 var w0_pre: Array.Vector.T;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_mid: [Array.Vector.T]([int]int);                                         
 var t_mid: Tid;                                                                                    
 var Vector._state_mid: [Vector]State;                                                              
 var Vector.elems_mid: [Vector]Array.Vector.T;                                                      
 var u_mid: Tid;                                                                                    
 var x_mid: Vector;                                                                                 
 var $recorded.state_mid: int;                                                                      
 var Vector._lock_mid: [Vector]Tid;                                                                 
 var Array.Vector.T._state_mid: [Array.Vector.T]State;                                              
 var v_mid: Array.Vector.T;                                                                         
 var Array.Vector.T._length_mid: [Array.Vector.T]int;                                               
 var w_mid: Array.Vector.T;                                                                         
 var y_mid: Vector;                                                                                 
 var w0_mid: Array.Vector.T;                                                                        
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var Vector._state_post: [Vector]State;                                                             
 var w0_post: Array.Vector.T;                                                                       
 var w_post: Array.Vector.T;                                                                        
 var y_post: Vector;                                                                                
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Vector.elems[x];                                                                           
 Vector.elems[x] := v;                                                                              
                                                                                                    
 assume Vector._state_mid == Vector._state && Vector.elems_mid == Vector.elems && Vector._lock_mid == Vector._lock && Array.Vector.T._state_mid == Array.Vector.T._state && Array.Vector.T._elems_mid == Array.Vector.T._elems && Array.Vector.T._length_mid == Array.Vector.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Vector.elems(u: Tid,y: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Vector.elems[x] := tmpV;                                                                           
 Vector.elems[y] := w;                                                                              
 _writeByTPost := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Vector.elems is not Write-Write Stable with respect to Vector.elems (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Vector.elems.Vector.elems(t: Tid, u: Tid, v: Array.Vector.T, w: Array.Vector.T, w0: Array.Vector.T, x: Vector, y: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Vector._state[y], u);                                                        
 modifies Vector.elems;                                                                             
 modifies Vector.elems;                                                                             
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Vector.T;                                                                         
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
 var w_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var y_pre: Vector;                                                                                 
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var $pc_pre: Phase;                                                                                
 var w0_pre: Array.Vector.T;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_mid: [Array.Vector.T]([int]int);                                         
 var t_mid: Tid;                                                                                    
 var Vector._state_mid: [Vector]State;                                                              
 var Vector.elems_mid: [Vector]Array.Vector.T;                                                      
 var u_mid: Tid;                                                                                    
 var x_mid: Vector;                                                                                 
 var $recorded.state_mid: int;                                                                      
 var Vector._lock_mid: [Vector]Tid;                                                                 
 var Array.Vector.T._state_mid: [Array.Vector.T]State;                                              
 var v_mid: Array.Vector.T;                                                                         
 var Array.Vector.T._length_mid: [Array.Vector.T]int;                                               
 var w_mid: Array.Vector.T;                                                                         
 var y_mid: Vector;                                                                                 
 var w0_mid: Array.Vector.T;                                                                        
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var Vector._state_post: [Vector]State;                                                             
 var w0_post: Array.Vector.T;                                                                       
 var w_post: Array.Vector.T;                                                                        
 var y_post: Vector;                                                                                
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Vector.elems(u: Tid,y: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Vector.elems[x];                                                                           
 Vector.elems[x] := v;                                                                              
 assume Vector._state_mid == Vector._state && Vector.elems_mid == Vector.elems && Vector._lock_mid == Vector._lock && Array.Vector.T._state_mid == Array.Vector.T._state && Array.Vector.T._elems_mid == Array.Vector.T._elems && Array.Vector.T._length_mid == Array.Vector.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Vector.elems(u: Tid,y: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Vector.elems[x] := tmpV;                                                                           
 Vector.elems[y] := w;                                                                              
 _writeByTPost := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Vector.elems is not Write-Write Stable with respect to Vector.elems (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Vector.elems is not Write-Write Stable with respect to Vector.elems (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Vector.elems.Vector.elems(t: Tid, u: Tid, v: Array.Vector.T, w: Array.Vector.T, w0: Array.Vector.T, x: Vector, y: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Vector._state[y], u);                                                        
 modifies Vector.elems;                                                                             
 modifies Vector.elems;                                                                             
                                                                                                    
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
 var w_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var y_pre: Vector;                                                                                 
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var $pc_pre: Phase;                                                                                
 var w0_pre: Array.Vector.T;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var Vector._state_post: [Vector]State;                                                             
 var w0_post: Array.Vector.T;                                                                       
 var w_post: Array.Vector.T;                                                                        
 var y_post: Vector;                                                                                
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Vector.elems(t: Tid,x: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Vector.elems(u: Tid,y: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Vector.elems[y] := w;                                                                              
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Vector.elems(t: Tid,x: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Vector.elems is not Read-Write Stable with respect to Vector.elems (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Vector.elems is not Read-Write Stable with respect to Vector.elems (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Vector.elems is not Read-Write Stable with respect to Vector.elems (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Vector.elems.Vector.elems(t: Tid, u: Tid, v: Array.Vector.T, w: Array.Vector.T, w0: Array.Vector.T, x: Vector, y: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Vector._state[y], u);                                                        
 modifies Vector.elems;                                                                             
 modifies Vector.elems;                                                                             
                                                                                                    
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
 var w_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var y_pre: Vector;                                                                                 
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var $pc_pre: Phase;                                                                                
 var w0_pre: Array.Vector.T;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var Vector._state_post: [Vector]State;                                                             
 var w0_post: Array.Vector.T;                                                                       
 var w_post: Array.Vector.T;                                                                        
 var y_post: Vector;                                                                                
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Vector.elems(u: Tid,y: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Vector.elems[x] := v;                                                                              
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Vector.elems(u: Tid,y: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Vector.elems is not Write-Read Stable with respect to Vector.elems (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Vector.elems is not Write-Read Stable with respect to Vector.elems (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.5): Vector.elems is not Write-Read Stable with respect to Vector.elems (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Vector.elems.Array.Vector.T._elems(t: Tid, u: Tid, v: Array.Vector.T, w: int, w0: int, x: Vector, y_owner: Vector, y: Array.Vector.T, j: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Array.Vector.T._state[y], u);                                                
 requires Array.Vector.T._this[y] == y_owner;                                                       
 modifies Vector.elems;                                                                             
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
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
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Array.Vector.T;                                                                         
 var y_owner_pre: Vector;                                                                           
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var y_owner_post: Vector;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var j_post: int;                                                                                   
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var y_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Vector.elems[x] := v;                                                                              
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Vector.elems (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Vector.elems (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Vector.elems (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Vector.elems.Array.Vector.T._elems(t: Tid, u: Tid, v: Array.Vector.T, w: int, w0: int, x: Vector, y_owner: Vector, y: Array.Vector.T, j: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Array.Vector.T._state[y], u);                                                
 requires Array.Vector.T._this[y] == y_owner;                                                       
 modifies Vector.elems;                                                                             
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Vector.T;                                                                         
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
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Array.Vector.T;                                                                         
 var y_owner_pre: Vector;                                                                           
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_mid: [Array.Vector.T]([int]int);                                         
 var t_mid: Tid;                                                                                    
 var Vector._state_mid: [Vector]State;                                                              
 var y_owner_mid: Vector;                                                                           
 var Vector.elems_mid: [Vector]Array.Vector.T;                                                      
 var u_mid: Tid;                                                                                    
 var x_mid: Vector;                                                                                 
 var $recorded.state_mid: int;                                                                      
 var Vector._lock_mid: [Vector]Tid;                                                                 
 var Array.Vector.T._state_mid: [Array.Vector.T]State;                                              
 var w_mid: int;                                                                                    
 var v_mid: Array.Vector.T;                                                                         
 var Array.Vector.T._length_mid: [Array.Vector.T]int;                                               
 var y_mid: Array.Vector.T;                                                                         
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var y_owner_post: Vector;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var j_post: int;                                                                                   
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var y_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Vector.elems[x];                                                                           
 Vector.elems[x] := v;                                                                              
                                                                                                    
 assume Vector._state_mid == Vector._state && Vector.elems_mid == Vector.elems && Vector._lock_mid == Vector._lock && Array.Vector.T._state_mid == Array.Vector.T._state && Array.Vector.T._elems_mid == Array.Vector.T._elems && Array.Vector.T._length_mid == Array.Vector.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Vector.elems[x] := tmpV;                                                                           
 Array.Vector.T._elems[y][j] := w;                                                                  
 _writeByTPost := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Vector.elems is not Write-Write Stable with respect to Array Array.Vector.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Vector.elems.Array.Vector.T._elems(t: Tid, u: Tid, v: Array.Vector.T, w: int, w0: int, x: Vector, y_owner: Vector, y: Array.Vector.T, j: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Array.Vector.T._state[y], u);                                                
 requires Array.Vector.T._this[y] == y_owner;                                                       
 modifies Vector.elems;                                                                             
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Vector.T;                                                                         
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
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Array.Vector.T;                                                                         
 var y_owner_pre: Vector;                                                                           
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_mid: [Array.Vector.T]([int]int);                                         
 var t_mid: Tid;                                                                                    
 var Vector._state_mid: [Vector]State;                                                              
 var y_owner_mid: Vector;                                                                           
 var Vector.elems_mid: [Vector]Array.Vector.T;                                                      
 var u_mid: Tid;                                                                                    
 var x_mid: Vector;                                                                                 
 var $recorded.state_mid: int;                                                                      
 var Vector._lock_mid: [Vector]Tid;                                                                 
 var Array.Vector.T._state_mid: [Array.Vector.T]State;                                              
 var w_mid: int;                                                                                    
 var v_mid: Array.Vector.T;                                                                         
 var Array.Vector.T._length_mid: [Array.Vector.T]int;                                               
 var y_mid: Array.Vector.T;                                                                         
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var y_owner_post: Vector;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var j_post: int;                                                                                   
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var y_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Vector.elems[x];                                                                           
 Vector.elems[x] := v;                                                                              
 assume Vector._state_mid == Vector._state && Vector.elems_mid == Vector.elems && Vector._lock_mid == Vector._lock && Array.Vector.T._state_mid == Array.Vector.T._state && Array.Vector.T._elems_mid == Array.Vector.T._elems && Array.Vector.T._length_mid == Array.Vector.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Vector.elems[x] := tmpV;                                                                           
 Array.Vector.T._elems[y][j] := w;                                                                  
 _writeByTPost := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Vector.elems is not Write-Write Stable with respect to Array Array.Vector.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Vector.elems is not Write-Write Stable with respect to Array Array.Vector.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Vector.elems.Array.Vector.T._elems(t: Tid, u: Tid, v: Array.Vector.T, w: int, w0: int, x: Vector, y_owner: Vector, y: Array.Vector.T, j: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Array.Vector.T._state[y], u);                                                
 requires Array.Vector.T._this[y] == y_owner;                                                       
 modifies Vector.elems;                                                                             
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
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
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Array.Vector.T;                                                                         
 var y_owner_pre: Vector;                                                                           
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var y_owner_post: Vector;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var j_post: int;                                                                                   
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var y_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Vector.elems(t: Tid,x: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Vector.T._elems[y][j] := w;                                                                  
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Vector.elems(t: Tid,x: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Vector.elems is not Read-Write Stable with respect to Array Array.Vector.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Vector.elems is not Read-Write Stable with respect to Array Array.Vector.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Vector.elems is not Read-Write Stable with respect to Array Array.Vector.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Vector.elems.Array.Vector.T._elems(t: Tid, u: Tid, v: Array.Vector.T, w: int, w0: int, x: Vector, y_owner: Vector, y: Array.Vector.T, j: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Vector._state[x], t);                                                        
 requires isAccessible(Array.Vector.T._state[y], u);                                                
 requires Array.Vector.T._this[y] == y_owner;                                                       
 modifies Vector.elems;                                                                             
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
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
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var x_pre: Vector;                                                                                 
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var v_pre: Array.Vector.T;                                                                         
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Array.Vector.T;                                                                         
 var y_owner_pre: Vector;                                                                           
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var v_post: Array.Vector.T;                                                                        
 var Vector._lock_post: [Vector]Tid;                                                                
 var y_owner_post: Vector;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Vector;                                                                                
 var j_post: int;                                                                                   
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var y_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Vector.elems(t: Tid,x: Vector,v: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Vector.elems[x] := v;                                                                              
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Read Stable with respect to Vector.elems (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Read Stable with respect to Vector.elems (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.5): Array Array.Vector.T is not Write-Read Stable with respect to Vector.elems (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Vector.T._elems.Vector.elems(t: Tid, u: Tid, v: int, w: Array.Vector.T, w0: Array.Vector.T, x_owner: Vector, x: Array.Vector.T, i: int, y: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Vector._state[y], u);                                                        
 modifies Array.Vector.T._elems;                                                                    
 modifies Vector.elems;                                                                             
                                                                                                    
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
 var w_pre: Array.Vector.T;                                                                         
 var v_pre: int;                                                                                    
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var y_pre: Vector;                                                                                 
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var w0_pre: Array.Vector.T;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var Vector._state_post: [Vector]State;                                                             
 var v_post: int;                                                                                   
 var w0_post: Array.Vector.T;                                                                       
 var w_post: Array.Vector.T;                                                                        
 var y_post: Vector;                                                                                
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Vector.elems(u: Tid,y: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.Vector.T._elems[x][i] := v;                                                                  
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Vector.elems(u: Tid,y: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.5): Vector.elems is not Write-Write Stable with respect to Array Array.Vector.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.5): Vector.elems is not Write-Write Stable with respect to Array Array.Vector.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.5): Vector.elems is not Write-Write Stable with respect to Array Array.Vector.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Vector.T._elems.Vector.elems(t: Tid, u: Tid, v: int, w: Array.Vector.T, w0: Array.Vector.T, x_owner: Vector, x: Array.Vector.T, i: int, y: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Vector._state[y], u);                                                        
 modifies Array.Vector.T._elems;                                                                    
 modifies Vector.elems;                                                                             
                                                                                                    
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
 var w_pre: Array.Vector.T;                                                                         
 var v_pre: int;                                                                                    
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var y_pre: Vector;                                                                                 
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var w0_pre: Array.Vector.T;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_mid: [Array.Vector.T]([int]int);                                         
 var t_mid: Tid;                                                                                    
 var Vector._state_mid: [Vector]State;                                                              
 var Vector.elems_mid: [Vector]Array.Vector.T;                                                      
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Vector._lock_mid: [Vector]Tid;                                                                 
 var Array.Vector.T._state_mid: [Array.Vector.T]State;                                              
 var Array.Vector.T._length_mid: [Array.Vector.T]int;                                               
 var w_mid: Array.Vector.T;                                                                         
 var v_mid: int;                                                                                    
 var x_mid: Array.Vector.T;                                                                         
 var y_mid: Vector;                                                                                 
 var w0_mid: Array.Vector.T;                                                                        
 var x_owner_mid: Vector;                                                                           
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var Vector._state_post: [Vector]State;                                                             
 var v_post: int;                                                                                   
 var w0_post: Array.Vector.T;                                                                       
 var w_post: Array.Vector.T;                                                                        
 var y_post: Vector;                                                                                
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Vector.T._elems[x][i];                                                               
 Array.Vector.T._elems[x][i] := v;                                                                  
                                                                                                    
 assume Vector._state_mid == Vector._state && Vector.elems_mid == Vector.elems && Vector._lock_mid == Vector._lock && Array.Vector.T._state_mid == Array.Vector.T._state && Array.Vector.T._elems_mid == Array.Vector.T._elems && Array.Vector.T._length_mid == Array.Vector.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Vector.elems(u: Tid,y: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Vector.T._elems[x][i] := tmpV;                                                               
 Vector.elems[y] := w;                                                                              
 _writeByTPost := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Vector.elems (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Vector.T._elems.Vector.elems(t: Tid, u: Tid, v: int, w: Array.Vector.T, w0: Array.Vector.T, x_owner: Vector, x: Array.Vector.T, i: int, y: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Vector._state[y], u);                                                        
 modifies Array.Vector.T._elems;                                                                    
 modifies Vector.elems;                                                                             
                                                                                                    
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
 var w_pre: Array.Vector.T;                                                                         
 var v_pre: int;                                                                                    
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var y_pre: Vector;                                                                                 
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var w0_pre: Array.Vector.T;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_mid: [Array.Vector.T]([int]int);                                         
 var t_mid: Tid;                                                                                    
 var Vector._state_mid: [Vector]State;                                                              
 var Vector.elems_mid: [Vector]Array.Vector.T;                                                      
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Vector._lock_mid: [Vector]Tid;                                                                 
 var Array.Vector.T._state_mid: [Array.Vector.T]State;                                              
 var Array.Vector.T._length_mid: [Array.Vector.T]int;                                               
 var w_mid: Array.Vector.T;                                                                         
 var v_mid: int;                                                                                    
 var x_mid: Array.Vector.T;                                                                         
 var y_mid: Vector;                                                                                 
 var w0_mid: Array.Vector.T;                                                                        
 var x_owner_mid: Vector;                                                                           
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var Vector._state_post: [Vector]State;                                                             
 var v_post: int;                                                                                   
 var w0_post: Array.Vector.T;                                                                       
 var w_post: Array.Vector.T;                                                                        
 var y_post: Vector;                                                                                
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Vector.elems(u: Tid,y: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Vector.T._elems[x][i];                                                               
 Array.Vector.T._elems[x][i] := v;                                                                  
 assume Vector._state_mid == Vector._state && Vector.elems_mid == Vector.elems && Vector._lock_mid == Vector._lock && Array.Vector.T._state_mid == Array.Vector.T._state && Array.Vector.T._elems_mid == Array.Vector.T._elems && Array.Vector.T._length_mid == Array.Vector.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Vector.elems(u: Tid,y: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Vector.T._elems[x][i] := tmpV;                                                               
 Vector.elems[y] := w;                                                                              
 _writeByTPost := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Vector.elems (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Vector.elems (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Vector.T._elems.Vector.elems(t: Tid, u: Tid, v: int, w: Array.Vector.T, w0: Array.Vector.T, x_owner: Vector, x: Array.Vector.T, i: int, y: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Vector._state[y], u);                                                        
 modifies Array.Vector.T._elems;                                                                    
 modifies Vector.elems;                                                                             
                                                                                                    
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
 var w_pre: Array.Vector.T;                                                                         
 var v_pre: int;                                                                                    
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var y_pre: Vector;                                                                                 
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var w0_pre: Array.Vector.T;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var Vector._state_post: [Vector]State;                                                             
 var v_post: int;                                                                                   
 var w0_post: Array.Vector.T;                                                                       
 var w_post: Array.Vector.T;                                                                        
 var y_post: Vector;                                                                                
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Vector.elems(u: Tid,y: Vector,w: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Vector.elems[y] := w;                                                                              
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Read-Write Stable with respect to Vector.elems (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Read-Write Stable with respect to Vector.elems (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Read-Write Stable with respect to Vector.elems (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Vector.T._elems.Vector.elems(t: Tid, u: Tid, v: int, w: Array.Vector.T, w0: Array.Vector.T, x_owner: Vector, x: Array.Vector.T, i: int, y: Vector)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Vector._state[y], u);                                                        
 modifies Array.Vector.T._elems;                                                                    
 modifies Vector.elems;                                                                             
                                                                                                    
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
 var w_pre: Array.Vector.T;                                                                         
 var v_pre: int;                                                                                    
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var y_pre: Vector;                                                                                 
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var w0_pre: Array.Vector.T;                                                                        
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var Vector._state_post: [Vector]State;                                                             
 var v_post: int;                                                                                   
 var w0_post: Array.Vector.T;                                                                       
 var w_post: Array.Vector.T;                                                                        
 var y_post: Vector;                                                                                
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Vector.elems(u: Tid,y: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.Vector.T._elems[x][i] := v;                                                                  
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Vector.elems(u: Tid,y: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Vector.elems is not Write-Read Stable with respect to Array Array.Vector.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Vector.elems is not Write-Read Stable with respect to Array Array.Vector.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.5): Vector.elems is not Write-Read Stable with respect to Array Array.Vector.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Vector.T._elems.Array.Vector.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Vector, x: Array.Vector.T, i: int, y_owner: Vector, y: Array.Vector.T, j: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Array.Vector.T._state[y], u);                                                
 requires Array.Vector.T._this[y] == y_owner;                                                       
 modifies Array.Vector.T._elems;                                                                    
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
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
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var w0_pre: int;                                                                                   
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Array.Vector.T;                                                                         
 var y_owner_pre: Vector;                                                                           
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var y_owner_post: Vector;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var j_post: int;                                                                                   
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Vector.T._elems[x][i] := v;                                                                  
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Array Array.Vector.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Array Array.Vector.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Array Array.Vector.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Vector.T._elems.Array.Vector.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Vector, x: Array.Vector.T, i: int, y_owner: Vector, y: Array.Vector.T, j: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Array.Vector.T._state[y], u);                                                
 requires Array.Vector.T._this[y] == y_owner;                                                       
 modifies Array.Vector.T._elems;                                                                    
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
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
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var w0_pre: int;                                                                                   
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Array.Vector.T;                                                                         
 var y_owner_pre: Vector;                                                                           
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_mid: [Array.Vector.T]([int]int);                                         
 var t_mid: Tid;                                                                                    
 var Vector._state_mid: [Vector]State;                                                              
 var y_owner_mid: Vector;                                                                           
 var Vector.elems_mid: [Vector]Array.Vector.T;                                                      
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Vector._lock_mid: [Vector]Tid;                                                                 
 var Array.Vector.T._state_mid: [Array.Vector.T]State;                                              
 var w_mid: int;                                                                                    
 var Array.Vector.T._length_mid: [Array.Vector.T]int;                                               
 var v_mid: int;                                                                                    
 var y_mid: Array.Vector.T;                                                                         
 var x_mid: Array.Vector.T;                                                                         
 var j_mid: int;                                                                                    
 var x_owner_mid: Vector;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var y_owner_post: Vector;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var j_post: int;                                                                                   
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Vector.T._elems[x][i];                                                               
 Array.Vector.T._elems[x][i] := v;                                                                  
                                                                                                    
 assume Vector._state_mid == Vector._state && Vector.elems_mid == Vector.elems && Vector._lock_mid == Vector._lock && Array.Vector.T._state_mid == Array.Vector.T._state && Array.Vector.T._elems_mid == Array.Vector.T._elems && Array.Vector.T._length_mid == Array.Vector.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Vector.T._elems[x][i] := tmpV;                                                               
 Array.Vector.T._elems[y][j] := w;                                                                  
 _writeByTPost := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Array Array.Vector.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Vector.T._elems.Array.Vector.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Vector, x: Array.Vector.T, i: int, y_owner: Vector, y: Array.Vector.T, j: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Array.Vector.T._state[y], u);                                                
 requires Array.Vector.T._this[y] == y_owner;                                                       
 modifies Array.Vector.T._elems;                                                                    
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
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
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var w0_pre: int;                                                                                   
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Array.Vector.T;                                                                         
 var y_owner_pre: Vector;                                                                           
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var Array.Vector.T._elems_mid: [Array.Vector.T]([int]int);                                         
 var t_mid: Tid;                                                                                    
 var Vector._state_mid: [Vector]State;                                                              
 var y_owner_mid: Vector;                                                                           
 var Vector.elems_mid: [Vector]Array.Vector.T;                                                      
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Vector._lock_mid: [Vector]Tid;                                                                 
 var Array.Vector.T._state_mid: [Array.Vector.T]State;                                              
 var w_mid: int;                                                                                    
 var Array.Vector.T._length_mid: [Array.Vector.T]int;                                               
 var v_mid: int;                                                                                    
 var y_mid: Array.Vector.T;                                                                         
 var x_mid: Array.Vector.T;                                                                         
 var j_mid: int;                                                                                    
 var x_owner_mid: Vector;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var y_owner_post: Vector;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var j_post: int;                                                                                   
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Vector.T._elems[x][i];                                                               
 Array.Vector.T._elems[x][i] := v;                                                                  
 assume Vector._state_mid == Vector._state && Vector.elems_mid == Vector.elems && Vector._lock_mid == Vector._lock && Array.Vector.T._state_mid == Array.Vector.T._state && Array.Vector.T._elems_mid == Array.Vector.T._elems && Array.Vector.T._length_mid == Array.Vector.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Vector.T._elems[x][i] := tmpV;                                                               
 Array.Vector.T._elems[y][j] := w;                                                                  
 _writeByTPost := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Array Array.Vector.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Array Array.Vector.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Vector.T._elems.Array.Vector.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Vector, x: Array.Vector.T, i: int, y_owner: Vector, y: Array.Vector.T, j: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Array.Vector.T._state[y], u);                                                
 requires Array.Vector.T._this[y] == y_owner;                                                       
 modifies Array.Vector.T._elems;                                                                    
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
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
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var w0_pre: int;                                                                                   
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Array.Vector.T;                                                                         
 var y_owner_pre: Vector;                                                                           
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var y_owner_post: Vector;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var j_post: int;                                                                                   
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,w: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Vector.T._elems[y][j] := w;                                                                  
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Read-Write Stable with respect to Array Array.Vector.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Read-Write Stable with respect to Array Array.Vector.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Array Array.Vector.T is not Read-Write Stable with respect to Array Array.Vector.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Vector.T._elems.Array.Vector.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Vector, x: Array.Vector.T, i: int, y_owner: Vector, y: Array.Vector.T, j: int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Vector.T._state[x], t);                                                
 requires Array.Vector.T._this[x] == x_owner;                                                       
 requires isAccessible(Array.Vector.T._state[y], u);                                                
 requires Array.Vector.T._this[y] == y_owner;                                                       
 modifies Array.Vector.T._elems;                                                                    
 modifies Array.Vector.T._elems;                                                                    
                                                                                                    
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
 var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                         
 var x_owner_pre: Vector;                                                                           
 var Vector.elems_pre: [Vector]Array.Vector.T;                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: Array.Vector.T;                                                                         
 var w0_pre: int;                                                                                   
 var Array.Vector.T._length_pre: [Array.Vector.T]int;                                               
 var Vector._state_pre: [Vector]State;                                                              
 var Vector._lock_pre: [Vector]Tid;                                                                 
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Array.Vector.T;                                                                         
 var y_owner_pre: Vector;                                                                           
 var t_pre: Tid;                                                                                    
 var Array.Vector.T._state_pre: [Array.Vector.T]State;                                              
                                                                                                    
 var x_owner_post: Vector;                                                                          
 var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                        
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Vector.elems_post: [Vector]Array.Vector.T;                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Vector.T._length_post: [Array.Vector.T]int;                                              
 var Vector._lock_post: [Vector]Tid;                                                                
 var y_owner_post: Vector;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Array.Vector.T;                                                                        
 var j_post: int;                                                                                   
 var Vector._state_post: [Vector]State;                                                             
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Vector.T;                                                                        
 var Array.Vector.T._state_post: [Array.Vector.T]State;                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Vector.T(t: Tid,x_owner: Vector,x: Array.Vector.T,i: int,v: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Vector.T._elems[x][i] := v;                                                                  
 assume Vector._state_post == Vector._state && Vector.elems_post == Vector.elems && Vector._lock_post == Vector._lock && Array.Vector.T._state_post == Array.Vector.T._state && Array.Vector.T._elems_post == Array.Vector.T._elems && Array.Vector.T._length_post == Array.Vector.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Vector.T(u: Tid,y_owner: Vector,y: Array.Vector.T,j: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Read Stable with respect to Array Array.Vector.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): Array Array.Vector.T is not Write-Read Stable with respect to Array Array.Vector.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.5): Array Array.Vector.T is not Write-Read Stable with respect to Array Array.Vector.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
requires ValidTid(tid);                                                                             
modifies Vector._state;                                                                             
modifies Vector.elems;                                                                              
modifies Vector._lock;                                                                              
modifies Array.Vector.T._state;                                                                     
modifies Array.Vector.T._elems;                                                                     
ensures StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
ensures Y(tid , old(Vector._state), old(Vector.elems), old(Vector._lock), old(Array.Vector.T._state), old(Array.Vector.T._elems), old(Array.Vector.T._length) , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
                                                                                                    
// Vector.elems:                                                                                    
                                                                                                    
function {:inline} Y_Vector.elems(tid : Tid, this: Vector, newValue: Array.Vector.T , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int): bool
{                                                                                                   
 ((isAccessible(Vector._state[this], tid) && leq(m#moverPath(ReadEval.Vector.elems(tid: Tid,this: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length)), _R)) ==> (Vector.elems[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Vector.elems(tid : Tid, this: Vector, newValue: Array.Vector.T , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Vector.elems.Subsumes.W(tid : Tid, u : Tid, this: Vector, newValue: Array.Vector.T , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Array.Vector.T._length_yield: [Array.Vector.T]int;                                              
var newValue_yield: Array.Vector.T;                                                                 
var Array.Vector.T._state_yield: [Array.Vector.T]State;                                             
var Vector._lock_yield: [Vector]Tid;                                                                
var u_yield: Tid;                                                                                   
var this_yield: Vector;                                                                             
var Vector._state_yield: [Vector]State;                                                             
var Array.Vector.T._elems_yield: [Array.Vector.T]([int]int);                                        
var Vector.elems_yield: [Vector]Array.Vector.T;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Vector._state[this], tid);                                                     
 assume isAccessible(Vector._state[this], u);                                                       
 assume !isError(m#moverPath(WriteEval.Vector.elems(u: Tid,this: Vector,newValue: Array.Vector.T,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length)));
                                                                                                    
assume Vector._state_yield == Vector._state && Vector.elems_yield == Vector.elems && Vector._lock_yield == Vector._lock && Array.Vector.T._state_yield == Array.Vector.T._state && Array.Vector.T._elems_yield == Array.Vector.T._elems && Array.Vector.T._length_yield == Array.Vector.T._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Vector.elems(tid, this, newValue , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Vector.elems.Reflexive(tid : Tid, this: Vector , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Array.Vector.T._length_yield: [Array.Vector.T]int;                                              
var Array.Vector.T._state_yield: [Array.Vector.T]State;                                             
var Vector._lock_yield: [Vector]Tid;                                                                
var this_yield: Vector;                                                                             
var Vector._state_yield: [Vector]State;                                                             
var Array.Vector.T._elems_yield: [Array.Vector.T]([int]int);                                        
var Vector.elems_yield: [Vector]Array.Vector.T;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Vector._state[this], tid);                                                     
assume Vector._state_yield == Vector._state && Vector.elems_yield == Vector.elems && Vector._lock_yield == Vector._lock && Array.Vector.T._state_yield == Array.Vector.T._state && Array.Vector.T._elems_yield == Array.Vector.T._elems && Array.Vector.T._length_yield == Array.Vector.T._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Vector.elems(tid, this, Vector.elems[this] , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Vector.elems.Transitive(tid : Tid, this: Vector, newValue : Array.Vector.T , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int , Vector._state_p: [Vector]State, Vector.elems_p: [Vector]Array.Vector.T, Vector._lock_p: [Vector]Tid, Array.Vector.T._state_p: [Array.Vector.T]State, Array.Vector.T._elems_p: [Array.Vector.T]([int]int), Array.Vector.T._length_p: [Array.Vector.T]int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires StateInvariant(Vector._state_p, Vector.elems_p, Vector._lock_p, Array.Vector.T._state_p, Array.Vector.T._elems_p, Array.Vector.T._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                          
var Vector.elems_pre: [Vector]Array.Vector.T;                                                       
var $recorded.state_pre: int;                                                                       
var Array.Vector.T._length_pre: [Array.Vector.T]int;                                                
var Vector._state_pre: [Vector]State;                                                               
var Vector._lock_pre: [Vector]Tid;                                                                  
var this_pre: Vector;                                                                               
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var newValue_pre: Array.Vector.T;                                                                   
var Array.Vector.T._state_pre: [Array.Vector.T]State;                                               
                                                                                                    
var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                         
var $recorded.state_post: int;                                                                      
var newValue_post: Array.Vector.T;                                                                  
var Vector.elems_post: [Vector]Array.Vector.T;                                                      
var Array.Vector.T._length_post: [Array.Vector.T]int;                                               
var Vector._lock_post: [Vector]Tid;                                                                 
var $pc_post: Phase;                                                                                
var this_post: Vector;                                                                              
var tid_post: Tid;                                                                                  
var Vector._state_post: [Vector]State;                                                              
var Array.Vector.T._state_post: [Array.Vector.T]State;                                              
                                                                                                    
assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Vector._state[this], tid);                                                     
 assume Y(tid , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length , Vector._state_p, Vector.elems_p, Vector._lock_p, Array.Vector.T._state_p, Array.Vector.T._elems_p, Array.Vector.T._length_p);
 assume Y_Vector.elems(tid, this, newValue , Vector._state_p, Vector.elems_p, Vector._lock_p, Array.Vector.T._state_p, Array.Vector.T._elems_p, Array.Vector.T._length_p);
assume Vector._state_post == Vector._state_p && Vector.elems_post == Vector.elems_p && Vector._lock_post == Vector._lock_p && Array.Vector.T._state_post == Array.Vector.T._state_p && Array.Vector.T._elems_post == Array.Vector.T._elems_p && Array.Vector.T._length_post == Array.Vector.T._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Vector.elems(tid, this, newValue , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
}                                                                                                   
// Vector._lock:                                                                                    
                                                                                                    
function {:inline} Y_Vector._lock(tid : Tid, this: Vector, newValue: Tid , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int): bool
{                                                                                                   
 ((isAccessible(Vector._state[this], tid) && leq(m#moverPath(ReadEval.Vector._lock(tid: Tid,this: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length)), _R)) ==> (Vector._lock[this] == newValue))
 &&(((Vector._lock[this]==tid)==(newValue==tid)))                                                   
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Vector._lock(tid : Tid, this: Vector, newValue: Tid , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Vector._lock.Subsumes.W(tid : Tid, u : Tid, this: Vector, newValue: Tid , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Array.Vector.T._length_yield: [Array.Vector.T]int;                                              
var Array.Vector.T._state_yield: [Array.Vector.T]State;                                             
var Vector._lock_yield: [Vector]Tid;                                                                
var u_yield: Tid;                                                                                   
var this_yield: Vector;                                                                             
var Vector._state_yield: [Vector]State;                                                             
var Array.Vector.T._elems_yield: [Array.Vector.T]([int]int);                                        
var Vector.elems_yield: [Vector]Array.Vector.T;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Vector._state[this], tid);                                                     
 assume isAccessible(Vector._state[this], u);                                                       
 assume !isError(m#moverPath(WriteEval.Vector._lock(u: Tid,this: Vector,newValue: Tid,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length)));
 assume leq(m#moverPath(ReadEval.Vector._lock(tid: Tid,this: Vector,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length)), _N);
assume Vector._state_yield == Vector._state && Vector.elems_yield == Vector.elems && Vector._lock_yield == Vector._lock && Array.Vector.T._state_yield == Array.Vector.T._state && Array.Vector.T._elems_yield == Array.Vector.T._elems && Array.Vector.T._length_yield == Array.Vector.T._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Vector._lock(tid, this, newValue , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Vector._lock.Reflexive(tid : Tid, this: Vector , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Array.Vector.T._length_yield: [Array.Vector.T]int;                                              
var Array.Vector.T._state_yield: [Array.Vector.T]State;                                             
var Vector._lock_yield: [Vector]Tid;                                                                
var this_yield: Vector;                                                                             
var Vector._state_yield: [Vector]State;                                                             
var Array.Vector.T._elems_yield: [Array.Vector.T]([int]int);                                        
var Vector.elems_yield: [Vector]Array.Vector.T;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Vector._state[this], tid);                                                     
assume Vector._state_yield == Vector._state && Vector.elems_yield == Vector.elems && Vector._lock_yield == Vector._lock && Array.Vector.T._state_yield == Array.Vector.T._state && Array.Vector.T._elems_yield == Array.Vector.T._elems && Array.Vector.T._length_yield == Array.Vector.T._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Vector._lock(tid, this, Vector._lock[this] , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Vector._lock.Transitive(tid : Tid, this: Vector, newValue : Tid , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int , Vector._state_p: [Vector]State, Vector.elems_p: [Vector]Array.Vector.T, Vector._lock_p: [Vector]Tid, Array.Vector.T._state_p: [Array.Vector.T]State, Array.Vector.T._elems_p: [Array.Vector.T]([int]int), Array.Vector.T._length_p: [Array.Vector.T]int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires StateInvariant(Vector._state_p, Vector.elems_p, Vector._lock_p, Array.Vector.T._state_p, Array.Vector.T._elems_p, Array.Vector.T._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                          
var Vector.elems_pre: [Vector]Array.Vector.T;                                                       
var $recorded.state_pre: int;                                                                       
var Array.Vector.T._length_pre: [Array.Vector.T]int;                                                
var Vector._state_pre: [Vector]State;                                                               
var Vector._lock_pre: [Vector]Tid;                                                                  
var this_pre: Vector;                                                                               
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
var Array.Vector.T._state_pre: [Array.Vector.T]State;                                               
                                                                                                    
var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                         
var $recorded.state_post: int;                                                                      
var Vector.elems_post: [Vector]Array.Vector.T;                                                      
var Array.Vector.T._length_post: [Array.Vector.T]int;                                               
var Vector._lock_post: [Vector]Tid;                                                                 
var $pc_post: Phase;                                                                                
var this_post: Vector;                                                                              
var tid_post: Tid;                                                                                  
var Vector._state_post: [Vector]State;                                                              
var newValue_post: Tid;                                                                             
var Array.Vector.T._state_post: [Array.Vector.T]State;                                              
                                                                                                    
assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Vector._state[this], tid);                                                     
 assume Y(tid , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length , Vector._state_p, Vector.elems_p, Vector._lock_p, Array.Vector.T._state_p, Array.Vector.T._elems_p, Array.Vector.T._length_p);
 assume Y_Vector._lock(tid, this, newValue , Vector._state_p, Vector.elems_p, Vector._lock_p, Array.Vector.T._state_p, Array.Vector.T._elems_p, Array.Vector.T._length_p);
assume Vector._state_post == Vector._state_p && Vector.elems_post == Vector.elems_p && Vector._lock_post == Vector._lock_p && Array.Vector.T._state_post == Array.Vector.T._state_p && Array.Vector.T._elems_post == Array.Vector.T._elems_p && Array.Vector.T._length_post == Array.Vector.T._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Vector._lock(tid, this, newValue , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
}                                                                                                   
// Array.Vector.T:                                                                                  
                                                                                                    
function {:inline} Y_Array.Vector.T(tid : Tid, athis: Array.Vector.T, index: int, newValue: int , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int): bool
{                                                                                                   
(var this := Array.Vector.T._this[athis];                                                           
 ((isAccessible(Array.Vector.T._state[athis], tid) && leq(m#moverPath(ReadEval.Array.Vector.T(tid: Tid,Array.Vector.T._this[athis]: Vector,athis: Array.Vector.T,index: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length)), _R)) ==> (Array.Vector.T._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.Vector.T(tid : Tid, athis: Array.Vector.T, index: int, newValue: int , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int): bool
{                                                                                                   
(var this := Array.Vector.T._this[athis];                                                           
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.Vector.T.Subsumes.W(tid : Tid, u : Tid, this: Vector, athis: Array.Vector.T, index: int, newValue: int , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.Vector.T._this[athis];                                                      
{                                                                                                   
var athis_yield: Array.Vector.T;                                                                    
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Array.Vector.T._length_yield: [Array.Vector.T]int;                                              
var Array.Vector.T._state_yield: [Array.Vector.T]State;                                             
var Vector._lock_yield: [Vector]Tid;                                                                
var index_yield: int;                                                                               
var this_yield: Vector;                                                                             
var Vector._state_yield: [Vector]State;                                                             
var Array.Vector.T._elems_yield: [Array.Vector.T]([int]int);                                        
var Vector.elems_yield: [Vector]Array.Vector.T;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Vector.T._state[athis], u);                                              
 assume !isError(m#moverPath(WriteEval.Array.Vector.T(u: Tid,Array.Vector.T._this[athis]: Vector,athis: Array.Vector.T,index: int,newValue: int,Vector._state,Vector.elems,Vector._lock,Array.Vector.T._state,Array.Vector.T._elems,Array.Vector.T._length)));
                                                                                                    
assume Vector._state_yield == Vector._state && Vector.elems_yield == Vector.elems && Vector._lock_yield == Vector._lock && Array.Vector.T._state_yield == Array.Vector.T._state && Array.Vector.T._elems_yield == Array.Vector.T._elems && Array.Vector.T._length_yield == Array.Vector.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Vector.T(tid, athis, index, newValue , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Vector.T.Reflexive(tid : Tid, this: Vector, athis: Array.Vector.T, index: int , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires ValidTid(tid);                                                                            
 requires this == Array.Vector.T._this[athis];                                                      
{                                                                                                   
var athis_yield: Array.Vector.T;                                                                    
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Array.Vector.T._length_yield: [Array.Vector.T]int;                                              
var Array.Vector.T._state_yield: [Array.Vector.T]State;                                             
var Vector._lock_yield: [Vector]Tid;                                                                
var index_yield: int;                                                                               
var this_yield: Vector;                                                                             
var Vector._state_yield: [Vector]State;                                                             
var Array.Vector.T._elems_yield: [Array.Vector.T]([int]int);                                        
var Vector.elems_yield: [Vector]Array.Vector.T;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Vector.T._state[athis], tid);                                            
assume Vector._state_yield == Vector._state && Vector.elems_yield == Vector.elems && Vector._lock_yield == Vector._lock && Array.Vector.T._state_yield == Array.Vector.T._state && Array.Vector.T._elems_yield == Array.Vector.T._elems && Array.Vector.T._length_yield == Array.Vector.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Vector.T(tid, athis, index, Array.Vector.T._elems[athis][index] , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Vector.T.Transitive(tid : Tid, this: Vector, athis: Array.Vector.T, index: int, newValue : int , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int , Vector._state_p: [Vector]State, Vector.elems_p: [Vector]Array.Vector.T, Vector._lock_p: [Vector]Tid, Array.Vector.T._state_p: [Array.Vector.T]State, Array.Vector.T._elems_p: [Array.Vector.T]([int]int), Array.Vector.T._length_p: [Array.Vector.T]int)
 requires StateInvariant(Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
 requires StateInvariant(Vector._state_p, Vector.elems_p, Vector._lock_p, Array.Vector.T._state_p, Array.Vector.T._elems_p, Array.Vector.T._length_p);
                                                                                                    
 requires this == Array.Vector.T._this[athis];                                                      
 requires ValidTid(tid);                                                                            
{                                                                                                   
var Array.Vector.T._elems_pre: [Array.Vector.T]([int]int);                                          
var Vector.elems_pre: [Vector]Array.Vector.T;                                                       
var $recorded.state_pre: int;                                                                       
var Array.Vector.T._length_pre: [Array.Vector.T]int;                                                
var Vector._state_pre: [Vector]State;                                                               
var index_pre: int;                                                                                 
var Vector._lock_pre: [Vector]Tid;                                                                  
var this_pre: Vector;                                                                               
var tid_pre: Tid;                                                                                   
var athis_pre: Array.Vector.T;                                                                      
var $pc_pre: Phase;                                                                                 
var Array.Vector.T._state_pre: [Array.Vector.T]State;                                               
                                                                                                    
var Array.Vector.T._elems_post: [Array.Vector.T]([int]int);                                         
var $recorded.state_post: int;                                                                      
var Vector.elems_post: [Vector]Array.Vector.T;                                                      
var Array.Vector.T._length_post: [Array.Vector.T]int;                                               
var Vector._lock_post: [Vector]Tid;                                                                 
var $pc_post: Phase;                                                                                
var this_post: Vector;                                                                              
var tid_post: Tid;                                                                                  
var Vector._state_post: [Vector]State;                                                              
var index_post: int;                                                                                
var athis_post: Array.Vector.T;                                                                     
var Array.Vector.T._state_post: [Array.Vector.T]State;                                              
                                                                                                    
assume Vector._state_pre == Vector._state && Vector.elems_pre == Vector.elems && Vector._lock_pre == Vector._lock && Array.Vector.T._state_pre == Array.Vector.T._state && Array.Vector.T._elems_pre == Array.Vector.T._elems && Array.Vector.T._length_pre == Array.Vector.T._length && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume Vector._state_post == Vector._state_p && Vector.elems_post == Vector.elems_p && Vector._lock_post == Vector._lock_p && Array.Vector.T._state_post == Array.Vector.T._state_p && Array.Vector.T._elems_post == Array.Vector.T._elems_p && Array.Vector.T._length_post == Array.Vector.T._length_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.Vector.T._state[athis], tid);                                            
 assume Y(tid , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length , Vector._state_p, Vector.elems_p, Vector._lock_p, Array.Vector.T._state_p, Array.Vector.T._elems_p, Array.Vector.T._length_p);
 assume Y_Array.Vector.T(tid, athis, index, newValue , Vector._state_p, Vector.elems_p, Vector._lock_p, Array.Vector.T._state_p, Array.Vector.T._elems_p, Array.Vector.T._length_p);
 assert Y_Array.Vector.T(tid, athis, index, newValue , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Vector._state: [Vector]State, Vector.elems: [Vector]Array.Vector.T, Vector._lock: [Vector]Tid, Array.Vector.T._state: [Array.Vector.T]State, Array.Vector.T._elems: [Array.Vector.T]([int]int), Array.Vector.T._length: [Array.Vector.T]int , Vector._state_p: [Vector]State, Vector.elems_p: [Vector]Array.Vector.T, Vector._lock_p: [Vector]Tid, Array.Vector.T._state_p: [Array.Vector.T]State, Array.Vector.T._elems_p: [Array.Vector.T]([int]int), Array.Vector.T._length_p: [Array.Vector.T]int): bool
{                                                                                                   
 (forall this: Vector :: Y_Vector.elems(tid : Tid, this, Vector.elems_p[this] , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length))
 && (forall this: Vector :: Y_Vector._lock(tid : Tid, this, Vector._lock_p[this] , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length))
 && (forall athis: Array.Vector.T, index: int :: Y_Array.Vector.T(tid : Tid, athis, index, Array.Vector.T._elems_p[athis][index] , Vector._state, Vector.elems, Vector._lock, Array.Vector.T._state, Array.Vector.T._elems, Array.Vector.T._length))
 && (forall _i : Vector :: isShared(Vector._state[_i]) ==> isShared(Vector._state_p[_i]))           
 && (forall _i : Vector :: isLocal(Vector._state[_i], tid) <==> isLocal(Vector._state_p[_i], tid))  
 && (forall _i : Array.Vector.T :: isShared(Array.Vector.T._state[_i]) ==> isShared(Array.Vector.T._state_p[_i]))
 && (forall _i : Array.Vector.T :: Array.Vector.T._length[_i] == Array.Vector.T._length_p[_i])      
 && (forall _i : Array.Vector.T :: isLocal(Array.Vector.T._state[_i], tid) <==> isLocal(Array.Vector.T._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 442.1-578.2: (Method:10.5)
// 451.1-451.24: (10.5): Bad tid
// 452.1-452.40: (10.5): this is not global
// 509.2-511.2: (class anchor.sink.VarDeclStmt:11.9)
// 512.2-529.29: (class anchor.sink.Read:11.9)
// 524.1-524.30: (11.9): Cannot have potential null deference in left-mover part.
// 528.1-528.27: (11.9): Reduction failure
// 530.2-532.2: (class anchor.sink.VarDeclStmt:11.9)
// 533.2-536.12: (class anchor.sink.Assign:11.9)
// 537.2-539.2: (class anchor.sink.VarDeclStmt:11.9)
// 540.2-543.12: (class anchor.sink.Assign:11.9)
// 544.2-571.44: (class anchor.sink.AWrite:11.9)
// 556.1-556.38: (11.9): Cannot have potential null deference in left-mover part.
// 561.1-561.20: (11.9): index < 0.
// 566.1-566.46: (11.9): index is >= length.
// 570.1-570.27: (11.9): Reduction failure
// 572.2-577.9: (class anchor.sink.Return:10.21)
// 704.1-704.34: (8.5): Vector.elems failed Write-Write Right-Mover Check
// 767.1-767.30: (8.5): Vector.elems failed Write-Read Right-Mover Check
// 834.1-834.34: (8.5): Vector.elems failed Write-Write Left-Mover Check
// 898.1-898.30: (8.5): Vector.elems failed Write-Read Left-Mover Check
// 959.1-959.34: (8.5): Vector.elems failed Read-Write Right-Mover Check
// 1023.1-1023.34: (8.5): Vector.elems failed Read-Write Left-Mover Check
// 1092.1-1092.34: (7.5): Array Array.Vector.T failed Write-Write Right-Mover Check
// 1161.1-1161.30: (7.5): Array Array.Vector.T failed Write-Read Right-Mover Check
// 1234.1-1234.34: (7.5): Array Array.Vector.T failed Write-Write Left-Mover Check
// 1304.1-1304.30: (7.5): Array Array.Vector.T failed Write-Read Left-Mover Check
// 1371.1-1371.34: (7.5): Array Array.Vector.T failed Read-Write Right-Mover Check
// 1441.1-1441.34: (7.5): Array Array.Vector.T failed Read-Write Left-Mover Check
// 1516.1-1516.140: (8.5): Vector.elems is not Write-Write Stable with respect to Vector.elems (case A.1)
// 1517.1-1517.101: (8.5): Vector.elems is not Write-Write Stable with respect to Vector.elems (case A.2)
// 1518.1-1518.158: (8.5): Vector.elems is not Write-Write Stable with respect to Vector.elems (case A.3)
// 1620.1-1620.140: (8.5): Vector.elems is not Write-Write Stable with respect to Vector.elems (case C)
// 1727.1-1727.144: (8.5): Vector.elems is not Write-Write Stable with respect to Vector.elems (case D)
// 1728.1-1728.144: (8.5): Vector.elems is not Write-Write Stable with respect to Vector.elems (case R)
// 1803.1-1803.136: (8.5): Vector.elems is not Read-Write Stable with respect to Vector.elems (case F)
// 1804.1-1804.136: (8.5): Vector.elems is not Read-Write Stable with respect to Vector.elems (case H)
// 1805.1-1805.146: (8.5): Vector.elems is not Read-Write Stable with respect to Vector.elems (case I)
// 1879.1-1879.136: (8.5): Vector.elems is not Write-Read Stable with respect to Vector.elems (case J)
// 1880.1-1880.136: (8.5): Vector.elems is not Write-Read Stable with respect to Vector.elems (case K)
// 1881.1-1881.99: (8.5): Vector.elems is not Write-Read Stable with respect to Vector.elems (case L)
// 1962.1-1962.140: (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Vector.elems (case A.1)
// 1963.1-1963.101: (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Vector.elems (case A.2)
// 1964.1-1964.156: (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Vector.elems (case A.3)
// 2073.1-2073.140: (8.5): Vector.elems is not Write-Write Stable with respect to Array Array.Vector.T (case C)
// 2187.1-2187.144: (8.5): Vector.elems is not Write-Write Stable with respect to Array Array.Vector.T (case D)
// 2188.1-2188.144: (8.5): Vector.elems is not Write-Write Stable with respect to Array Array.Vector.T (case R)
// 2268.1-2268.136: (8.5): Vector.elems is not Read-Write Stable with respect to Array Array.Vector.T (case F)
// 2269.1-2269.136: (8.5): Vector.elems is not Read-Write Stable with respect to Array Array.Vector.T (case H)
// 2270.1-2270.144: (8.5): Vector.elems is not Read-Write Stable with respect to Array Array.Vector.T (case I)
// 2349.1-2349.136: (7.5): Array Array.Vector.T is not Write-Read Stable with respect to Vector.elems (case J)
// 2350.1-2350.136: (7.5): Array Array.Vector.T is not Write-Read Stable with respect to Vector.elems (case K)
// 2351.1-2351.99: (7.5): Array Array.Vector.T is not Write-Read Stable with respect to Vector.elems (case L)
// 2432.1-2432.140: (8.5): Vector.elems is not Write-Write Stable with respect to Array Array.Vector.T (case A.1)
// 2433.1-2433.101: (8.5): Vector.elems is not Write-Write Stable with respect to Array Array.Vector.T (case A.2)
// 2434.1-2434.156: (8.5): Vector.elems is not Write-Write Stable with respect to Array Array.Vector.T (case A.3)
// 2543.1-2543.140: (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Vector.elems (case C)
// 2657.1-2657.144: (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Vector.elems (case D)
// 2658.1-2658.144: (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Vector.elems (case R)
// 2738.1-2738.136: (7.5): Array Array.Vector.T is not Read-Write Stable with respect to Vector.elems (case F)
// 2739.1-2739.136: (7.5): Array Array.Vector.T is not Read-Write Stable with respect to Vector.elems (case H)
// 2740.1-2740.144: (7.5): Array Array.Vector.T is not Read-Write Stable with respect to Vector.elems (case I)
// 2819.1-2819.136: (8.5): Vector.elems is not Write-Read Stable with respect to Array Array.Vector.T (case J)
// 2820.1-2820.136: (8.5): Vector.elems is not Write-Read Stable with respect to Array Array.Vector.T (case K)
// 2821.1-2821.99: (8.5): Vector.elems is not Write-Read Stable with respect to Array Array.Vector.T (case L)
// 2907.1-2907.140: (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Array Array.Vector.T (case A.1)
// 2908.1-2908.101: (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Array Array.Vector.T (case A.2)
// 2909.1-2909.156: (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Array Array.Vector.T (case A.3)
// 3025.1-3025.140: (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Array Array.Vector.T (case C)
// 3146.1-3146.144: (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Array Array.Vector.T (case D)
// 3147.1-3147.144: (7.5): Array Array.Vector.T is not Write-Write Stable with respect to Array Array.Vector.T (case R)
// 3232.1-3232.136: (7.5): Array Array.Vector.T is not Read-Write Stable with respect to Array Array.Vector.T (case F)
// 3233.1-3233.136: (7.5): Array Array.Vector.T is not Read-Write Stable with respect to Array Array.Vector.T (case H)
// 3234.1-3234.144: (7.5): Array Array.Vector.T is not Read-Write Stable with respect to Array Array.Vector.T (case I)
// 3318.1-3318.136: (7.5): Array Array.Vector.T is not Write-Read Stable with respect to Array Array.Vector.T (case J)
// 3319.1-3319.136: (7.5): Array Array.Vector.T is not Write-Read Stable with respect to Array Array.Vector.T (case K)
// 3320.1-3320.99: (7.5): Array Array.Vector.T is not Write-Read Stable with respect to Array Array.Vector.T (case L)
// 3353.1-3375.2: (8.5): yields_as clause for Vector.elems is not valid
// 3380.1-3397.2: (8.5): yields_as clause for Vector.elems is not reflexive
// 3403.1-3437.2: (8.5): yields_as clause for Vector.elems is not transitive
// 3457.1-3479.2: (7.32): yields_as clause for Vector._lock is not valid
// 3484.1-3501.2: (7.32): yields_as clause for Vector._lock is not reflexive
// 3507.1-3541.2: (7.32): yields_as clause for Vector._lock is not transitive
// 3559.1-3585.2: (7.5): yields_as clause for Array.Vector.T is not valid
// 3586.1-3609.2: (7.5): yields_as clause for Array.Vector.T is not reflexive
// 3614.1-3652.2: (7.5): yields_as clause for Array.Vector.T is not transitive
