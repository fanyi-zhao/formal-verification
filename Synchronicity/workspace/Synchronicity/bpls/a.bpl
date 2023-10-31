                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/a.anchor:                                
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
      volatile A x isRead                                                                           
       ? N                                                                                          
       : isLocal(newValue, tid) ? N : E                                                             
        yields_as this.x == newValue || !isLocal(newValue, tid) && !isShared(newValue);             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == A.null;                                                                    
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        assume this.x != A.null;                                                                    
        A a;                                                                                        
        a := this.x;                                                                                
        yield;                                                                                      
        A b;                                                                                        
        b := this.x;                                                                                
        yield;                                                                                      
        A c;                                                                                        
        c := this.x;                                                                                
        boolean tmp1;                                                                               
        boolean tmp2;                                                                               
        boolean tmp3;                                                                               
        tmp3 = a == b;                                                                              
        if (tmp3) {                                                                                 
          tmp2 = b == c;                                                                            
        } else {                                                                                    
          tmp2 = false;                                                                             
        }                                                                                           
        if (tmp2) {                                                                                 
          tmp1 = true;                                                                              
        } else {                                                                                    
          tmp1 = a != c;                                                                            
        }                                                                                           
        assert tmp1 /* == a == b && b == c || a != c */;                                            
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
      volatile A x isRead                                                                           
       ? N                                                                                          
       : isLocal(newValue, tid) ? N : E                                                             
        yields_as this.x == newValue || !isLocal(newValue, tid) && !isShared(newValue);             
                                                                                                    
                                                                                                    
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
        assume this.x == A.null;                                                                    
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        assume this.x != A.null;                                                                    
        A a;                                                                                        
        a := this.x;                                                                                
        yield;                                                                                      
        A b;                                                                                        
        b := this.x;                                                                                
        yield;                                                                                      
        A c;                                                                                        
        c := this.x;                                                                                
        boolean tmp1;                                                                               
        boolean tmp2;                                                                               
        boolean tmp3;                                                                               
        tmp3 = a == b;                                                                              
        if (tmp3) {                                                                                 
          tmp2 = b == c;                                                                            
        } else {                                                                                    
          tmp2 = false;                                                                             
        }                                                                                           
        if (tmp2) {                                                                                 
          tmp1 = true;                                                                              
        } else {                                                                                    
          tmp1 = a != c;                                                                            
        }                                                                                           
        assert tmp1 /* == a == b && b == c || a != c */;                                            
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
      volatile A x isRead                                                                           
       ? N                                                                                          
       : isLocal(newValue, tid) ? N : E                                                             
        yields_as this.x == newValue || !isLocal(newValue, tid) && !isShared(newValue);             
                                                                                                    
                                                                                                    
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
        assume this.x == A.null;                                                                    
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        assume this.x != A.null;                                                                    
        A a;                                                                                        
        a := this.x;                                                                                
        yield;                                                                                      
        A b;                                                                                        
        b := this.x;                                                                                
        yield;                                                                                      
        A c;                                                                                        
        c := this.x;                                                                                
        boolean tmp1;                                                                               
        boolean tmp2;                                                                               
        boolean tmp3;                                                                               
        tmp3 = a == b;                                                                              
        if (tmp3) {                                                                                 
          tmp2 = b == c;                                                                            
        } else {                                                                                    
          tmp2 = false;                                                                             
        }                                                                                           
        if (tmp2) {                                                                                 
          tmp1 = true;                                                                              
        } else {                                                                                    
          tmp1 = a != c;                                                                            
        }                                                                                           
        assert tmp1 /* == a == b && b == c || a != c */;                                            
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
      volatile A x isRead                                                                           
       ? N                                                                                          
       : isLocal(newValue, tid) ? N : E                                                             
        yields_as this.x == newValue || !isLocal(newValue, tid) && !isShared(newValue);             
                                                                                                    
                                                                                                    
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
        assume this.x == A.null;                                                                    
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        assume this.x != A.null;                                                                    
        A a;                                                                                        
        a := this.x;                                                                                
        yield;                                                                                      
        A b;                                                                                        
        b := this.x;                                                                                
        yield;                                                                                      
        A c;                                                                                        
        c := this.x;                                                                                
        boolean tmp1;                                                                               
        boolean tmp2;                                                                               
        boolean tmp3;                                                                               
        tmp3 = a == b;                                                                              
        if (tmp3) {                                                                                 
          tmp2 = b == c;                                                                            
        } else {                                                                                    
          tmp2 = false;                                                                             
        }                                                                                           
        if (tmp2) {                                                                                 
          tmp1 = true;                                                                              
        } else {                                                                                    
          tmp1 = a != c;                                                                            
        }                                                                                           
        assert tmp1 /* == a == b && b == c || a != c */;                                            
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
                                                                                                    
