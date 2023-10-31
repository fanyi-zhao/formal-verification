                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/forall.sink:                            
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = int[isLocal(this, tid) ? B : E]                                                     
                                                                                                    
      array T2 = int[isLocal(athis, tid) ? B : E]                                                   
                                                                                                    
                                                                                                    
      requires x > 0;                                                                               
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f(int x) {                                                                        
        assert x > -10;                                                                             
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
      requires x > 0;                                                                               
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void g(int x) {                                                                        
        assert x > 10;                                                                              
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void h() {                                                                             
        [Cow.T{this}] a;                                                                            
        a = new [Cow.T{this}](10);                                                                  
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 10)                                                                              
          invariant isLocal(a, tid);                                                                
          {                                                                                         
          a[i] := 0;                                                                                
          i = i + 1;                                                                                
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void h2() {                                                                            
        [Cow.T2{this}] a;                                                                           
        a = new [Cow.T2{this}](10);                                                                 
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 10)                                                                              
          invariant forall int j ::0 <= j && j < i ==> a[j] == j;                                   
          {                                                                                         
          a[i] := i;                                                                                
          i = i + 1;                                                                                
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = int[isLocal(this, tid) ? B : E]                                                     
                                                                                                    
      array T2 = int[isLocal(athis, tid) ? B : E]                                                   
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
      requires x > 0;                                                                               
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f(int x) {                                                                        
        assert x > -10;                                                                             
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires x > 0;                                                                               
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void g(int x) {                                                                        
        assert x > 10;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void h() {                                                                             
        [Cow.T{this}] a;                                                                            
        a = new [Cow.T{this}](10);                                                                  
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 10)                                                                              
          invariant isLocal(a, tid);                                                                
          {                                                                                         
          a[i] := 0;                                                                                
          i = i + 1;                                                                                
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void h2() {                                                                            
        [Cow.T2{this}] a;                                                                           
        a = new [Cow.T2{this}](10);                                                                 
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 10)                                                                              
          invariant forall int j ::0 <= j && j < i ==> a[j] == j;                                   
          {                                                                                         
          a[i] := i;                                                                                
          i = i + 1;                                                                                
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = int[isLocal(this, tid) ? B : E]                                                     
                                                                                                    
      array T2 = int[isLocal(athis, tid) ? B : E]                                                   
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
      requires x > 0;                                                                               
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f(int x) {                                                                        
        assert x > -10;                                                                             
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires x > 0;                                                                               
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void g(int x) {                                                                        
        assert x > 10;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void h() {                                                                             
        [Cow.T{this}] a;                                                                            
        a = new [Cow.T{this}](10);                                                                  
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 10)                                                                              
          invariant isLocal(a, tid);                                                                
          {                                                                                         
          a[i] := 0;                                                                                
          i = i + 1;                                                                                
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void h2() {                                                                            
        [Cow.T2{this}] a;                                                                           
        a = new [Cow.T2{this}](10);                                                                 
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 10)                                                                              
          invariant forall int j ::0 <= j && j < i ==> a[j] == j;                                   
          {                                                                                         
          a[i] := i;                                                                                
          i = i + 1;                                                                                
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = int[isLocal(this, tid) ? B : E]                                                     
                                                                                                    
      array T2 = int[isLocal(athis, tid) ? B : E]                                                   
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
      requires x > 0;                                                                               
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f(int x) {                                                                        
        assert x > -10;                                                                             
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires x > 0;                                                                               
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void g(int x) {                                                                        
        assert x > 10;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void h() {                                                                             
        [Cow.T{this}] a;                                                                            
        a = new [Cow.T{this}](10);                                                                  
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 10)                                                                              
          invariant isLocal(a, tid);                                                                
          {                                                                                         
          a[i] := 0;                                                                                
          i = i + 1;                                                                                
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void h2() {                                                                            
        [Cow.T2{this}] a;                                                                           
        a = new [Cow.T2{this}](10);                                                                 
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 10)                                                                              
          invariant forall int j ::0 <= j && j < i ==> a[j] == j;                                   
          {                                                                                         
          a[i] := i;                                                                                
          i = i + 1;                                                                                
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
                                                                                                    
                                                                                                    
/*** Class Decl Cow ***/                                                                            
                                                                                                    
type Cow;                                                                                           
const unique Cow.null: Cow;                                                                         
var Cow._state: [Cow]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int,Array.Cow.T2._state: [Array.Cow.T2]State,Array.Cow.T2._elems: [Array.Cow.T2]([int]int),Array.Cow.T2._length: [Array.Cow.T2]int) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int,Array.Cow.T2._state: [Array.Cow.T2]State,Array.Cow.T2._elems: [Array.Cow.T2]([int]int),Array.Cow.T2._length: [Array.Cow.T2]int) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
procedure  Cow.f(tid:Tid, this : Cow, x : int)                                                      
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
modifies Array.Cow.T2._state;                                                                       
modifies Array.Cow.T2._elems;                                                                       
                                                                                                    
requires ValidTid(tid);                                                                                    // (6.3): Bad tid
requires isShared(Cow._state[this]);                                                                       // (6.3): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
requires (x>0);                                                                                     
                                                                                                    
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
{                                                                                                   
 var Cow._lock1775661: [Cow]Tid;                                                                    
 var Array.Cow.T._length1775661: [Array.Cow.T]int;                                                  
 var Array.Cow.T._state1775661: [Array.Cow.T]State;                                                 
 var Array.Cow.T2._length1775660: [Array.Cow.T2]int;                                                
 var Array.Cow.T._elems1775661: [Array.Cow.T]([int]int);                                            
 var x1775661: int;                                                                                 
 var this1775660: Cow;                                                                              
 var tid1775661: Tid;                                                                               
 var Array.Cow.T2._elems1775661: [Array.Cow.T2]([int]int);                                          
 var $recorded.state1775660: int;                                                                   
 var Cow._state1775660: [Cow]State;                                                                 
 var Array.Cow.T2._state1775661: [Array.Cow.T2]State;                                               
 var $pc1775661: Phase;                                                                             
 var tid1775660: Tid;                                                                               
 var Cow._state1775661: [Cow]State;                                                                 
 var Array.Cow.T2._elems1775660: [Array.Cow.T2]([int]int);                                          
 var Array.Cow.T._length1775660: [Array.Cow.T]int;                                                  
 var $recorded.state1775661: int;                                                                   
 var x1775660: int;                                                                                 
 var Array.Cow.T._elems1775660: [Array.Cow.T]([int]int);                                            
 var Cow._lock1775660: [Cow]Tid;                                                                    
 var Array.Cow.T2._length1775661: [Array.Cow.T2]int;                                                
 var Array.Cow.T._state1775660: [Array.Cow.T]State;                                                 
 var this1775661: Cow;                                                                              
 var $pc1775660: Phase;                                                                             
 var Array.Cow.T2._state1775660: [Array.Cow.T2]State;                                               
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
 assert true;                                                                                              // (6.14): Can only have right-mover memory accesses in requires clause
                                                                                                    
                                                                                                    
 // 8.5: assert x > -10;                                                                            
                                                                                                    
 assume Cow._state1775660 == Cow._state && Cow._lock1775660 == Cow._lock && Array.Cow.T._state1775660 == Array.Cow.T._state && Array.Cow.T._elems1775660 == Array.Cow.T._elems && Array.Cow.T._length1775660 == Array.Cow.T._length && Array.Cow.T2._state1775660 == Array.Cow.T2._state && Array.Cow.T2._elems1775660 == Array.Cow.T2._elems && Array.Cow.T2._length1775660 == Array.Cow.T2._length && x1775660 == x && this1775660 == this && tid1775660 == tid;
 assume $recorded.state1775660 == 1;                                                                
 assert (x>-(10));                                                                                         // (8.5): This assertion may not hold.
                                                                                                    
 // 7.24: // return;                                                                                
                                                                                                    
 assume Cow._state1775661 == Cow._state && Cow._lock1775661 == Cow._lock && Array.Cow.T._state1775661 == Array.Cow.T._state && Array.Cow.T._elems1775661 == Array.Cow.T._elems && Array.Cow.T._length1775661 == Array.Cow.T._length && Array.Cow.T2._state1775661 == Array.Cow.T2._state && Array.Cow.T2._elems1775661 == Array.Cow.T2._elems && Array.Cow.T2._length1775661 == Array.Cow.T2._length && x1775661 == x && this1775661 == this && tid1775661 == tid;
 assume $recorded.state1775661 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.g(tid:Tid, this : Cow, x : int)                                                      
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
modifies Array.Cow.T2._state;                                                                       
modifies Array.Cow.T2._elems;                                                                       
                                                                                                    
requires ValidTid(tid);                                                                                    // (11.3): Bad tid
requires isShared(Cow._state[this]);                                                                       // (11.3): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
requires (x>0);                                                                                     
                                                                                                    
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
{                                                                                                   
 var Cow._state1775671: [Cow]State;                                                                 
 var tid1775671: Tid;                                                                               
 var x1775671: int;                                                                                 
 var Array.Cow.T2._elems1775671: [Array.Cow.T2]([int]int);                                          
 var Array.Cow.T._length1775670: [Array.Cow.T]int;                                                  
 var Array.Cow.T2._length1775671: [Array.Cow.T2]int;                                                
 var Array.Cow.T._length1775671: [Array.Cow.T]int;                                                  
 var this1775671: Cow;                                                                              
 var Array.Cow.T._state1775670: [Array.Cow.T]State;                                                 
 var Cow._lock1775671: [Cow]Tid;                                                                    
 var Cow._state1775670: [Cow]State;                                                                 
 var $pc1775671: Phase;                                                                             
 var Array.Cow.T._state1775671: [Array.Cow.T]State;                                                 
 var x1775670: int;                                                                                 
 var tid1775670: Tid;                                                                               
 var $recorded.state1775670: int;                                                                   
 var Array.Cow.T._elems1775671: [Array.Cow.T]([int]int);                                            
 var $pc1775670: Phase;                                                                             
 var Array.Cow.T2._state1775671: [Array.Cow.T2]State;                                               
 var $recorded.state1775671: int;                                                                   
 var Array.Cow.T._elems1775670: [Array.Cow.T]([int]int);                                            
 var Array.Cow.T2._elems1775670: [Array.Cow.T2]([int]int);                                          
 var Array.Cow.T2._length1775670: [Array.Cow.T2]int;                                                
 var this1775670: Cow;                                                                              
 var Array.Cow.T2._state1775670: [Array.Cow.T2]State;                                               
 var Cow._lock1775670: [Cow]Tid;                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
 assert true;                                                                                              // (11.14): Can only have right-mover memory accesses in requires clause
                                                                                                    
                                                                                                    
 // 13.5: assert x > 10;                                                                            
                                                                                                    
 assume Cow._state1775670 == Cow._state && Cow._lock1775670 == Cow._lock && Array.Cow.T._state1775670 == Array.Cow.T._state && Array.Cow.T._elems1775670 == Array.Cow.T._elems && Array.Cow.T._length1775670 == Array.Cow.T._length && Array.Cow.T2._state1775670 == Array.Cow.T2._state && Array.Cow.T2._elems1775670 == Array.Cow.T2._elems && Array.Cow.T2._length1775670 == Array.Cow.T2._length && x1775670 == x && this1775670 == this && tid1775670 == tid;
 assume $recorded.state1775670 == 1;                                                                
 assert (x>10);                                                                                            // (13.5): This assertion may not hold.
                                                                                                    
 // 12.24: // return;                                                                               
                                                                                                    
 assume Cow._state1775671 == Cow._state && Cow._lock1775671 == Cow._lock && Array.Cow.T._state1775671 == Array.Cow.T._state && Array.Cow.T._elems1775671 == Array.Cow.T._elems && Array.Cow.T._length1775671 == Array.Cow.T._length && Array.Cow.T2._state1775671 == Array.Cow.T2._state && Array.Cow.T2._elems1775671 == Array.Cow.T2._elems && Array.Cow.T2._length1775671 == Array.Cow.T2._length && x1775671 == x && this1775671 == this && tid1775671 == tid;
 assume $recorded.state1775671 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.h(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
modifies Array.Cow.T2._state;                                                                       
modifies Array.Cow.T2._elems;                                                                       
                                                                                                    
requires ValidTid(tid);                                                                                    // (16.3): Bad tid
requires isShared(Cow._state[this]);                                                                       // (16.3): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
{                                                                                                   
 var tid1775705: Tid;                                                                               
 var Array.Cow.T._state1775705: [Array.Cow.T]State;                                                 
 var Array.Cow.T._length1775706: [Array.Cow.T]int;                                                  
 var Array.Cow.T._length1775705: [Array.Cow.T]int;                                                  
 var a1775705_bottom: Array.Cow.T;                                                                  
 var Array.Cow.T2._elems1775706: [Array.Cow.T2]([int]int);                                          
 var Cow._lock1775705_bottom: [Cow]Tid;                                                             
 var a1775705: Array.Cow.T;                                                                         
 var Array.Cow.T2._state1775706: [Array.Cow.T2]State;                                               
 var $pc1775705_bottom: Phase;                                                                      
 var i1775706: int;                                                                                 
 var this1775696: Cow;                                                                              
 var Array.Cow.T._elems1775705: [Array.Cow.T]([int]int);                                            
 var moverPath1775696: MoverPath;                                                                   
 var $pc1775705: Phase;                                                                             
 var i: int;                                                                                        
 var i1775696: int;                                                                                 
 var this1775705: Cow;                                                                              
 var Cow._lock1775696: [Cow]Tid;                                                                    
 var a1775696: Array.Cow.T;                                                                         
 var $recorded.state1775705_bottom: int;                                                            
 var Array.Cow.T._state1775706: [Array.Cow.T]State;                                                 
 var path1775696: int;                                                                              
 var Cow._state1775696: [Cow]State;                                                                 
 var $recorded.state1775705: int;                                                                   
 var this1775705_bottom: Cow;                                                                       
 var tid1775705_bottom: Tid;                                                                        
 var Array.Cow.T._length1775696: [Array.Cow.T]int;                                                  
 var Array.Cow.T2._elems1775705_bottom: [Array.Cow.T2]([int]int);                                   
 var $pc1775696: Phase;                                                                             
 var tid1775696: Tid;                                                                               
 var $recorded.state1775706: int;                                                                   
 var Cow._lock1775706: [Cow]Tid;                                                                    
 var mover1775696: Mover;                                                                           
 var Array.Cow.T._state1775705_bottom: [Array.Cow.T]State;                                          
 var Array.Cow.T2._length1775705: [Array.Cow.T2]int;                                                
 var i1775705: int;                                                                                 
 var Array.Cow.T2._length1775696: [Array.Cow.T2]int;                                                
 var Array.Cow.T._length1775705_bottom: [Array.Cow.T]int;                                           
 var Array.Cow.T2._length1775706: [Array.Cow.T2]int;                                                
 var tid1775706: Tid;                                                                               
 var Array.Cow.T._state1775696: [Array.Cow.T]State;                                                 
 var $pc1775706: Phase;                                                                             
 var i1775705_bottom: int;                                                                          
 var this1775706: Cow;                                                                              
 var Array.Cow.T2._elems1775705: [Array.Cow.T2]([int]int);                                          
 var Cow._state1775706: [Cow]State;                                                                 
 var Array.Cow.T._elems1775705_bottom: [Array.Cow.T]([int]int);                                     
 var phase1775705: Phase;                                                                           
 var $recorded.state1775696: int;                                                                   
 var Cow._state1775705_bottom: [Cow]State;                                                          
 var Array.Cow.T._elems1775706: [Array.Cow.T]([int]int);                                            
 var Cow._state1775705: [Cow]State;                                                                 
 var Array.Cow.T2._state1775696: [Array.Cow.T2]State;                                               
 var Array.Cow.T2._elems1775696: [Array.Cow.T2]([int]int);                                          
 var a: Array.Cow.T;                                                                                
 var Cow._lock1775705: [Cow]Tid;                                                                    
 var Array.Cow.T2._length1775705_bottom: [Array.Cow.T2]int;                                         
 var Array.Cow.T2._state1775705_bottom: [Array.Cow.T2]State;                                        
 var a1775706: Array.Cow.T;                                                                         
 var Array.Cow.T._elems1775696: [Array.Cow.T]([int]int);                                            
 var Array.Cow.T2._state1775705: [Array.Cow.T2]State;                                               
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 17.5: [Cow.T{this}] a;                                                                          
                                                                                                    
                                                                                                    
 // 17.5: a = new [Cow.T{this}](10);                                                                
                                                                                                    
 havoc a;                                                                                           
 assume isFresh(Array.Cow.T._state[a]);                                                             
 assume Array.Cow.T._length[a] == 10;                                                               
 assume Array.Cow.T._this[a] == this;                                                               
 Array.Cow.T._state[a] := LOCAL(tid);                                                               
 assume (forall _i : int :: 0 <= _i ==> Array.Cow.T._elems[a][_i] == 0);                            
                                                                                                    
 // 18.5: int i;                                                                                    
                                                                                                    
                                                                                                    
 // 18.13: i = 0;                                                                                   
                                                                                                    
 i := 0;                                                                                            
 assume Cow._state1775705 == Cow._state && Cow._lock1775705 == Cow._lock && Array.Cow.T._state1775705 == Array.Cow.T._state && Array.Cow.T._elems1775705 == Array.Cow.T._elems && Array.Cow.T._length1775705 == Array.Cow.T._length && Array.Cow.T2._state1775705 == Array.Cow.T2._state && Array.Cow.T2._elems1775705 == Array.Cow.T2._elems && Array.Cow.T2._length1775705 == Array.Cow.T2._length && i1775705 == i && a1775705 == a && this1775705 == this && tid1775705 == tid;
 assume $recorded.state1775705 == 1;                                                                
                                                                                                    
 // 19.5: while (i < 10)                                                                            
                                                                                                    
 phase1775705 := $pc;                                                                               
 while ((i<10))                                                                                     
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (16.3): Bad tid
  invariant isShared(Cow._state[this]);                                                                    // (16.3): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
  invariant isLocal(Array.Cow.T._state[a], tid);                                                    
  invariant (forall _athis : Array.Cow.T, _index : int :: Invariant.Y_Array.Cow.T(tid : Tid, _athis, _index, Array.Cow.T._elems[_athis][_index] ,Cow._state1775705,Cow._lock1775705,Array.Cow.T._state1775705,Array.Cow.T._elems1775705,Array.Cow.T._length1775705,Array.Cow.T2._state1775705,Array.Cow.T2._elems1775705,Array.Cow.T2._length1775705));       // (19.5): Loop does not preserve yields_as annotation for field ArrayDecl(T,IntType(),index,Spec(Cond(IsLocal(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List()))
  invariant (forall _athis : Array.Cow.T2, _index : int :: Invariant.Y_Array.Cow.T2(tid : Tid, _athis, _index, Array.Cow.T2._elems[_athis][_index] ,Cow._state1775705,Cow._lock1775705,Array.Cow.T._state1775705,Array.Cow.T._elems1775705,Array.Cow.T._length1775705,Array.Cow.T2._state1775705,Array.Cow.T2._elems1775705,Array.Cow.T2._length1775705));       // (19.5): Loop does not preserve yields_as annotation for field ArrayDecl(T2,IntType(),index,Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List()))
  invariant phase1775705 == $pc;                                                                           // (19.5): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (19.5): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 23.7: a[i] := 0;                                                                               
                                                                                                    
                                                                                                    
  moverPath1775696 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,i: int,0: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
  mover1775696 := m#moverPath(moverPath1775696);                                                    
  path1775696 := p#moverPath(moverPath1775696);                                                     
  assume Cow._state1775696 == Cow._state && Cow._lock1775696 == Cow._lock && Array.Cow.T._state1775696 == Array.Cow.T._state && Array.Cow.T._elems1775696 == Array.Cow.T._elems && Array.Cow.T._length1775696 == Array.Cow.T._length && Array.Cow.T2._state1775696 == Array.Cow.T2._state && Array.Cow.T2._elems1775696 == Array.Cow.T2._elems && Array.Cow.T2._length1775696 == Array.Cow.T2._length && i1775696 == i && a1775696 == a && this1775696 == this && tid1775696 == tid && $pc1775696 == $pc;
  assume $recorded.state1775696 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume a != Array.Cow.T.null;                                                                    
  } else {                                                                                          
   assert a != Array.Cow.T.null;                                                                           // (23.7): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume 0 <= i;                                                                                   
  } else {                                                                                          
   assert 0 <= i;                                                                                          // (23.7): index < 0.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume i < Array.Cow.T._length[a];                                                               
  } else {                                                                                          
   assert i < Array.Cow.T._length[a];                                                                      // (23.7): index is >= length.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1775696);                                                             
  assert $pc != PhaseError;                                                                                // (23.7): Reduction failure
  Array.Cow.T._elems[a][i] := 0;                                                                    
                                                                                                    
  // 24.13: i = i + 1;                                                                              
                                                                                                    
  i := (i+1);                                                                                       
  assume Cow._state1775705_bottom == Cow._state && Cow._lock1775705_bottom == Cow._lock && Array.Cow.T._state1775705_bottom == Array.Cow.T._state && Array.Cow.T._elems1775705_bottom == Array.Cow.T._elems && Array.Cow.T._length1775705_bottom == Array.Cow.T._length && Array.Cow.T2._state1775705_bottom == Array.Cow.T2._state && Array.Cow.T2._elems1775705_bottom == Array.Cow.T2._elems && Array.Cow.T2._length1775705_bottom == Array.Cow.T2._length && i1775705_bottom == i && a1775705_bottom == a && this1775705_bottom == this && tid1775705_bottom == tid;
  assume $recorded.state1775705_bottom == 1;                                                        
  assert phase1775705 == $pc;                                                                              // (19.5): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 16.19: // return;                                                                               
                                                                                                    
 assume Cow._state1775706 == Cow._state && Cow._lock1775706 == Cow._lock && Array.Cow.T._state1775706 == Array.Cow.T._state && Array.Cow.T._elems1775706 == Array.Cow.T._elems && Array.Cow.T._length1775706 == Array.Cow.T._length && Array.Cow.T2._state1775706 == Array.Cow.T2._state && Array.Cow.T2._elems1775706 == Array.Cow.T2._elems && Array.Cow.T2._length1775706 == Array.Cow.T2._length && i1775706 == i && a1775706 == a && this1775706 == this && tid1775706 == tid;
 assume $recorded.state1775706 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.h2(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
modifies Array.Cow.T2._state;                                                                       
modifies Array.Cow.T2._elems;                                                                       
                                                                                                    
requires ValidTid(tid);                                                                                    // (28.3): Bad tid
requires isShared(Cow._state[this]);                                                                       // (28.3): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
{                                                                                                   
 var Cow._state1775730: [Cow]State;                                                                 
 var path1775730: int;                                                                              
 var Array.Cow.T._state1775740: [Array.Cow.T]State;                                                 
 var Array.Cow.T2._length1775739: [Array.Cow.T2]int;                                                
 var i1775739_bottom: int;                                                                          
 var Array.Cow.T2._elems1775739: [Array.Cow.T2]([int]int);                                          
 var Array.Cow.T2._length1775739_bottom: [Array.Cow.T2]int;                                         
 var tid1775730: Tid;                                                                               
 var tid1775739_bottom: Tid;                                                                        
 var Array.Cow.T._length1775739_bottom: [Array.Cow.T]int;                                           
 var Array.Cow.T._state1775739: [Array.Cow.T]State;                                                 
 var Array.Cow.T._elems1775730: [Array.Cow.T]([int]int);                                            
 var Cow._lock1775740: [Cow]Tid;                                                                    
 var mover1775730: Mover;                                                                           
 var Array.Cow.T2._length1775730: [Array.Cow.T2]int;                                                
 var Cow._lock1775730: [Cow]Tid;                                                                    
 var Cow._state1775740: [Cow]State;                                                                 
 var $recorded.state1775740: int;                                                                   
 var $pc1775730: Phase;                                                                             
 var Cow._state1775739: [Cow]State;                                                                 
 var $pc1775740: Phase;                                                                             
 var i1775740: int;                                                                                 
 var i: int;                                                                                        
 var $recorded.state1775730: int;                                                                   
 var Array.Cow.T2._elems1775740: [Array.Cow.T2]([int]int);                                          
 var i1775730: int;                                                                                 
 var $pc1775739: Phase;                                                                             
 var tid1775740: Tid;                                                                               
 var Cow._lock1775739: [Cow]Tid;                                                                    
 var tid1775739: Tid;                                                                               
 var Array.Cow.T2._elems1775730: [Array.Cow.T2]([int]int);                                          
 var Cow._state1775739_bottom: [Cow]State;                                                          
 var a1775739: Array.Cow.T2;                                                                        
 var Array.Cow.T2._state1775739_bottom: [Array.Cow.T2]State;                                        
 var this1775730: Cow;                                                                              
 var this1775739: Cow;                                                                              
 var Array.Cow.T._length1775739: [Array.Cow.T]int;                                                  
 var Array.Cow.T._length1775730: [Array.Cow.T]int;                                                  
 var this1775739_bottom: Cow;                                                                       
 var this1775740: Cow;                                                                              
 var phase1775739: Phase;                                                                           
 var Array.Cow.T2._state1775730: [Array.Cow.T2]State;                                               
 var Array.Cow.T._state1775739_bottom: [Array.Cow.T]State;                                          
 var moverPath1775730: MoverPath;                                                                   
 var a1775730: Array.Cow.T2;                                                                        
 var i1775739: int;                                                                                 
 var $recorded.state1775739_bottom: int;                                                            
 var Array.Cow.T._elems1775740: [Array.Cow.T]([int]int);                                            
 var a1775740: Array.Cow.T2;                                                                        
 var Array.Cow.T2._state1775739: [Array.Cow.T2]State;                                               
 var Array.Cow.T._elems1775739_bottom: [Array.Cow.T]([int]int);                                     
 var Array.Cow.T._length1775740: [Array.Cow.T]int;                                                  
 var $recorded.state1775739: int;                                                                   
 var a: Array.Cow.T2;                                                                               
 var a1775739_bottom: Array.Cow.T2;                                                                 
 var Array.Cow.T2._elems1775739_bottom: [Array.Cow.T2]([int]int);                                   
 var Cow._lock1775739_bottom: [Cow]Tid;                                                             
 var Array.Cow.T._state1775730: [Array.Cow.T]State;                                                 
 var $pc1775739_bottom: Phase;                                                                      
 var Array.Cow.T2._state1775740: [Array.Cow.T2]State;                                               
 var Array.Cow.T._elems1775739: [Array.Cow.T]([int]int);                                            
 var Array.Cow.T2._length1775740: [Array.Cow.T2]int;                                                
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 29.5: [Cow.T2{this}] a;                                                                         
                                                                                                    
                                                                                                    
 // 29.5: a = new [Cow.T2{this}](10);                                                               
                                                                                                    
 havoc a;                                                                                           
 assume isFresh(Array.Cow.T2._state[a]);                                                            
 assume Array.Cow.T2._length[a] == 10;                                                              
 assume Array.Cow.T2._this[a] == this;                                                              
 Array.Cow.T2._state[a] := LOCAL(tid);                                                              
 assume (forall _i : int :: 0 <= _i ==> Array.Cow.T2._elems[a][_i] == 0);                           
                                                                                                    
 // 30.5: int i;                                                                                    
                                                                                                    
                                                                                                    
 // 30.13: i = 0;                                                                                   
                                                                                                    
 i := 0;                                                                                            
 assume Cow._state1775739 == Cow._state && Cow._lock1775739 == Cow._lock && Array.Cow.T._state1775739 == Array.Cow.T._state && Array.Cow.T._elems1775739 == Array.Cow.T._elems && Array.Cow.T._length1775739 == Array.Cow.T._length && Array.Cow.T2._state1775739 == Array.Cow.T2._state && Array.Cow.T2._elems1775739 == Array.Cow.T2._elems && Array.Cow.T2._length1775739 == Array.Cow.T2._length && i1775739 == i && a1775739 == a && this1775739 == this && tid1775739 == tid;
 assume $recorded.state1775739 == 1;                                                                
                                                                                                    
 // 31.5: while (i < 10)                                                                            
                                                                                                    
 phase1775739 := $pc;                                                                               
 while ((i<10))                                                                                     
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (28.3): Bad tid
  invariant isShared(Cow._state[this]);                                                                    // (28.3): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
  invariant (forall j: int ::  ((((0<=j)&&(j<i))==>(Array.Cow.T2._elems[a][j]==j))));               
  invariant (forall _athis : Array.Cow.T, _index : int :: Invariant.Y_Array.Cow.T(tid : Tid, _athis, _index, Array.Cow.T._elems[_athis][_index] ,Cow._state1775739,Cow._lock1775739,Array.Cow.T._state1775739,Array.Cow.T._elems1775739,Array.Cow.T._length1775739,Array.Cow.T2._state1775739,Array.Cow.T2._elems1775739,Array.Cow.T2._length1775739));       // (31.5): Loop does not preserve yields_as annotation for field ArrayDecl(T,IntType(),index,Spec(Cond(IsLocal(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List()))
  invariant (forall _athis : Array.Cow.T2, _index : int :: Invariant.Y_Array.Cow.T2(tid : Tid, _athis, _index, Array.Cow.T2._elems[_athis][_index] ,Cow._state1775739,Cow._lock1775739,Array.Cow.T._state1775739,Array.Cow.T._elems1775739,Array.Cow.T._length1775739,Array.Cow.T2._state1775739,Array.Cow.T2._elems1775739,Array.Cow.T2._length1775739));       // (31.5): Loop does not preserve yields_as annotation for field ArrayDecl(T2,IntType(),index,Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List()))
  invariant phase1775739 == $pc;                                                                           // (31.5): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (31.5): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 35.7: a[i] := i;                                                                               
                                                                                                    
                                                                                                    
  moverPath1775730 := WriteEval.Array.Cow.T2(tid: Tid,this: Cow,a: Array.Cow.T2,i: int,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
  mover1775730 := m#moverPath(moverPath1775730);                                                    
  path1775730 := p#moverPath(moverPath1775730);                                                     
  assume Cow._state1775730 == Cow._state && Cow._lock1775730 == Cow._lock && Array.Cow.T._state1775730 == Array.Cow.T._state && Array.Cow.T._elems1775730 == Array.Cow.T._elems && Array.Cow.T._length1775730 == Array.Cow.T._length && Array.Cow.T2._state1775730 == Array.Cow.T2._state && Array.Cow.T2._elems1775730 == Array.Cow.T2._elems && Array.Cow.T2._length1775730 == Array.Cow.T2._length && i1775730 == i && a1775730 == a && this1775730 == this && tid1775730 == tid && $pc1775730 == $pc;
  assume $recorded.state1775730 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume a != Array.Cow.T2.null;                                                                   
  } else {                                                                                          
   assert a != Array.Cow.T2.null;                                                                          // (35.7): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume 0 <= i;                                                                                   
  } else {                                                                                          
   assert 0 <= i;                                                                                          // (35.7): index < 0.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume i < Array.Cow.T2._length[a];                                                              
  } else {                                                                                          
   assert i < Array.Cow.T2._length[a];                                                                     // (35.7): index is >= length.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1775730);                                                             
  assert $pc != PhaseError;                                                                                // (35.7): Reduction failure
  Array.Cow.T2._elems[a][i] := i;                                                                   
                                                                                                    
  // 36.13: i = i + 1;                                                                              
                                                                                                    
  i := (i+1);                                                                                       
  assume Cow._state1775739_bottom == Cow._state && Cow._lock1775739_bottom == Cow._lock && Array.Cow.T._state1775739_bottom == Array.Cow.T._state && Array.Cow.T._elems1775739_bottom == Array.Cow.T._elems && Array.Cow.T._length1775739_bottom == Array.Cow.T._length && Array.Cow.T2._state1775739_bottom == Array.Cow.T2._state && Array.Cow.T2._elems1775739_bottom == Array.Cow.T2._elems && Array.Cow.T2._length1775739_bottom == Array.Cow.T2._length && i1775739_bottom == i && a1775739_bottom == a && this1775739_bottom == this && tid1775739_bottom == tid;
  assume $recorded.state1775739_bottom == 1;                                                        
  assert phase1775739 == $pc;                                                                              // (31.5): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 28.20: // return;                                                                               
                                                                                                    
 assume Cow._state1775740 == Cow._state && Cow._lock1775740 == Cow._lock && Array.Cow.T._state1775740 == Array.Cow.T._state && Array.Cow.T._elems1775740 == Array.Cow.T._elems && Array.Cow.T._length1775740 == Array.Cow.T._length && Array.Cow.T2._state1775740 == Array.Cow.T2._state && Array.Cow.T2._elems1775740 == Array.Cow.T2._elems && Array.Cow.T2._length1775740 == Array.Cow.T2._length && i1775740 == i && a1775740 == a && this1775740 == this && tid1775740 == tid;
 assume $recorded.state1775740 == 1;                                                                
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.Cow.T: Spec(Cond(IsLocal(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.Cow.T(tid: Tid,this : Cow,athis : Array.Cow.T,index : int,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int,Array.Cow.T2._state: [Array.Cow.T2]State,Array.Cow.T2._elems: [Array.Cow.T2]([int]int),Array.Cow.T2._length: [Array.Cow.T2]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 if (isLocal(Cow._state[this], tid)) then                                                           
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.Cow.T: Spec(Cond(IsLocal(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.Cow.T(tid: Tid,this : Cow,athis : Array.Cow.T,index : int,newValue: int,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int,Array.Cow.T2._state: [Array.Cow.T2]State,Array.Cow.T2._elems: [Array.Cow.T2]([int]int),Array.Cow.T2._length: [Array.Cow.T2]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Cow._state[this], tid)) then                                                           
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
/*** Array Array.Cow.T2 ***/                                                                        
                                                                                                    
type Array.Cow.T2;                                                                                  
const unique Array.Cow.T2.null: Array.Cow.T2;                                                       
var Array.Cow.T2._state: [Array.Cow.T2]State;                                                       
                                                                                                    
const Array.Cow.T2._this : [Array.Cow.T2]Cow;                                                       
const Array.Cow.T2._length : [Array.Cow.T2]int;                                                     
var Array.Cow.T2._elems  : [Array.Cow.T2]([int]int);                                                
                                                                                                    
axiom (forall $this : Array.Cow.T2 :: Array.Cow.T2._length[$this] >= 0);                            
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.Cow.T2: Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.Cow.T2(tid: Tid,this : Cow,athis : Array.Cow.T2,index : int,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int,Array.Cow.T2._state: [Array.Cow.T2]State,Array.Cow.T2._elems: [Array.Cow.T2]([int]int),Array.Cow.T2._length: [Array.Cow.T2]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 if (isLocal(Array.Cow.T2._state[athis], tid)) then                                                 
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.Cow.T2: Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.Cow.T2(tid: Tid,this : Cow,athis : Array.Cow.T2,index : int,newValue: int,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int,Array.Cow.T2._state: [Array.Cow.T2]State,Array.Cow.T2._elems: [Array.Cow.T2]([int]int),Array.Cow.T2._length: [Array.Cow.T2]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Array.Cow.T2._state[athis], tid)) then                                                 
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int,Array.Cow.T2._state: [Array.Cow.T2]State,Array.Cow.T2._elems: [Array.Cow.T2]([int]int),Array.Cow.T2._length: [Array.Cow.T2]int) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Array.Cow.T  :: _i == Array.Cow.T.null <==> isNull(Array.Cow.T._state[_i])) &&        
  (forall _i: Array.Cow.T2  :: _i == Array.Cow.T2.null <==> isNull(Array.Cow.T2._state[_i])) &&     
  (forall _t: Tid, _i: Array.Cow.T  :: ValidTid(_t) && isAccessible(Array.Cow.T._state[_i], _t) ==> isAccessible(Cow._state[Array.Cow.T._this[_i]], _t)) &&
  (forall _t: Tid, _i: Array.Cow.T2  :: ValidTid(_t) && isAccessible(Array.Cow.T2._state[_i], _t) ==> isAccessible(Cow._state[Array.Cow.T2._this[_i]], _t)) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.3): Array Array.Cow.T failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.3): Array Array.Cow.T failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := havocValue;                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.3): Array Array.Cow.T failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.3): Array Array.Cow.T failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.3): Array Array.Cow.T failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.Cow.T._elems[x][i] := havocValue;                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.3): Array Array.Cow.T failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T2, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T2._state[x], u);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.T2._elems[x][i] := v;                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.T2(u: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): Array Array.Cow.T2 failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T2, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T2._state[x], u);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.T2._elems[x][i] := v;                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.Cow.T2(u: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.3): Array Array.Cow.T2 failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T2, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T2._state[x], u);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume w == Array.Cow.T2._elems[x][i];                                                             
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.Cow.T2._elems[x][i] := havocValue;                                                           
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.T2(u: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): Array Array.Cow.T2 failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T2, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T2._state[x], u);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume w == Array.Cow.T2._elems[x][i];                                                             
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.Cow.T2(u: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.3): Array Array.Cow.T2 failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T2, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T2._state[x], u);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.Cow.T2(u: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): Array Array.Cow.T2 failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T2, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T2._state[x], u);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
 assume w == Array.Cow.T2._elems[x][i];                                                             
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.Cow.T2._elems[x][i] := havocValue;                                                           
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.Cow.T2(u: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): Array Array.Cow.T2 failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.Cow.T2._length_mid: [Array.Cow.T2]int;                                                   
 var w_mid: int;                                                                                    
 var Array.Cow.T2._elems_mid: [Array.Cow.T2]([int]int);                                             
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._state_mid: [Array.Cow.T2]State;                                                  
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
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && Array.Cow.T2._state_mid == Array.Cow.T2._state && Array.Cow.T2._elems_mid == Array.Cow.T2._elems && Array.Cow.T2._length_mid == Array.Cow.T2._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.Cow.T2._length_mid: [Array.Cow.T2]int;                                                   
 var w_mid: int;                                                                                    
 var Array.Cow.T2._elems_mid: [Array.Cow.T2]([int]int);                                             
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._state_mid: [Array.Cow.T2]State;                                                  
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
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && Array.Cow.T2._state_mid == Array.Cow.T2._state && Array.Cow.T2._elems_mid == Array.Cow.T2._elems && Array.Cow.T2._length_mid == Array.Cow.T2._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[y][j] := w;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.3): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.T._elems.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T2, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T2._state[y], u);                                                  
 requires Array.Cow.T2._this[y] == y_owner;                                                         
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var y_pre: Array.Cow.T2;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var y_post: Array.Cow.T2;                                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.T._elems.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T2, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T2._state[y], u);                                                  
 requires Array.Cow.T2._this[y] == y_owner;                                                         
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var y_pre: Array.Cow.T2;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.Cow.T2._length_mid: [Array.Cow.T2]int;                                                   
 var w_mid: int;                                                                                    
 var Array.Cow.T2._elems_mid: [Array.Cow.T2]([int]int);                                             
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._state_mid: [Array.Cow.T2]State;                                                  
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var y_mid: Array.Cow.T2;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var y_post: Array.Cow.T2;                                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && Array.Cow.T2._state_mid == Array.Cow.T2._state && Array.Cow.T2._elems_mid == Array.Cow.T2._elems && Array.Cow.T2._length_mid == Array.Cow.T2._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.T2._elems[y][j] := w;                                                                    
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T2 (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.T._elems.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T2, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T2._state[y], u);                                                  
 requires Array.Cow.T2._this[y] == y_owner;                                                         
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var y_pre: Array.Cow.T2;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.Cow.T2._length_mid: [Array.Cow.T2]int;                                                   
 var w_mid: int;                                                                                    
 var Array.Cow.T2._elems_mid: [Array.Cow.T2]([int]int);                                             
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._state_mid: [Array.Cow.T2]State;                                                  
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var y_mid: Array.Cow.T2;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var y_post: Array.Cow.T2;                                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && Array.Cow.T2._state_mid == Array.Cow.T2._state && Array.Cow.T2._elems_mid == Array.Cow.T2._elems && Array.Cow.T2._length_mid == Array.Cow.T2._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.T2._elems[y][j] := w;                                                                    
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T2 (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T2 (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.T._elems.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T2, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T2._state[y], u);                                                  
 requires Array.Cow.T2._this[y] == y_owner;                                                         
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var y_pre: Array.Cow.T2;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var y_post: Array.Cow.T2;                                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T2._elems[y][j] := w;                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T2 (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T2 (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T2 (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.T._elems.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T2, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T2._state[y], u);                                                  
 requires Array.Cow.T2._this[y] == y_owner;                                                         
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var y_pre: Array.Cow.T2;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var y_post: Array.Cow.T2;                                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Read Stable with respect to Array Array.Cow.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Read Stable with respect to Array Array.Cow.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): Array Array.Cow.T2 is not Write-Read Stable with respect to Array Array.Cow.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.T2._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T2, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T2._elems;                                                                      
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T2._elems[x][i] := v;                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T2 (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T2 (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T2 (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.T2._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T2, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T2._elems;                                                                      
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.Cow.T2._length_mid: [Array.Cow.T2]int;                                                   
 var w_mid: int;                                                                                    
 var Array.Cow.T2._elems_mid: [Array.Cow.T2]([int]int);                                             
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._state_mid: [Array.Cow.T2]State;                                                  
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var x_mid: Array.Cow.T2;                                                                           
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.T2._elems[x][i];                                                                 
 Array.Cow.T2._elems[x][i] := v;                                                                    
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && Array.Cow.T2._state_mid == Array.Cow.T2._state && Array.Cow.T2._elems_mid == Array.Cow.T2._elems && Array.Cow.T2._length_mid == Array.Cow.T2._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.T2._elems[x][i] := tmpV;                                                                 
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.T2._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T2, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T2._elems;                                                                      
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.Cow.T2._length_mid: [Array.Cow.T2]int;                                                   
 var w_mid: int;                                                                                    
 var Array.Cow.T2._elems_mid: [Array.Cow.T2]([int]int);                                             
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._state_mid: [Array.Cow.T2]State;                                                  
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var x_mid: Array.Cow.T2;                                                                           
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.T2._elems[x][i];                                                                 
 Array.Cow.T2._elems[x][i] := v;                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && Array.Cow.T2._state_mid == Array.Cow.T2._state && Array.Cow.T2._elems_mid == Array.Cow.T2._elems && Array.Cow.T2._length_mid == Array.Cow.T2._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.T2._elems[x][i] := tmpV;                                                                 
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.T2._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T2, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T2._elems;                                                                      
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[y][j] := w;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Read-Write Stable with respect to Array Array.Cow.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Read-Write Stable with respect to Array Array.Cow.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Read-Write Stable with respect to Array Array.Cow.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.T2._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T2, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T2._elems;                                                                      
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
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T2._elems[x][i] := v;                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T2 (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.3): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T2 (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.3): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T2 (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.T2._elems.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T2, i: int, y_owner: Cow, y: Array.Cow.T2, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T2._state[y], u);                                                  
 requires Array.Cow.T2._this[y] == y_owner;                                                         
 modifies Array.Cow.T2._elems;                                                                      
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var y_pre: Array.Cow.T2;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var y_post: Array.Cow.T2;                                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T2._elems[x][i] := v;                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T2 (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T2 (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T2 (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.T2._elems.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T2, i: int, y_owner: Cow, y: Array.Cow.T2, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T2._state[y], u);                                                  
 requires Array.Cow.T2._this[y] == y_owner;                                                         
 modifies Array.Cow.T2._elems;                                                                      
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var y_pre: Array.Cow.T2;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.Cow.T2._length_mid: [Array.Cow.T2]int;                                                   
 var w_mid: int;                                                                                    
 var Array.Cow.T2._elems_mid: [Array.Cow.T2]([int]int);                                             
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._state_mid: [Array.Cow.T2]State;                                                  
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var x_mid: Array.Cow.T2;                                                                           
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var y_mid: Array.Cow.T2;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var y_post: Array.Cow.T2;                                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.T2._elems[x][i];                                                                 
 Array.Cow.T2._elems[x][i] := v;                                                                    
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && Array.Cow.T2._state_mid == Array.Cow.T2._state && Array.Cow.T2._elems_mid == Array.Cow.T2._elems && Array.Cow.T2._length_mid == Array.Cow.T2._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.T2._elems[x][i] := tmpV;                                                                 
 Array.Cow.T2._elems[y][j] := w;                                                                    
 _writeByTPost := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T2 (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.T2._elems.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T2, i: int, y_owner: Cow, y: Array.Cow.T2, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T2._state[y], u);                                                  
 requires Array.Cow.T2._this[y] == y_owner;                                                         
 modifies Array.Cow.T2._elems;                                                                      
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var y_pre: Array.Cow.T2;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.Cow.T2._length_mid: [Array.Cow.T2]int;                                                   
 var w_mid: int;                                                                                    
 var Array.Cow.T2._elems_mid: [Array.Cow.T2]([int]int);                                             
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._state_mid: [Array.Cow.T2]State;                                                  
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var x_mid: Array.Cow.T2;                                                                           
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var y_mid: Array.Cow.T2;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var y_post: Array.Cow.T2;                                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.T2._elems[x][i];                                                                 
 Array.Cow.T2._elems[x][i] := v;                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && Array.Cow.T2._state_mid == Array.Cow.T2._state && Array.Cow.T2._elems_mid == Array.Cow.T2._elems && Array.Cow.T2._length_mid == Array.Cow.T2._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.T2._elems[x][i] := tmpV;                                                                 
 Array.Cow.T2._elems[y][j] := w;                                                                    
 _writeByTPost := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T2 (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T2 (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.T2._elems.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T2, i: int, y_owner: Cow, y: Array.Cow.T2, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T2._state[y], u);                                                  
 requires Array.Cow.T2._this[y] == y_owner;                                                         
 modifies Array.Cow.T2._elems;                                                                      
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var y_pre: Array.Cow.T2;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var y_post: Array.Cow.T2;                                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,w: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T2._elems[y][j] := w;                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Read-Write Stable with respect to Array Array.Cow.T2 (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Read-Write Stable with respect to Array Array.Cow.T2 (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Read-Write Stable with respect to Array Array.Cow.T2 (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.T2._elems.Array.Cow.T2._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T2, i: int, y_owner: Cow, y: Array.Cow.T2, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T2._state[x], t);                                                  
 requires Array.Cow.T2._this[x] == x_owner;                                                         
 requires isAccessible(Array.Cow.T2._state[y], u);                                                  
 requires Array.Cow.T2._this[y] == y_owner;                                                         
 modifies Array.Cow.T2._elems;                                                                      
 modifies Array.Cow.T2._elems;                                                                      
                                                                                                    
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
 var y_pre: Array.Cow.T2;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                  
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Array.Cow.T2;                                                                           
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                   
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                 
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var y_post: Array.Cow.T2;                                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                  
 var x_owner_post: Cow;                                                                             
 var x_post: Array.Cow.T2;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                            
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.T2(t: Tid,x_owner: Cow,x: Array.Cow.T2,i: int,v: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T2._elems[x][i] := v;                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && Array.Cow.T2._state_post == Array.Cow.T2._state && Array.Cow.T2._elems_post == Array.Cow.T2._elems && Array.Cow.T2._length_post == Array.Cow.T2._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.T2(u: Tid,y_owner: Cow,y: Array.Cow.T2,j: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Read Stable with respect to Array Array.Cow.T2 (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Array Array.Cow.T2 is not Write-Read Stable with respect to Array Array.Cow.T2 (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): Array Array.Cow.T2 is not Write-Read Stable with respect to Array Array.Cow.T2 (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
requires ValidTid(tid);                                                                             
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
modifies Array.Cow.T2._state;                                                                       
modifies Array.Cow.T2._elems;                                                                       
ensures StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
ensures Y(tid , old(Cow._state), old(Cow._lock), old(Array.Cow.T._state), old(Array.Cow.T._elems), old(Array.Cow.T._length), old(Array.Cow.T2._state), old(Array.Cow.T2._elems), old(Array.Cow.T2._length) , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
                                                                                                    
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Array.Cow.T2._length_yield: [Array.Cow.T2]int;                                                  
var newValue_yield: Tid;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T2._state_yield: [Array.Cow.T2]State;                                                 
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var Array.Cow.T2._elems_yield: [Array.Cow.T2]([int]int);                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length)), _N);
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && Array.Cow.T2._state_yield == Array.Cow.T2._state && Array.Cow.T2._elems_yield == Array.Cow.T2._elems && Array.Cow.T2._length_yield == Array.Cow.T2._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Array.Cow.T2._length_yield: [Array.Cow.T2]int;                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T2._state_yield: [Array.Cow.T2]State;                                                 
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var Array.Cow.T2._elems_yield: [Array.Cow.T2]([int]int);                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && Array.Cow.T2._state_yield == Array.Cow.T2._state && Array.Cow.T2._elems_yield == Array.Cow.T2._elems && Array.Cow.T2._length_yield == Array.Cow.T2._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]int), Array.Cow.T._length_p: [Array.Cow.T]int, Array.Cow.T2._state_p: [Array.Cow.T2]State, Array.Cow.T2._elems_p: [Array.Cow.T2]([int]int), Array.Cow.T2._length_p: [Array.Cow.T2]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires StateInvariant(Cow._state_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p, Array.Cow.T2._state_p, Array.Cow.T2._elems_p, Array.Cow.T2._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                                
var Cow._lock_pre: [Cow]Tid;                                                                        
var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                   
var $recorded.state_pre: int;                                                                       
var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                              
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                      
var newValue_pre: Tid;                                                                              
var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                    
var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                     
                                                                                                    
var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                  
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                   
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var newValue_post: Tid;                                                                             
var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                             
var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                               
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length , Cow._state_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p, Array.Cow.T2._state_p, Array.Cow.T2._elems_p, Array.Cow.T2._length_p);
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p, Array.Cow.T2._state_p, Array.Cow.T2._elems_p, Array.Cow.T2._length_p);
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && Array.Cow.T2._state_post == Array.Cow.T2._state_p && Array.Cow.T2._elems_post == Array.Cow.T2._elems_p && Array.Cow.T2._length_post == Array.Cow.T2._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
}                                                                                                   
// Array.Cow.T:                                                                                     
                                                                                                    
function {:inline} Y_Array.Cow.T(tid : Tid, athis: Array.Cow.T, index: int, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int): bool
{                                                                                                   
(var this := Array.Cow.T._this[athis];                                                              
 ((isAccessible(Array.Cow.T._state[athis], tid) && leq(m#moverPath(ReadEval.Array.Cow.T(tid: Tid,Array.Cow.T._this[athis]: Cow,athis: Array.Cow.T,index: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length)), _R)) ==> (Array.Cow.T._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.Cow.T(tid : Tid, athis: Array.Cow.T, index: int, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int): bool
{                                                                                                   
(var this := Array.Cow.T._this[athis];                                                              
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Subsumes.W(tid : Tid, u : Tid, this: Cow, athis: Array.Cow.T, index: int, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.Cow.T._this[athis];                                                         
{                                                                                                   
var Array.Cow.T2._length_yield: [Array.Cow.T2]int;                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T2._state_yield: [Array.Cow.T2]State;                                                 
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var index_yield: int;                                                                               
var Array.Cow.T2._elems_yield: [Array.Cow.T2]([int]int);                                            
var athis_yield: Array.Cow.T;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Cow.T._state[athis], u);                                                 
 assume !isError(m#moverPath(WriteEval.Array.Cow.T(u: Tid,Array.Cow.T._this[athis]: Cow,athis: Array.Cow.T,index: int,newValue: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && Array.Cow.T2._state_yield == Array.Cow.T2._state && Array.Cow.T2._elems_yield == Array.Cow.T2._elems && Array.Cow.T2._length_yield == Array.Cow.T2._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.T(tid, athis, index, newValue , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Reflexive(tid : Tid, this: Cow, athis: Array.Cow.T, index: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(tid);                                                                            
 requires this == Array.Cow.T._this[athis];                                                         
{                                                                                                   
var Array.Cow.T2._length_yield: [Array.Cow.T2]int;                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T2._state_yield: [Array.Cow.T2]State;                                                 
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var index_yield: int;                                                                               
var Array.Cow.T2._elems_yield: [Array.Cow.T2]([int]int);                                            
var athis_yield: Array.Cow.T;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Cow.T._state[athis], tid);                                               
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && Array.Cow.T2._state_yield == Array.Cow.T2._state && Array.Cow.T2._elems_yield == Array.Cow.T2._elems && Array.Cow.T2._length_yield == Array.Cow.T2._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.T(tid, athis, index, Array.Cow.T._elems[athis][index] , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Transitive(tid : Tid, this: Cow, athis: Array.Cow.T, index: int, newValue : int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]int), Array.Cow.T._length_p: [Array.Cow.T]int, Array.Cow.T2._state_p: [Array.Cow.T2]State, Array.Cow.T2._elems_p: [Array.Cow.T2]([int]int), Array.Cow.T2._length_p: [Array.Cow.T2]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires StateInvariant(Cow._state_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p, Array.Cow.T2._state_p, Array.Cow.T2._elems_p, Array.Cow.T2._length_p);
                                                                                                    
 requires this == Array.Cow.T._this[athis];                                                         
 requires ValidTid(tid);                                                                            
{                                                                                                   
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                                
var athis_pre: Array.Cow.T;                                                                         
var Cow._lock_pre: [Cow]Tid;                                                                        
var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                   
var $recorded.state_pre: int;                                                                       
var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                              
var index_pre: int;                                                                                 
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                      
var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                    
var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                     
                                                                                                    
var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                  
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var athis_post: Array.Cow.T;                                                                        
var tid_post: Tid;                                                                                  
var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                   
var Cow._lock_post: [Cow]Tid;                                                                       
var index_post: int;                                                                                
var this_post: Cow;                                                                                 
var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                             
var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                               
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && Array.Cow.T2._state_post == Array.Cow.T2._state_p && Array.Cow.T2._elems_post == Array.Cow.T2._elems_p && Array.Cow.T2._length_post == Array.Cow.T2._length_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.Cow.T._state[athis], tid);                                               
 assume Y(tid , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length , Cow._state_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p, Array.Cow.T2._state_p, Array.Cow.T2._elems_p, Array.Cow.T2._length_p);
 assume Y_Array.Cow.T(tid, athis, index, newValue , Cow._state_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p, Array.Cow.T2._state_p, Array.Cow.T2._elems_p, Array.Cow.T2._length_p);
 assert Y_Array.Cow.T(tid, athis, index, newValue , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
}                                                                                                   
// Array.Cow.T2:                                                                                    
                                                                                                    
function {:inline} Y_Array.Cow.T2(tid : Tid, athis: Array.Cow.T2, index: int, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int): bool
{                                                                                                   
(var this := Array.Cow.T2._this[athis];                                                             
 ((isAccessible(Array.Cow.T2._state[athis], tid) && leq(m#moverPath(ReadEval.Array.Cow.T2(tid: Tid,Array.Cow.T2._this[athis]: Cow,athis: Array.Cow.T2,index: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length)), _R)) ==> (Array.Cow.T2._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.Cow.T2(tid : Tid, athis: Array.Cow.T2, index: int, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int): bool
{                                                                                                   
(var this := Array.Cow.T2._this[athis];                                                             
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T2.Subsumes.W(tid : Tid, u : Tid, this: Cow, athis: Array.Cow.T2, index: int, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.Cow.T2._this[athis];                                                        
{                                                                                                   
var athis_yield: Array.Cow.T2;                                                                      
var Array.Cow.T2._length_yield: [Array.Cow.T2]int;                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T2._state_yield: [Array.Cow.T2]State;                                                 
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var index_yield: int;                                                                               
var Array.Cow.T2._elems_yield: [Array.Cow.T2]([int]int);                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Cow.T2._state[athis], u);                                                
 assume !isError(m#moverPath(WriteEval.Array.Cow.T2(u: Tid,Array.Cow.T2._this[athis]: Cow,athis: Array.Cow.T2,index: int,newValue: int,Cow._state,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length,Array.Cow.T2._state,Array.Cow.T2._elems,Array.Cow.T2._length)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && Array.Cow.T2._state_yield == Array.Cow.T2._state && Array.Cow.T2._elems_yield == Array.Cow.T2._elems && Array.Cow.T2._length_yield == Array.Cow.T2._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.T2(tid, athis, index, newValue , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T2.Reflexive(tid : Tid, this: Cow, athis: Array.Cow.T2, index: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires ValidTid(tid);                                                                            
 requires this == Array.Cow.T2._this[athis];                                                        
{                                                                                                   
var athis_yield: Array.Cow.T2;                                                                      
var Array.Cow.T2._length_yield: [Array.Cow.T2]int;                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T2._state_yield: [Array.Cow.T2]State;                                                 
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var index_yield: int;                                                                               
var Array.Cow.T2._elems_yield: [Array.Cow.T2]([int]int);                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Cow.T2._state[athis], tid);                                              
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && Array.Cow.T2._state_yield == Array.Cow.T2._state && Array.Cow.T2._elems_yield == Array.Cow.T2._elems && Array.Cow.T2._length_yield == Array.Cow.T2._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.T2(tid, athis, index, Array.Cow.T2._elems[athis][index] , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T2.Transitive(tid : Tid, this: Cow, athis: Array.Cow.T2, index: int, newValue : int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]int), Array.Cow.T._length_p: [Array.Cow.T]int, Array.Cow.T2._state_p: [Array.Cow.T2]State, Array.Cow.T2._elems_p: [Array.Cow.T2]([int]int), Array.Cow.T2._length_p: [Array.Cow.T2]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
 requires StateInvariant(Cow._state_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p, Array.Cow.T2._state_p, Array.Cow.T2._elems_p, Array.Cow.T2._length_p);
                                                                                                    
 requires this == Array.Cow.T2._this[athis];                                                        
 requires ValidTid(tid);                                                                            
{                                                                                                   
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                                
var Cow._lock_pre: [Cow]Tid;                                                                        
var Array.Cow.T2._state_pre: [Array.Cow.T2]State;                                                   
var $recorded.state_pre: int;                                                                       
var Array.Cow.T2._elems_pre: [Array.Cow.T2]([int]int);                                              
var index_pre: int;                                                                                 
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                      
var Array.Cow.T2._length_pre: [Array.Cow.T2]int;                                                    
var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                     
var athis_pre: Array.Cow.T2;                                                                        
                                                                                                    
var Array.Cow.T2._state_post: [Array.Cow.T2]State;                                                  
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var athis_post: Array.Cow.T2;                                                                       
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Array.Cow.T2._length_post: [Array.Cow.T2]int;                                                   
var Cow._lock_post: [Cow]Tid;                                                                       
var index_post: int;                                                                                
var this_post: Cow;                                                                                 
var Array.Cow.T2._elems_post: [Array.Cow.T2]([int]int);                                             
var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                               
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && Array.Cow.T2._state_pre == Array.Cow.T2._state && Array.Cow.T2._elems_pre == Array.Cow.T2._elems && Array.Cow.T2._length_pre == Array.Cow.T2._length && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && Array.Cow.T2._state_post == Array.Cow.T2._state_p && Array.Cow.T2._elems_post == Array.Cow.T2._elems_p && Array.Cow.T2._length_post == Array.Cow.T2._length_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.Cow.T2._state[athis], tid);                                              
 assume Y(tid , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length , Cow._state_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p, Array.Cow.T2._state_p, Array.Cow.T2._elems_p, Array.Cow.T2._length_p);
 assume Y_Array.Cow.T2(tid, athis, index, newValue , Cow._state_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p, Array.Cow.T2._state_p, Array.Cow.T2._elems_p, Array.Cow.T2._length_p);
 assert Y_Array.Cow.T2(tid, athis, index, newValue , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int, Array.Cow.T2._state: [Array.Cow.T2]State, Array.Cow.T2._elems: [Array.Cow.T2]([int]int), Array.Cow.T2._length: [Array.Cow.T2]int , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]int), Array.Cow.T._length_p: [Array.Cow.T]int, Array.Cow.T2._state_p: [Array.Cow.T2]State, Array.Cow.T2._elems_p: [Array.Cow.T2]([int]int), Array.Cow.T2._length_p: [Array.Cow.T2]int): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length))
 && (forall athis: Array.Cow.T, index: int :: Y_Array.Cow.T(tid : Tid, athis, index, Array.Cow.T._elems_p[athis][index] , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length))
 && (forall athis: Array.Cow.T2, index: int :: Y_Array.Cow.T2(tid : Tid, athis, index, Array.Cow.T2._elems_p[athis][index] , Cow._state, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length, Array.Cow.T2._state, Array.Cow.T2._elems, Array.Cow.T2._length))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
 && (forall _i : Array.Cow.T :: isShared(Array.Cow.T._state[_i]) ==> isShared(Array.Cow.T._state_p[_i]))
 && (forall _i : Array.Cow.T :: Array.Cow.T._length[_i] == Array.Cow.T._length_p[_i])               
 && (forall _i : Array.Cow.T :: isLocal(Array.Cow.T._state[_i], tid) <==> isLocal(Array.Cow.T._state_p[_i], tid))
 && (forall _i : Array.Cow.T2 :: isShared(Array.Cow.T2._state[_i]) ==> isShared(Array.Cow.T2._state_p[_i]))
 && (forall _i : Array.Cow.T2 :: Array.Cow.T2._length[_i] == Array.Cow.T2._length_p[_i])            
 && (forall _i : Array.Cow.T2 :: isLocal(Array.Cow.T2._state[_i], tid) <==> isLocal(Array.Cow.T2._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 564.1-627.2: (Method:6.3)
// 574.1-574.24: (6.3): Bad tid
// 575.1-575.37: (6.3): this is not global
// 613.1-613.14: (6.14): Can only have right-mover memory accesses in requires clause
// 615.2-620.19: (class anchor.sink.Assert:8.5)
// 620.1-620.19: (8.5): This assertion may not hold.
// 621.2-626.9: (class anchor.sink.Return:7.24)
// 628.1-691.2: (Method:11.3)
// 638.1-638.24: (11.3): Bad tid
// 639.1-639.37: (11.3): this is not global
// 677.1-677.14: (11.14): Can only have right-mover memory accesses in requires clause
// 679.2-684.16: (class anchor.sink.Assert:13.5)
// 684.1-684.16: (13.5): This assertion may not hold.
// 685.2-690.9: (class anchor.sink.Return:12.24)
// 692.1-855.2: (Method:16.3)
// 702.1-702.24: (16.3): Bad tid
// 703.1-703.37: (16.3): this is not global
// 776.2-778.2: (class anchor.sink.VarDeclStmt:17.5)
// 779.2-787.73: (class anchor.sink.AAlloc:17.5)
// 788.2-790.2: (class anchor.sink.VarDeclStmt:18.5)
// 791.2-794.9: (class anchor.sink.Assign:18.13)
// 797.2-801.16: (class anchor.sink.While:19.5)
// 803.1-803.27: (16.3): Bad tid
// 804.1-804.40: (16.3): this is not global
// 806.176-807.49: (19.5): invariant isLocal(a, tid) may not hold
// 808.1-808.344: (19.5): Loop does not preserve yields_as annotation for field ArrayDecl(T,IntType(),index,Spec(Cond(IsLocal(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List()))
// 809.1-809.347: (19.5): Loop does not preserve yields_as annotation for field ArrayDecl(T2,IntType(),index,Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List()))
// 810.1-810.33: (19.5): Phase must be invariant at loop head
// 811.1-811.30: (19.5): Potentially infinite loop cannot be in post-commit phase.
// 813.3-840.33: (class anchor.sink.AWrite:23.7)
// 825.1-825.33: (23.7): Cannot have potential null deference in left-mover part.
// 830.1-830.18: (23.7): index < 0.
// 835.1-835.38: (23.7): index is >= length.
// 839.1-839.28: (23.7): Reduction failure
// 841.3-844.14: (class anchor.sink.Assign:24.13)
// 847.1-847.30: (19.5): Phase must be invariant at loop head
// 849.2-854.9: (class anchor.sink.Return:16.19)
// 856.1-1019.2: (Method:28.3)
// 866.1-866.24: (28.3): Bad tid
// 867.1-867.37: (28.3): this is not global
// 940.2-942.2: (class anchor.sink.VarDeclStmt:29.5)
// 943.2-951.74: (class anchor.sink.AAlloc:29.5)
// 952.2-954.2: (class anchor.sink.VarDeclStmt:30.5)
// 955.2-958.9: (class anchor.sink.Assign:30.13)
// 961.2-965.16: (class anchor.sink.While:31.5)
// 967.1-967.27: (28.3): Bad tid
// 968.1-968.40: (28.3): this is not global
// 970.176-971.86: (31.5): invariant forall int j ::0 <= j && j < i ==> a[j] == j may not hold
// 972.1-972.344: (31.5): Loop does not preserve yields_as annotation for field ArrayDecl(T,IntType(),index,Spec(Cond(IsLocal(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List()))
// 973.1-973.347: (31.5): Loop does not preserve yields_as annotation for field ArrayDecl(T2,IntType(),index,Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List()))
// 974.1-974.33: (31.5): Phase must be invariant at loop head
// 975.1-975.30: (31.5): Potentially infinite loop cannot be in post-commit phase.
// 977.3-1004.34: (class anchor.sink.AWrite:35.7)
// 989.1-989.34: (35.7): Cannot have potential null deference in left-mover part.
// 994.1-994.18: (35.7): index < 0.
// 999.1-999.39: (35.7): index is >= length.
// 1003.1-1003.28: (35.7): Reduction failure
// 1005.3-1008.14: (class anchor.sink.Assign:36.13)
// 1011.1-1011.30: (31.5): Phase must be invariant at loop head
// 1013.2-1018.9: (class anchor.sink.Return:28.20)
// 1195.1-1195.34: (3.3): Array Array.Cow.T failed Write-Write Right-Mover Check
// 1268.1-1268.30: (3.3): Array Array.Cow.T failed Write-Read Right-Mover Check
// 1345.1-1345.34: (3.3): Array Array.Cow.T failed Write-Write Left-Mover Check
// 1419.1-1419.30: (3.3): Array Array.Cow.T failed Write-Read Left-Mover Check
// 1490.1-1490.34: (3.3): Array Array.Cow.T failed Read-Write Right-Mover Check
// 1564.1-1564.34: (3.3): Array Array.Cow.T failed Read-Write Left-Mover Check
// 1637.1-1637.34: (4.3): Array Array.Cow.T2 failed Write-Write Right-Mover Check
// 1710.1-1710.30: (4.3): Array Array.Cow.T2 failed Write-Read Right-Mover Check
// 1787.1-1787.34: (4.3): Array Array.Cow.T2 failed Write-Write Left-Mover Check
// 1861.1-1861.30: (4.3): Array Array.Cow.T2 failed Write-Read Left-Mover Check
// 1932.1-1932.34: (4.3): Array Array.Cow.T2 failed Read-Write Right-Mover Check
// 2006.1-2006.34: (4.3): Array Array.Cow.T2 failed Read-Write Left-Mover Check
// 2095.1-2095.140: (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
// 2096.1-2096.101: (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
// 2097.1-2097.156: (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
// 2219.1-2219.140: (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case C)
// 2346.1-2346.144: (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case D)
// 2347.1-2347.144: (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case R)
// 2436.1-2436.136: (3.3): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case F)
// 2437.1-2437.136: (3.3): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case H)
// 2438.1-2438.144: (3.3): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case I)
// 2526.1-2526.136: (3.3): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case J)
// 2527.1-2527.136: (3.3): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case K)
// 2528.1-2528.99: (3.3): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case L)
// 2618.1-2618.140: (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
// 2619.1-2619.101: (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
// 2620.1-2620.156: (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
// 2742.1-2742.140: (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T2 (case C)
// 2869.1-2869.144: (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T2 (case D)
// 2870.1-2870.144: (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T2 (case R)
// 2959.1-2959.136: (3.3): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T2 (case F)
// 2960.1-2960.136: (3.3): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T2 (case H)
// 2961.1-2961.144: (3.3): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T2 (case I)
// 3049.1-3049.136: (4.3): Array Array.Cow.T2 is not Write-Read Stable with respect to Array Array.Cow.T (case J)
// 3050.1-3050.136: (4.3): Array Array.Cow.T2 is not Write-Read Stable with respect to Array Array.Cow.T (case K)
// 3051.1-3051.99: (4.3): Array Array.Cow.T2 is not Write-Read Stable with respect to Array Array.Cow.T (case L)
// 3141.1-3141.140: (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T2 (case A.1)
// 3142.1-3142.101: (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T2 (case A.2)
// 3143.1-3143.156: (3.3): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T2 (case A.3)
// 3265.1-3265.140: (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T (case C)
// 3392.1-3392.144: (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T (case D)
// 3393.1-3393.144: (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T (case R)
// 3482.1-3482.136: (4.3): Array Array.Cow.T2 is not Read-Write Stable with respect to Array Array.Cow.T (case F)
// 3483.1-3483.136: (4.3): Array Array.Cow.T2 is not Read-Write Stable with respect to Array Array.Cow.T (case H)
// 3484.1-3484.144: (4.3): Array Array.Cow.T2 is not Read-Write Stable with respect to Array Array.Cow.T (case I)
// 3572.1-3572.136: (3.3): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T2 (case J)
// 3573.1-3573.136: (3.3): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T2 (case K)
// 3574.1-3574.99: (3.3): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T2 (case L)
// 3664.1-3664.140: (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T2 (case A.1)
// 3665.1-3665.101: (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T2 (case A.2)
// 3666.1-3666.156: (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T2 (case A.3)
// 3788.1-3788.140: (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T2 (case C)
// 3915.1-3915.144: (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T2 (case D)
// 3916.1-3916.144: (4.3): Array Array.Cow.T2 is not Write-Write Stable with respect to Array Array.Cow.T2 (case R)
// 4005.1-4005.136: (4.3): Array Array.Cow.T2 is not Read-Write Stable with respect to Array Array.Cow.T2 (case F)
// 4006.1-4006.136: (4.3): Array Array.Cow.T2 is not Read-Write Stable with respect to Array Array.Cow.T2 (case H)
// 4007.1-4007.144: (4.3): Array Array.Cow.T2 is not Read-Write Stable with respect to Array Array.Cow.T2 (case I)
// 4095.1-4095.136: (4.3): Array Array.Cow.T2 is not Write-Read Stable with respect to Array Array.Cow.T2 (case J)
// 4096.1-4096.136: (4.3): Array Array.Cow.T2 is not Write-Read Stable with respect to Array Array.Cow.T2 (case K)
// 4097.1-4097.99: (4.3): Array Array.Cow.T2 is not Write-Read Stable with respect to Array Array.Cow.T2 (case L)
// 4132.1-4156.2: (7.32): yields_as clause for Cow._lock is not valid
// 4161.1-4180.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 4186.1-4224.2: (7.32): yields_as clause for Cow._lock is not transitive
// 4242.1-4270.2: (3.3): yields_as clause for Array.Cow.T is not valid
// 4271.1-4296.2: (3.3): yields_as clause for Array.Cow.T is not reflexive
// 4301.1-4343.2: (3.3): yields_as clause for Array.Cow.T is not transitive
// 4361.1-4389.2: (4.3): yields_as clause for Array.Cow.T2 is not valid
// 4390.1-4415.2: (4.3): yields_as clause for Array.Cow.T2 is not reflexive
// 4420.1-4462.2: (4.3): yields_as clause for Array.Cow.T2 is not transitive