var A.x: [A]A;                                                                                      
                                                                                                    
function {:inline} ReadEval.A.x(tid: Tid,this : A,A._state: [A]State,A.x: [A]A,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := A.null;                                                                           
 if (isRead) then                                                                                   
  moverPath(_N, 1)                                                                                  
 else                                                                                               
  if (isLocal(A._state[newValue], tid)) then                                                        
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.A.x(tid: Tid,this : A,newValue: A,A._state: [A]State,A.x: [A]A,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_N, 1)                                                                                  
 else                                                                                               
  if (isLocal(A._state[newValue], tid)) then                                                        
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var A._lock: [A]Tid;                                                                                
                                                                                                    
function {:inline} ReadEval.A._lock(tid: Tid,this : A,A._state: [A]State,A.x: [A]A,A._lock: [A]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.A._lock(tid: Tid,this : A,newValue: Tid,A._state: [A]State,A.x: [A]A,A._lock: [A]Tid) returns (MoverPath) {
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
                                                                                                    
requires ValidTid(tid);                                                                                    // (8.3): Bad tid
requires isShared(A._state[this]);                                                                         // (8.3): this is not global
                                                                                                    
requires StateInvariant(A._state, A.x, A._lock);                                                    
                                                                                                    
ensures StateInvariant(A._state, A.x, A._lock);                                                     
{                                                                                                   
 var $recorded.state46552_post: int;                                                                
 var c46618: A;                                                                                     
 var $pc46545_post: Phase;                                                                          
 var tid46545_post: Tid;                                                                            
 var moverPath46558: MoverPath;                                                                     
 var path46544: int;                                                                                
 var b46558: A;                                                                                     
 var tid46544: Tid;                                                                                 
 var tmp246619: bool;                                                                               
 var A._state46551: [A]State;                                                                       
 var A._state46552_post: [A]State;                                                                  
 var tmp146619: bool;                                                                               
 var moverPath46551: MoverPath;                                                                     
 var this46552: A;                                                                                  
 var moverPath46544: MoverPath;                                                                     
 var A.x46618: [A]A;                                                                                
 var A._lock46618: [A]Tid;                                                                          
 var A.x46552_post: [A]A;                                                                           
 var mover46558: Mover;                                                                             
 var this46552_post: A;                                                                             
 var tmp1: bool;                                                                                    
 var $pc46551: Phase;                                                                               
 var A._state46544: [A]State;                                                                       
 var tmp2: bool;                                                                                    
 var b46619: A;                                                                                     
 var this46545: A;                                                                                  
 var b46618: A;                                                                                     
 var path46558: int;                                                                                
 var c46619: A;                                                                                     
 var tid46551: Tid;                                                                                 
 var $pc46558: Phase;                                                                               
 var mover46544: Mover;                                                                             
 var $pc46552: Phase;                                                                               
 var $pc46619: Phase;                                                                               
 var $recorded.state46545_post: int;                                                                
 var this46558: A;                                                                                  
 var this46619: A;                                                                                  
 var A.x46558: [A]A;                                                                                
 var A._state46558: [A]State;                                                                       
 var A._state46545_post: [A]State;                                                                  
 var A._state46618: [A]State;                                                                       
 var $recorded.state46618: int;                                                                     
 var a46544: A;                                                                                     
 var A._lock46544: [A]Tid;                                                                          
 var tid46619: Tid;                                                                                 
 var tid46552: Tid;                                                                                 
 var A._lock46558: [A]Tid;                                                                          
 var A.x46551: [A]A;                                                                                
 var c: A;                                                                                          
 var $recorded.state46544: int;                                                                     
 var a46545_post: A;                                                                                
 var $pc46544: Phase;                                                                               
 var tid46558: Tid;                                                                                 
 var A._lock46619: [A]Tid;                                                                          
 var $recorded.state46551: int;                                                                     
 var $pc46618: Phase;                                                                               
 var $recorded.state46552: int;                                                                     
 var b: A;                                                                                          
 var A._state46619: [A]State;                                                                       
 var a46551: A;                                                                                     
 var a: A;                                                                                          
 var this46545_post: A;                                                                             
 var path46551: int;                                                                                
 var a46552_post: A;                                                                                
 var b46552_post: A;                                                                                
 var $pc46552_post: Phase;                                                                          
 var a46619: A;                                                                                     
 var a46552: A;                                                                                     
 var A._lock46545_post: [A]Tid;                                                                     
 var tmp246618: bool;                                                                               
 var A._lock46551: [A]Tid;                                                                          
 var A.x46552: [A]A;                                                                                
 var A.x46619: [A]A;                                                                                
 var tid46618: Tid;                                                                                 
 var this46551: A;                                                                                  
 var b46551: A;                                                                                     
 var tid46545: Tid;                                                                                 
 var mover46551: Mover;                                                                             
 var $recorded.state46545: int;                                                                     
 var A._state46545: [A]State;                                                                       
 var $recorded.state46619: int;                                                                     
 var tmp3: bool;                                                                                    
 var tmp146618: bool;                                                                               
 var $pc46545: Phase;                                                                               
 var $recorded.state46558: int;                                                                     
 var A.x46544: [A]A;                                                                                
 var A._state46552: [A]State;                                                                       
 var tid46552_post: Tid;                                                                            
 var A.x46545_post: [A]A;                                                                           
 var A._lock46552_post: [A]Tid;                                                                     
 var c46558: A;                                                                                     
 var a46545: A;                                                                                     
 var tmp346618: bool;                                                                               
 var tmp346619: bool;                                                                               
 var a46558: A;                                                                                     
 var A.x46545: [A]A;                                                                                
 var A._lock46552: [A]Tid;                                                                          
 var A._lock46545: [A]Tid;                                                                          
 var this46618: A;                                                                                  
 var a46618: A;                                                                                     
 var b46552: A;                                                                                     
 var this46544: A;                                                                                  
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 9.5: assume this.x != A.null;                                                                   
                                                                                                    
 assume (A.x[this]!=A.null);                                                                        
                                                                                                    
 // 10.5: A a;                                                                                      
                                                                                                    
                                                                                                    
 // 10.5: a := this.x;                                                                              
                                                                                                    
                                                                                                    
 moverPath46544 := ReadEval.A.x(tid: Tid,this: A,A._state,A.x,A._lock);                             
 mover46544 := m#moverPath(moverPath46544);                                                         
 path46544 := p#moverPath(moverPath46544);                                                          
 assume A._state46544 == A._state && A.x46544 == A.x && A._lock46544 == A._lock && a46544 == a && this46544 == this && tid46544 == tid && $pc46544 == $pc;
 assume $recorded.state46544 == 1;                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (10.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover46544);                                                                
 assert $pc != PhaseError;                                                                                 // (10.5): Reduction failure
 a := A.x[this];                                                                                    
                                                                                                    
 // 11.5: yield;                                                                                    
                                                                                                    
 assume A._state46545 == A._state && A.x46545 == A.x && A._lock46545 == A._lock && a46545 == a && this46545 == this && tid46545 == tid;
 assume $recorded.state46545 == 1;                                                                  
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume A._state46545_post == A._state && A.x46545_post == A.x && A._lock46545_post == A._lock && a46545_post == a && this46545_post == this && tid46545_post == tid;
 assume $recorded.state46545_post == 1;                                                             
                                                                                                    
 // 12.5: A b;                                                                                      
                                                                                                    
                                                                                                    
 // 12.5: b := this.x;                                                                              
                                                                                                    
                                                                                                    
 moverPath46551 := ReadEval.A.x(tid: Tid,this: A,A._state,A.x,A._lock);                             
 mover46551 := m#moverPath(moverPath46551);                                                         
 path46551 := p#moverPath(moverPath46551);                                                          
 assume A._state46551 == A._state && A.x46551 == A.x && A._lock46551 == A._lock && b46551 == b && a46551 == a && this46551 == this && tid46551 == tid && $pc46551 == $pc;
 assume $recorded.state46551 == 1;                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (12.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover46551);                                                                
 assert $pc != PhaseError;                                                                                 // (12.5): Reduction failure
 b := A.x[this];                                                                                    
                                                                                                    
 // 13.5: yield;                                                                                    
                                                                                                    
 assume A._state46552 == A._state && A.x46552 == A.x && A._lock46552 == A._lock && b46552 == b && a46552 == a && this46552 == this && tid46552 == tid;
 assume $recorded.state46552 == 1;                                                                  
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume A._state46552_post == A._state && A.x46552_post == A.x && A._lock46552_post == A._lock && b46552_post == b && a46552_post == a && this46552_post == this && tid46552_post == tid;
 assume $recorded.state46552_post == 1;                                                             
                                                                                                    
 // 14.5: A c;                                                                                      
                                                                                                    
                                                                                                    
 // 14.5: c := this.x;                                                                              
                                                                                                    
                                                                                                    
 moverPath46558 := ReadEval.A.x(tid: Tid,this: A,A._state,A.x,A._lock);                             
 mover46558 := m#moverPath(moverPath46558);                                                         
 path46558 := p#moverPath(moverPath46558);                                                          
 assume A._state46558 == A._state && A.x46558 == A.x && A._lock46558 == A._lock && c46558 == c && b46558 == b && a46558 == a && this46558 == this && tid46558 == tid && $pc46558 == $pc;
 assume $recorded.state46558 == 1;                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (14.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover46558);                                                                
 assert $pc != PhaseError;                                                                                 // (14.5): Reduction failure
 c := A.x[this];                                                                                    
                                                                                                    
 // 15.5: boolean tmp1;                                                                             
                                                                                                    
                                                                                                    
 // 15.5: boolean tmp2;                                                                             
                                                                                                    
                                                                                                    
 // 15.5: boolean tmp3;                                                                             
                                                                                                    
                                                                                                    
 // 15.5: tmp3 = a == b;                                                                            
                                                                                                    
 tmp3 := (a==b);                                                                                    
 if (tmp3) {                                                                                        
                                                                                                    
  // 15.25: tmp2 = b == c;                                                                          
                                                                                                    
  tmp2 := (b==c);                                                                                   
 } else {                                                                                           
                                                                                                    
  // <undefined position>: tmp2 = false;                                                            
                                                                                                    
  tmp2 := false;                                                                                    
 }                                                                                                  
 if (tmp2) {                                                                                        
                                                                                                    
  // <undefined position>: tmp1 = true;                                                             
                                                                                                    
  tmp1 := true;                                                                                     
 } else {                                                                                           
                                                                                                    
  // 15.37: tmp1 = a != c;                                                                          
                                                                                                    
  tmp1 := (a!=c);                                                                                   
 }                                                                                                  
                                                                                                    
 // 15.5: assert tmp1 /* == a == b && b == c || a != c */;                                          
                                                                                                    
 assume A._state46618 == A._state && A.x46618 == A.x && A._lock46618 == A._lock && tmp346618 == tmp3 && tmp246618 == tmp2 && tmp146618 == tmp1 && c46618 == c && b46618 == b && a46618 == a && this46618 == this && tid46618 == tid;
 assume $recorded.state46618 == 1;                                                                  
 assert tmp1 /* lowered (((a==b)&&(b==c))||(a!=c)) */;                                                     // (15.5): This assertion may not hold.
                                                                                                    
 // 8.19: // return;                                                                                
                                                                                                    
 assume A._state46619 == A._state && A.x46619 == A.x && A._lock46619 == A._lock && tmp346619 == tmp3 && tmp246619 == tmp2 && tmp146619 == tmp1 && c46619 == c && b46619 == b && a46619 == a && this46619 == this && tid46619 == tid;
 assume $recorded.state46619 == 1;                                                                  
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(A._state: [A]State,A.x: [A]A,A._lock: [A]Tid) returns (bool) {   
  true &&                                                                                           
  (forall _i: A  :: _i == A.null <==> isNull(A._state[_i])) &&                                      
  (forall _i: A ::  (isShared(A._state[_i]) ==> isSharedAssignable(A._state[A.x[_i]]))) &&          
  (forall _i: A ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(A._state[_i],_t) ==> isLocalAssignable(A._state[A.x[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.A.x(t: Tid, u: Tid, v: A, w: A, x: A)                        
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
 var v_pre: A;                                                                                      
 var A.x_pre: [A]A;                                                                                 
 var w_pre: A;                                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]A;                                                                                
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: A;                                                                                     
 var w_post: A;                                                                                     
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: A,A._state,A.x,A._lock);                                 
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.x[x] := v;                                                                                       
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.x(u: Tid,x: A,w: A,A._state,A.x,A._lock);                                 
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.3): A.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.A.x(t: Tid, u: Tid, v: A, w: A, x: A)                         
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
 var v_pre: A;                                                                                      
 var A.x_pre: [A]A;                                                                                 
 var w_pre: A;                                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]A;                                                                                
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: A;                                                                                     
 var w_post: A;                                                                                     
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: A,A._state,A.x,A._lock);                                 
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
 assert _readByU_Mover == _E;                                                                              // (3.3): A.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.A.x(t: Tid, u: Tid, v: A, w: A, x: A)                         
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
 var havocValue : A;                                                                                
 var v_pre: A;                                                                                      
 var A.x_pre: [A]A;                                                                                 
 var w_pre: A;                                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]A;                                                                                
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: A;                                                                                     
 var w_post: A;                                                                                     
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == A.x[x];                                                                                
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: A,A._state,A.x,A._lock);                                 
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 A.x[x] := havocValue;                                                                              
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.x(u: Tid,x: A,w: A,A._state,A.x,A._lock);                                 
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.3): A.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.A.x(t: Tid, u: Tid, v: A, w: A, x: A)                          
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
 var havocValue : A;                                                                                
 var v_pre: A;                                                                                      
 var A.x_pre: [A]A;                                                                                 
 var w_pre: A;                                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]A;                                                                                
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: A;                                                                                     
 var w_post: A;                                                                                     
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
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: A,A._state,A.x,A._lock);                                 
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.3): A.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.A.x(t: Tid, u: Tid, v: A, w: A, x: A)                              
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
 var v_pre: A;                                                                                      
 var A.x_pre: [A]A;                                                                                 
 var w_pre: A;                                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]A;                                                                                
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: A;                                                                                     
 var w_post: A;                                                                                     
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
 _writeByU := WriteEval.A.x(u: Tid,x: A,w: A,A._state,A.x,A._lock);                                 
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.3): A.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.A.x(t: Tid, u: Tid, v: A, w: A, x: A)                               
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
 var havocValue : A;                                                                                
 var v_pre: A;                                                                                      
 var A.x_pre: [A]A;                                                                                 
 var w_pre: A;                                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]A;                                                                                
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: A;                                                                                     
 var w_post: A;                                                                                     
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
 _writeByU := WriteEval.A.x(u: Tid,x: A,w: A,A._state,A.x,A._lock);                                 
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.3): A.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.x.A.x(t: Tid, u: Tid, v: A, w: A, w0: A, x: A, y: A)                    
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
 var w0_pre: A;                                                                                     
 var v_pre: A;                                                                                      
 var A.x_pre: [A]A;                                                                                 
 var w_pre: A;                                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]A;                                                                                
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: A;                                                                                     
 var w_post: A;                                                                                     
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: A;                                                                                    
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.x(u: Tid,y: A,w: A,A._state,A.x,A._lock);                                 
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: A,A._state,A.x,A._lock);                                 
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.x[x] := v;                                                                                       
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.x(u: Tid,y: A,w: A,A._state,A.x,A._lock);                             
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.3): A.x is not Write-Write Stable with respect to A.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.3): A.x is not Write-Write Stable with respect to A.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.3): A.x is not Write-Write Stable with respect to A.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.x.A.x(t: Tid, u: Tid, v: A, w: A, w0: A, x: A, y: A)                    
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.x;                                                                                      
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : A;                                                                                      
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
 var w0_pre: A;                                                                                     
 var v_pre: A;                                                                                      
 var A.x_pre: [A]A;                                                                                 
 var w_pre: A;                                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var w_mid: A;                                                                                      
 var A._lock_mid: [A]Tid;                                                                           
 var w0_mid: A;                                                                                     
 var v_mid: A;                                                                                      
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var y_mid: A;                                                                                      
 var A.x_mid: [A]A;                                                                                 
 var $pc_mid: Phase;                                                                                
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]A;                                                                                
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: A;                                                                                     
 var w_post: A;                                                                                     
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: A;                                                                                    
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: A,A._state,A.x,A._lock);                                 
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.x[x];                                                                                    
 A.x[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.x_mid == A.x && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.x(u: Tid,y: A,w: A,A._state,A.x,A._lock);                                 
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.x[x] := tmpV;                                                                                    
 A.x[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.x(t: Tid,x: A,v: A,A._state,A.x,A._lock);                             
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): A.x is not Write-Write Stable with respect to A.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.x.A.x(t: Tid, u: Tid, v: A, w: A, w0: A, x: A, y: A)                   
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.x;                                                                                      
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : A;                                                                                      
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
 var w0_pre: A;                                                                                     
 var v_pre: A;                                                                                      
 var A.x_pre: [A]A;                                                                                 
 var w_pre: A;                                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var w_mid: A;                                                                                      
 var A._lock_mid: [A]Tid;                                                                           
 var w0_mid: A;                                                                                     
 var v_mid: A;                                                                                      
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var y_mid: A;                                                                                      
 var A.x_mid: [A]A;                                                                                 
 var $pc_mid: Phase;                                                                                
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]A;                                                                                
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: A;                                                                                     
 var w_post: A;                                                                                     
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: A;                                                                                    
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.x(u: Tid,y: A,w: A,A._state,A.x,A._lock);                                 
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: A,A._state,A.x,A._lock);                                 
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.x[x];                                                                                    
 A.x[x] := v;                                                                                       
 assume A._state_mid == A._state && A.x_mid == A.x && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.x(u: Tid,y: A,w: A,A._state,A.x,A._lock);                             
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.x[x] := tmpV;                                                                                    
 A.x[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.x(t: Tid,x: A,v: A,A._state,A.x,A._lock);                             
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): A.x is not Write-Write Stable with respect to A.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): A.x is not Write-Write Stable with respect to A.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.x.A.x(t: Tid, u: Tid, v: A, w: A, w0: A, x: A, y: A)                  
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
 var w0_pre: A;                                                                                     
 var v_pre: A;                                                                                      
 var A.x_pre: [A]A;                                                                                 
 var w_pre: A;                                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]A;                                                                                
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: A;                                                                                     
 var w_post: A;                                                                                     
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: A;                                                                                    
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.x(t: Tid,x: A,A._state,A.x,A._lock);                                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.x(u: Tid,y: A,w: A,A._state,A.x,A._lock);                                 
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): A.x is not Read-Write Stable with respect to A.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): A.x is not Read-Write Stable with respect to A.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): A.x is not Read-Write Stable with respect to A.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.x.A.x(t: Tid, u: Tid, v: A, w: A, w0: A, x: A, y: A)                  
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
 var w0_pre: A;                                                                                     
 var v_pre: A;                                                                                      
 var A.x_pre: [A]A;                                                                                 
 var w_pre: A;                                                                                      
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]A;                                                                                
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: A;                                                                                     
 var w_post: A;                                                                                     
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: A;                                                                                    
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.x(u: Tid,y: A,A._state,A.x,A._lock);                                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: A,A._state,A.x,A._lock);                                 
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.3): A.x is not Write-Read Stable with respect to A.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.3): A.x is not Write-Read Stable with respect to A.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.3): A.x is not Write-Read Stable with respect to A.x (case L)
                                                                                                    
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
                                                                                                    
function {:inline} Y_A.x(tid : Tid, this: A, newValue: A , A._state: [A]State, A.x: [A]A, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A.x(tid: Tid,this: A,A._state,A.x,A._lock)), _R)) ==> (A.x[this] == newValue))
 &&(((A.x[this]==newValue)||(!(isLocal(A._state[newValue], tid))&&!(isShared(A._state[newValue])))))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_A.x(tid : Tid, this: A, newValue: A , A._state: [A]State, A.x: [A]A, A._lock: [A]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A.x.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: A , A._state: [A]State, A.x: [A]A, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var A.x_yield: [A]A;                                                                                
var newValue_yield: A;                                                                              
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var u_yield: Tid;                                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A.x(u: Tid,this: A,newValue: A,A._state,A.x,A._lock)));      
                                                                                                    
assume A._state_yield == A._state && A.x_yield == A.x && A._lock_yield == A._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.x(tid, this, newValue , A._state, A.x, A._lock);                                        
}                                                                                                   
                                                                                                    
procedure Y_A.x.Reflexive(tid : Tid, this: A , A._state: [A]State, A.x: [A]A, A._lock: [A]Tid)      
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var A.x_yield: [A]A;                                                                                
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A.x_yield == A.x && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.x(tid, this, A.x[this] , A._state, A.x, A._lock);                                       
}                                                                                                   
                                                                                                    
procedure Y_A.x.Transitive(tid : Tid, this: A, newValue : A , A._state: [A]State, A.x: [A]A, A._lock: [A]Tid , A._state_p: [A]State, A.x_p: [A]A, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires StateInvariant(A._state_p, A.x_p, A._lock_p);                                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var A.x_pre: [A]A;                                                                                  
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var A._state_pre: [A]State;                                                                         
var newValue_pre: A;                                                                                
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
                                                                                                    
var $recorded.state_post: int;                                                                      
var A.x_post: [A]A;                                                                                 
var $pc_post: Phase;                                                                                
var this_post: A;                                                                                   
var tid_post: Tid;                                                                                  
var A._state_post: [A]State;                                                                        
var A._lock_post: [A]Tid;                                                                           
var newValue_post: A;                                                                               
                                                                                                    
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
                                                                                                    
function {:inline} Y_A._lock(tid : Tid, this: A, newValue: Tid , A._state: [A]State, A.x: [A]A, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A._lock(tid: Tid,this: A,A._state,A.x,A._lock)), _R)) ==> (A._lock[this] == newValue))
 &&(((A._lock[this]==tid)==(newValue==tid)))                                                        
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_A._lock(tid : Tid, this: A, newValue: Tid , A._state: [A]State, A.x: [A]A, A._lock: [A]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: Tid , A._state: [A]State, A.x: [A]A, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var A.x_yield: [A]A;                                                                                
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var u_yield: Tid;                                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A._lock(u: Tid,this: A,newValue: Tid,A._state,A.x,A._lock)));
 assume leq(m#moverPath(ReadEval.A._lock(tid: Tid,this: A,A._state,A.x,A._lock)), _N);              
assume A._state_yield == A._state && A.x_yield == A.x && A._lock_yield == A._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A._lock(tid, this, newValue , A._state, A.x, A._lock);                                    
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Reflexive(tid : Tid, this: A , A._state: [A]State, A.x: [A]A, A._lock: [A]Tid)  
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var A.x_yield: [A]A;                                                                                
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A.x_yield == A.x && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A._lock(tid, this, A._lock[this] , A._state, A.x, A._lock);                               
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Transitive(tid : Tid, this: A, newValue : Tid , A._state: [A]State, A.x: [A]A, A._lock: [A]Tid , A._state_p: [A]State, A.x_p: [A]A, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires StateInvariant(A._state_p, A.x_p, A._lock_p);                                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var A.x_pre: [A]A;                                                                                  
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var A._state_pre: [A]State;                                                                         
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var A.x_post: [A]A;                                                                                 
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
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , A._state: [A]State, A.x: [A]A, A._lock: [A]Tid , A._state_p: [A]State, A.x_p: [A]A, A._lock_p: [A]Tid): bool
{                                                                                                   
 (forall this: A :: Y_A.x(tid : Tid, this, A.x_p[this] , A._state, A.x, A._lock))                   
 && (forall this: A :: Y_A._lock(tid : Tid, this, A._lock_p[this] , A._state, A.x, A._lock))        
 && (forall _i : A :: isShared(A._state[_i]) ==> isShared(A._state_p[_i]))                          
 && (forall _i : A :: isLocal(A._state[_i], tid) <==> isLocal(A._state_p[_i], tid))                 
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 524.1-777.2: (Method:8.3)
// 531.1-531.24: (8.3): Bad tid
// 532.1-532.35: (8.3): this is not global
// 645.2-648.29: (class anchor.sink.Assume:9.5)
// 649.2-651.2: (class anchor.sink.VarDeclStmt:10.5)
// 652.2-669.17: (class anchor.sink.Read:10.5)
// 664.1-664.25: (10.5): Cannot have potential null deference in left-mover part.
// 668.1-668.27: (10.5): Reduction failure
// 670.2-678.40: (class anchor.sink.Yield:11.5)
// 679.2-681.2: (class anchor.sink.VarDeclStmt:12.5)
// 682.2-699.17: (class anchor.sink.Read:12.5)
// 694.1-694.25: (12.5): Cannot have potential null deference in left-mover part.
// 698.1-698.27: (12.5): Reduction failure
// 700.2-708.40: (class anchor.sink.Yield:13.5)
// 709.2-711.2: (class anchor.sink.VarDeclStmt:14.5)
// 712.2-729.17: (class anchor.sink.Read:14.5)
// 724.1-724.25: (14.5): Cannot have potential null deference in left-mover part.
// 728.1-728.27: (14.5): Reduction failure
// 730.2-732.2: (class anchor.sink.VarDeclStmt:15.5)
// 733.2-735.2: (class anchor.sink.VarDeclStmt:15.5)
// 736.2-738.2: (class anchor.sink.VarDeclStmt:15.5)
// 739.2-742.17: (class anchor.sink.Assign:15.5)
// 744.3-747.18: (class anchor.sink.Assign:15.25)
// 749.3-752.17: (class anchor.sink.Assign:<undefined position>)
// 755.3-758.16: (class anchor.sink.Assign:<undefined position>)
// 760.3-763.18: (class anchor.sink.Assign:15.37)
// 765.2-770.55: (class anchor.sink.Assert:15.5)
// 770.1-770.55: (15.5): This assertion may not hold.
// 771.2-776.9: (class anchor.sink.Return:8.19)
// 853.1-853.34: (3.3): A.x failed Write-Write Right-Mover Check
// 910.1-910.30: (3.3): A.x failed Write-Read Right-Mover Check
// 971.1-971.34: (3.3): A.x failed Write-Write Left-Mover Check
// 1029.1-1029.30: (3.3): A.x failed Write-Read Left-Mover Check
// 1084.1-1084.34: (3.3): A.x failed Read-Write Right-Mover Check
// 1142.1-1142.34: (3.3): A.x failed Read-Write Left-Mover Check
// 1211.1-1211.140: (3.3): A.x is not Write-Write Stable with respect to A.x (case A.1)
// 1212.1-1212.101: (3.3): A.x is not Write-Write Stable with respect to A.x (case A.2)
// 1213.1-1213.158: (3.3): A.x is not Write-Write Stable with respect to A.x (case A.3)
// 1306.1-1306.140: (3.3): A.x is not Write-Write Stable with respect to A.x (case C)
// 1404.1-1404.144: (3.3): A.x is not Write-Write Stable with respect to A.x (case D)
// 1405.1-1405.144: (3.3): A.x is not Write-Write Stable with respect to A.x (case R)
// 1474.1-1474.136: (3.3): A.x is not Read-Write Stable with respect to A.x (case F)
// 1475.1-1475.136: (3.3): A.x is not Read-Write Stable with respect to A.x (case H)
// 1476.1-1476.146: (3.3): A.x is not Read-Write Stable with respect to A.x (case I)
// 1544.1-1544.136: (3.3): A.x is not Write-Read Stable with respect to A.x (case J)
// 1545.1-1545.136: (3.3): A.x is not Write-Read Stable with respect to A.x (case K)
// 1546.1-1546.99: (3.3): A.x is not Write-Read Stable with respect to A.x (case L)
// 1578.1-1597.2: (5.45): yields_as clause for A.x is not valid
// 1602.1-1616.2: (5.45): yields_as clause for A.x is not reflexive
// 1622.1-1650.2: (5.45): yields_as clause for A.x is not transitive
// 1670.1-1689.2: (7.32): yields_as clause for A._lock is not valid
// 1694.1-1708.2: (7.32): yields_as clause for A._lock is not reflexive
// 1714.1-1742.2: (7.32): yields_as clause for A._lock is not transitive
