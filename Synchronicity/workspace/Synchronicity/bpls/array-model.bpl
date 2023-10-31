                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/array-model.sink:                        
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = Cow[B]                                                                              
                                                                                                    
       [Cow.T{this}] a N                                                                            
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        [Cow.T{this}] a;                                                                            
        a = new [Cow.T{this}](10);                                                                  
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int tmp_0;                                                                                  
        tmp_0 = 0;                                                                                  
        a[tmp_0] := c;                                                                              
        int tmp_1;                                                                                  
        tmp_1 = 1;                                                                                  
        a[tmp_1] := c;                                                                              
        int tmp_2;                                                                                  
        tmp_2 = 1;                                                                                  
        a[tmp_2] := c;                                                                              
        int tmp_3;                                                                                  
        tmp_3 = 1;                                                                                  
        a[tmp_3] := c;                                                                              
        yield;                                                                                      
        assert false;                                                                               
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = Cow[B]                                                                              
                                                                                                    
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
        a = new [Cow.T{this}](10);                                                                  
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int tmp_0;                                                                                  
        tmp_0 = 0;                                                                                  
        a[tmp_0] := c;                                                                              
        int tmp_1;                                                                                  
        tmp_1 = 1;                                                                                  
        a[tmp_1] := c;                                                                              
        int tmp_2;                                                                                  
        tmp_2 = 1;                                                                                  
        a[tmp_2] := c;                                                                              
        int tmp_3;                                                                                  
        tmp_3 = 1;                                                                                  
        a[tmp_3] := c;                                                                              
        yield;                                                                                      
        assert false;                                                                               
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = Cow[B]                                                                              
                                                                                                    
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
        a = new [Cow.T{this}](10);                                                                  
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int tmp_0;                                                                                  
        tmp_0 = 0;                                                                                  
        a[tmp_0] := c;                                                                              
        int tmp_1;                                                                                  
        tmp_1 = 1;                                                                                  
        a[tmp_1] := c;                                                                              
        int tmp_2;                                                                                  
        tmp_2 = 1;                                                                                  
        a[tmp_2] := c;                                                                              
        int tmp_3;                                                                                  
        tmp_3 = 1;                                                                                  
        a[tmp_3] := c;                                                                              
        yield;                                                                                      
        assert false;                                                                               
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = Cow[B]                                                                              
                                                                                                    
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
        a = new [Cow.T{this}](10);                                                                  
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int tmp_0;                                                                                  
        tmp_0 = 0;                                                                                  
        a[tmp_0] := c;                                                                              
        int tmp_1;                                                                                  
        tmp_1 = 1;                                                                                  
        a[tmp_1] := c;                                                                              
        int tmp_2;                                                                                  
        tmp_2 = 1;                                                                                  
        a[tmp_2] := c;                                                                              
        int tmp_3;                                                                                  
        tmp_3 = 1;                                                                                  
        a[tmp_3] := c;                                                                              
        yield;                                                                                      
        assert false;                                                                               
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
                                                                                                    
function {:inline} ReadEval.Cow.a(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Cow),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Array.Cow.T.null;                                                                 
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.a(tid: Tid,this : Cow,newValue: Array.Cow.T,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Cow),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Cow),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Cow),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
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
                                                                                                    
requires ValidTid(tid);                                                                                    // (7.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (7.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var Array.Cow.T._state115376: [Array.Cow.T]State;                                                  
 var tmp_2115398: int;                                                                              
 var tmp_1115399: int;                                                                              
 var tmp_2115387: int;                                                                              
 var $recorded.state115387: int;                                                                    
 var mover115376: Mover;                                                                            
 var Cow.a115403: [Cow]Array.Cow.T;                                                                 
 var Cow._lock115387: [Cow]Tid;                                                                     
 var tmp_1115403: int;                                                                              
 var a115365: Array.Cow.T;                                                                          
 var a115399: Array.Cow.T;                                                                          
 var Array.Cow.T._length115387: [Array.Cow.T]int;                                                   
 var moverPath115365: MoverPath;                                                                    
 var Array.Cow.T._elems115402: [Array.Cow.T]([int]Cow);                                             
 var tmp_0115399: int;                                                                              
 var tmp_2115399: int;                                                                              
 var moverPath115376: MoverPath;                                                                    
 var $pc115398: Phase;                                                                              
 var Cow._lock115403: [Cow]Tid;                                                                     
 var tmp_2: int;                                                                                    
 var Cow._state115403: [Cow]State;                                                                  
 var this115387: Cow;                                                                               
 var Array.Cow.T._length115399: [Array.Cow.T]int;                                                   
 var $pc115399: Phase;                                                                              
 var Cow._state115399: [Cow]State;                                                                  
 var path115398: int;                                                                               
 var Cow._state115376: [Cow]State;                                                                  
 var Cow._state115365: [Cow]State;                                                                  
 var Array.Cow.T._state115398: [Array.Cow.T]State;                                                  
 var $recorded.state115399: int;                                                                    
 var $recorded.state115402: int;                                                                    
 var Array.Cow.T._state115365: [Array.Cow.T]State;                                                  
 var Cow._state115387: [Cow]State;                                                                  
 var tmp_1115399_post: int;                                                                         
 var Array.Cow.T._elems115365: [Array.Cow.T]([int]Cow);                                             
 var $pc115403: Phase;                                                                              
 var this115365: Cow;                                                                               
 var Cow._lock115365: [Cow]Tid;                                                                     
 var $recorded.state115399_post: int;                                                               
 var Cow.a115365: [Cow]Array.Cow.T;                                                                 
 var Cow.a115399: [Cow]Array.Cow.T;                                                                 
 var c115398: Cow;                                                                                  
 var Cow._lock115376: [Cow]Tid;                                                                     
 var tid115399: Tid;                                                                                
 var tmp_0: int;                                                                                    
 var a115402: Array.Cow.T;                                                                          
 var tmp_1115376: int;                                                                              
 var this115398: Cow;                                                                               
 var Array.Cow.T._state115399: [Array.Cow.T]State;                                                  
 var Array.Cow.T._length115403: [Array.Cow.T]int;                                                   
 var Cow._state115399_post: [Cow]State;                                                             
 var Array.Cow.T._length115365: [Array.Cow.T]int;                                                   
 var Cow._lock115402: [Cow]Tid;                                                                     
 var tid115398: Tid;                                                                                
 var Array.Cow.T._elems115398: [Array.Cow.T]([int]Cow);                                             
 var Cow.a115399_post: [Cow]Array.Cow.T;                                                            
 var tmp_0115376: int;                                                                              
 var tmp_3115399: int;                                                                              
 var c115387: Cow;                                                                                  
 var c115399: Cow;                                                                                  
 var tmp_3115403: int;                                                                              
 var Array.Cow.T._length115402: [Array.Cow.T]int;                                                   
 var $recorded.state115365: int;                                                                    
 var this115399: Cow;                                                                               
 var $pc115365: Phase;                                                                              
 var Array.Cow.T._elems115403: [Array.Cow.T]([int]Cow);                                             
 var path115365: int;                                                                               
 var Array.Cow.T._elems115376: [Array.Cow.T]([int]Cow);                                             
 var Array.Cow.T._length115399_post: [Array.Cow.T]int;                                              
 var tmp_0115403: int;                                                                              
 var tmp_0115387: int;                                                                              
 var this115402: Cow;                                                                               
 var mover115387: Mover;                                                                            
 var moverPath115387: MoverPath;                                                                    
 var tid115365: Tid;                                                                                
 var $pc115376: Phase;                                                                              
 var Array.Cow.T._length115376: [Array.Cow.T]int;                                                   
 var Array.Cow.T._length115398: [Array.Cow.T]int;                                                   
 var $pc115402: Phase;                                                                              
 var Cow._lock115399: [Cow]Tid;                                                                     
 var $pc115399_post: Phase;                                                                         
 var $pc115387: Phase;                                                                              
 var Array.Cow.T._state115399_post: [Array.Cow.T]State;                                             
 var tid115403: Tid;                                                                                
 var a115398: Array.Cow.T;                                                                          
 var Cow._lock115399_post: [Cow]Tid;                                                                
 var Array.Cow.T._elems115399_post: [Array.Cow.T]([int]Cow);                                        
 var Array.Cow.T._state115402: [Array.Cow.T]State;                                                  
 var $recorded.state115403: int;                                                                    
 var c115399_post: Cow;                                                                             
 var a115376: Array.Cow.T;                                                                          
 var a115387: Array.Cow.T;                                                                          
 var mover115365: Mover;                                                                            
 var Cow.a115398: [Cow]Array.Cow.T;                                                                 
 var c115365: Cow;                                                                                  
 var tmp_2115403: int;                                                                              
 var tmp_0115402: int;                                                                              
 var this115376: Cow;                                                                               
 var Cow._state115402: [Cow]State;                                                                  
 var tmp_3: int;                                                                                    
 var c115376: Cow;                                                                                  
 var Cow._state115398: [Cow]State;                                                                  
 var tmp_1115402: int;                                                                              
 var $recorded.state115376: int;                                                                    
 var Array.Cow.T._elems115387: [Array.Cow.T]([int]Cow);                                             
 var tmp_0115399_post: int;                                                                         
 var Array.Cow.T._state115403: [Array.Cow.T]State;                                                  
 var path115387: int;                                                                               
 var tmp_2115402: int;                                                                              
 var Cow.a115402: [Cow]Array.Cow.T;                                                                 
 var Cow.a115387: [Cow]Array.Cow.T;                                                                 
 var a115399_post: Array.Cow.T;                                                                     
 var Array.Cow.T._elems115399: [Array.Cow.T]([int]Cow);                                             
 var tid115376: Tid;                                                                                
 var tid115399_post: Tid;                                                                           
 var mover115398: Mover;                                                                            
 var tmp_2115399_post: int;                                                                         
 var tmp_1115387: int;                                                                              
 var tid115387: Tid;                                                                                
 var a: Array.Cow.T;                                                                                
 var $recorded.state115398: int;                                                                    
 var tmp_0115365: int;                                                                              
 var c115402: Cow;                                                                                  
 var this115399_post: Cow;                                                                          
 var Cow._lock115398: [Cow]Tid;                                                                     
 var this115403: Cow;                                                                               
 var a115403: Array.Cow.T;                                                                          
 var c: Cow;                                                                                        
 var tmp_1115398: int;                                                                              
 var Array.Cow.T._state115387: [Array.Cow.T]State;                                                  
 var Cow.a115376: [Cow]Array.Cow.T;                                                                 
 var tmp_3115402: int;                                                                              
 var moverPath115398: MoverPath;                                                                    
 var tmp_3115398: int;                                                                              
 var tmp_3115399_post: int;                                                                         
 var tmp_0115398: int;                                                                              
 var path115376: int;                                                                               
 var c115403: Cow;                                                                                  
 var tid115402: Tid;                                                                                
 var tmp_1: int;                                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 8.8: [Cow.T{this}] a;                                                                           
                                                                                                    
                                                                                                    
 // 8.8: a = new [Cow.T{this}](10);                                                                 
                                                                                                    
 havoc a;                                                                                           
 assume isFresh(Array.Cow.T._state[a]);                                                             
 assume Array.Cow.T._length[a] == 10;                                                               
 assume Array.Cow.T._this[a] == this;                                                               
 Array.Cow.T._state[a] := LOCAL(tid);                                                               
 assume (forall _i : int :: 0 <= _i ==> Array.Cow.T._elems[a][_i] == Cow.null);                     
                                                                                                    
 // 9.8: Cow c;                                                                                     
                                                                                                    
                                                                                                    
 // 9.8: c = new Cow();                                                                             
                                                                                                    
 havoc c;                                                                                           
 assume c != Cow.null && isFresh(Cow._state[c]);                                                    
 Cow._state[c] := LOCAL(tid);                                                                       
 assume Cow.a[c]  == Array.Cow.T.null;                                                              
 assume Cow._lock[c]  == Tid.null;                                                                  
                                                                                                    
 // 10.10: int tmp_0;                                                                               
                                                                                                    
                                                                                                    
 // 10.10: tmp_0 = 0;                                                                               
                                                                                                    
 tmp_0 := 0;                                                                                        
                                                                                                    
 // 10.8: a[tmp_0] := c;                                                                            
                                                                                                    
                                                                                                    
 moverPath115365 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,tmp_0: int,c: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover115365 := m#moverPath(moverPath115365);                                                       
 path115365 := p#moverPath(moverPath115365);                                                        
 assume Cow._state115365 == Cow._state && Cow.a115365 == Cow.a && Cow._lock115365 == Cow._lock && Array.Cow.T._state115365 == Array.Cow.T._state && Array.Cow.T._elems115365 == Array.Cow.T._elems && Array.Cow.T._length115365 == Array.Cow.T._length && tmp_0115365 == tmp_0 && c115365 == c && a115365 == a && this115365 == this && tid115365 == tid && $pc115365 == $pc;
 assume $recorded.state115365 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (10.8): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tmp_0;                                                                                
 } else {                                                                                           
  assert 0 <= tmp_0;                                                                                       // (10.8): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tmp_0 < Array.Cow.T._length[a];                                                            
 } else {                                                                                           
  assert tmp_0 < Array.Cow.T._length[a];                                                                   // (10.8): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover115365);                                                               
 assert $pc != PhaseError;                                                                                 // (10.8): Reduction failure
 Array.Cow.T._elems[a][tmp_0] := c;                                                                 
 if (isLocal(Cow._state[c], tid)) {                                                                 
  Cow._state[c] := SHARED();                                                                        
  assert isSharedAssignable(Array.Cow.T._state[Cow.a[c]]);                                                 // (10.8): c became shared, but c.a may not be shared.
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 11.10: int tmp_1;                                                                               
                                                                                                    
                                                                                                    
 // 11.10: tmp_1 = 1;                                                                               
                                                                                                    
 tmp_1 := 1;                                                                                        
                                                                                                    
 // 11.8: a[tmp_1] := c;                                                                            
                                                                                                    
                                                                                                    
 moverPath115376 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,tmp_1: int,c: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover115376 := m#moverPath(moverPath115376);                                                       
 path115376 := p#moverPath(moverPath115376);                                                        
 assume Cow._state115376 == Cow._state && Cow.a115376 == Cow.a && Cow._lock115376 == Cow._lock && Array.Cow.T._state115376 == Array.Cow.T._state && Array.Cow.T._elems115376 == Array.Cow.T._elems && Array.Cow.T._length115376 == Array.Cow.T._length && tmp_1115376 == tmp_1 && tmp_0115376 == tmp_0 && c115376 == c && a115376 == a && this115376 == this && tid115376 == tid && $pc115376 == $pc;
 assume $recorded.state115376 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (11.8): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tmp_1;                                                                                
 } else {                                                                                           
  assert 0 <= tmp_1;                                                                                       // (11.8): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tmp_1 < Array.Cow.T._length[a];                                                            
 } else {                                                                                           
  assert tmp_1 < Array.Cow.T._length[a];                                                                   // (11.8): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover115376);                                                               
 assert $pc != PhaseError;                                                                                 // (11.8): Reduction failure
 Array.Cow.T._elems[a][tmp_1] := c;                                                                 
 if (isLocal(Cow._state[c], tid)) {                                                                 
  Cow._state[c] := SHARED();                                                                        
  assert isSharedAssignable(Array.Cow.T._state[Cow.a[c]]);                                                 // (11.8): c became shared, but c.a may not be shared.
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 12.10: int tmp_2;                                                                               
                                                                                                    
                                                                                                    
 // 12.10: tmp_2 = 1;                                                                               
                                                                                                    
 tmp_2 := 1;                                                                                        
                                                                                                    
 // 12.8: a[tmp_2] := c;                                                                            
                                                                                                    
                                                                                                    
 moverPath115387 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,tmp_2: int,c: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover115387 := m#moverPath(moverPath115387);                                                       
 path115387 := p#moverPath(moverPath115387);                                                        
 assume Cow._state115387 == Cow._state && Cow.a115387 == Cow.a && Cow._lock115387 == Cow._lock && Array.Cow.T._state115387 == Array.Cow.T._state && Array.Cow.T._elems115387 == Array.Cow.T._elems && Array.Cow.T._length115387 == Array.Cow.T._length && tmp_2115387 == tmp_2 && tmp_1115387 == tmp_1 && tmp_0115387 == tmp_0 && c115387 == c && a115387 == a && this115387 == this && tid115387 == tid && $pc115387 == $pc;
 assume $recorded.state115387 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (12.8): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tmp_2;                                                                                
 } else {                                                                                           
  assert 0 <= tmp_2;                                                                                       // (12.8): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tmp_2 < Array.Cow.T._length[a];                                                            
 } else {                                                                                           
  assert tmp_2 < Array.Cow.T._length[a];                                                                   // (12.8): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover115387);                                                               
 assert $pc != PhaseError;                                                                                 // (12.8): Reduction failure
 Array.Cow.T._elems[a][tmp_2] := c;                                                                 
 if (isLocal(Cow._state[c], tid)) {                                                                 
  Cow._state[c] := SHARED();                                                                        
  assert isSharedAssignable(Array.Cow.T._state[Cow.a[c]]);                                                 // (12.8): c became shared, but c.a may not be shared.
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 13.10: int tmp_3;                                                                               
                                                                                                    
                                                                                                    
 // 13.10: tmp_3 = 1;                                                                               
                                                                                                    
 tmp_3 := 1;                                                                                        
                                                                                                    
 // 13.8: a[tmp_3] := c;                                                                            
                                                                                                    
                                                                                                    
 moverPath115398 := WriteEval.Array.Cow.T(tid: Tid,this: Cow,a: Array.Cow.T,tmp_3: int,c: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover115398 := m#moverPath(moverPath115398);                                                       
 path115398 := p#moverPath(moverPath115398);                                                        
 assume Cow._state115398 == Cow._state && Cow.a115398 == Cow.a && Cow._lock115398 == Cow._lock && Array.Cow.T._state115398 == Array.Cow.T._state && Array.Cow.T._elems115398 == Array.Cow.T._elems && Array.Cow.T._length115398 == Array.Cow.T._length && tmp_3115398 == tmp_3 && tmp_2115398 == tmp_2 && tmp_1115398 == tmp_1 && tmp_0115398 == tmp_0 && c115398 == c && a115398 == a && this115398 == this && tid115398 == tid && $pc115398 == $pc;
 assume $recorded.state115398 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume a != Array.Cow.T.null;                                                                     
 } else {                                                                                           
  assert a != Array.Cow.T.null;                                                                            // (13.8): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= tmp_3;                                                                                
 } else {                                                                                           
  assert 0 <= tmp_3;                                                                                       // (13.8): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume tmp_3 < Array.Cow.T._length[a];                                                            
 } else {                                                                                           
  assert tmp_3 < Array.Cow.T._length[a];                                                                   // (13.8): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover115398);                                                               
 assert $pc != PhaseError;                                                                                 // (13.8): Reduction failure
 Array.Cow.T._elems[a][tmp_3] := c;                                                                 
 if (isLocal(Cow._state[c], tid)) {                                                                 
  Cow._state[c] := SHARED();                                                                        
  assert isSharedAssignable(Array.Cow.T._state[Cow.a[c]]);                                                 // (13.8): c became shared, but c.a may not be shared.
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 14.8: yield;                                                                                    
                                                                                                    
 assume Cow._state115399 == Cow._state && Cow.a115399 == Cow.a && Cow._lock115399 == Cow._lock && Array.Cow.T._state115399 == Array.Cow.T._state && Array.Cow.T._elems115399 == Array.Cow.T._elems && Array.Cow.T._length115399 == Array.Cow.T._length && tmp_3115399 == tmp_3 && tmp_2115399 == tmp_2 && tmp_1115399 == tmp_1 && tmp_0115399 == tmp_0 && c115399 == c && a115399 == a && this115399 == this && tid115399 == tid;
 assume $recorded.state115399 == 1;                                                                 
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state115399_post == Cow._state && Cow.a115399_post == Cow.a && Cow._lock115399_post == Cow._lock && Array.Cow.T._state115399_post == Array.Cow.T._state && Array.Cow.T._elems115399_post == Array.Cow.T._elems && Array.Cow.T._length115399_post == Array.Cow.T._length && tmp_3115399_post == tmp_3 && tmp_2115399_post == tmp_2 && tmp_1115399_post == tmp_1 && tmp_0115399_post == tmp_0 && c115399_post == c && a115399_post == a && this115399_post == this && tid115399_post == tid;
 assume $recorded.state115399_post == 1;                                                            
                                                                                                    
 // 15.8: assert false;                                                                             
                                                                                                    
 assume Cow._state115402 == Cow._state && Cow.a115402 == Cow.a && Cow._lock115402 == Cow._lock && Array.Cow.T._state115402 == Array.Cow.T._state && Array.Cow.T._elems115402 == Array.Cow.T._elems && Array.Cow.T._length115402 == Array.Cow.T._length && tmp_3115402 == tmp_3 && tmp_2115402 == tmp_2 && tmp_1115402 == tmp_1 && tmp_0115402 == tmp_0 && c115402 == c && a115402 == a && this115402 == this && tid115402 == tid;
 assume $recorded.state115402 == 1;                                                                 
 assert false;                                                                                             // (15.8): This assertion may not hold.
                                                                                                    
 // 7.21: // return;                                                                                
                                                                                                    
 assume Cow._state115403 == Cow._state && Cow.a115403 == Cow.a && Cow._lock115403 == Cow._lock && Array.Cow.T._state115403 == Array.Cow.T._state && Array.Cow.T._elems115403 == Array.Cow.T._elems && Array.Cow.T._length115403 == Array.Cow.T._length && tmp_3115403 == tmp_3 && tmp_2115403 == tmp_2 && tmp_1115403 == tmp_1 && tmp_0115403 == tmp_0 && c115403 == c && a115403 == a && this115403 == this && tid115403 == tid;
 assume $recorded.state115403 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
/*** Array Array.Cow.T ***/                                                                         
                                                                                                    
type Array.Cow.T;                                                                                   
const unique Array.Cow.T.null: Array.Cow.T;                                                         
var Array.Cow.T._state: [Array.Cow.T]State;                                                         
                                                                                                    
const Array.Cow.T._this : [Array.Cow.T]Cow;                                                         
const Array.Cow.T._length : [Array.Cow.T]int;                                                       
var Array.Cow.T._elems  : [Array.Cow.T]([int]Cow);                                                  
                                                                                                    
axiom (forall $this : Array.Cow.T :: Array.Cow.T._length[$this] >= 0);                              
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.Cow.T: Spec(ConstExpr(MoverConst(B())),false,List())                                       
                                                                                                    
function {:inline} ReadEval.Array.Cow.T(tid: Tid,this : Cow,athis : Array.Cow.T,index : int,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Cow),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 moverPath(_B, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.Cow.T: Spec(ConstExpr(MoverConst(B())),false,List())                                       
                                                                                                    
function {:inline} WriteEval.Array.Cow.T(tid: Tid,this : Cow,athis : Array.Cow.T,index : int,newValue: Cow,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Cow),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_B, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Cow),Array.Cow.T._length: [Array.Cow.T]int) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Array.Cow.T  :: _i == Array.Cow.T.null <==> isNull(Array.Cow.T._state[_i])) &&        
  (forall _t: Tid, _i: Array.Cow.T  :: ValidTid(_t) && isAccessible(Array.Cow.T._state[_i], _t) ==> isAccessible(Cow._state[Array.Cow.T._this[_i]], _t)) &&
  (forall _i: Cow ::  (isShared(Cow._state[_i]) ==> isSharedAssignable(Array.Cow.T._state[Cow.a[_i]]))) &&
  (forall _i: Cow ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Cow._state[_i],_t) ==> isLocalAssignable(Array.Cow.T._state[Cow.a[_i]], _t)))) &&
  (forall _i: Cow :: { Cow.a[_i] } Array.Cow.T._this[Cow.a[_i]] == _i) &&                           
  (forall _i: Array.Cow.T, _index: int ::  (isShared(Array.Cow.T._state[_i]) && 0 <= _index && _index < Array.Cow.T._length[_i]) ==> isSharedAssignable(Cow._state[Array.Cow.T._elems[_i][_index]])) &&
  (forall _i: Array.Cow.T, _index: int ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Array.Cow.T._state[_i],_t) && 0 <= _index && _index < Array.Cow.T._length[_i]) ==> isLocalAssignable(Cow._state[Array.Cow.T._elems[_i][_index]], _t))) &&
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
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
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.a failed Write-Write Right-Mover Check
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
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
 assert _readByU_Mover == _E;                                                                              // (5.5): Cow.a failed Write-Read Right-Mover Check
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
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
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.a failed Write-Write Left-Mover Check
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
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
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): Cow.a failed Write-Read Left-Mover Check
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.a failed Read-Write Right-Mover Check
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.a failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: Cow, w: Cow, x_owner: Cow, x: Array.Cow.T, i: int)
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Array Array.Cow.T failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: Cow, w: Cow, x_owner: Cow, x: Array.Cow.T, i: int)
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
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
 assert _readByU_Mover == _E;                                                                              // (3.5): Array Array.Cow.T failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: Cow, w: Cow, x_owner: Cow, x: Array.Cow.T, i: int)
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
 var havocValue : Cow;                                                                              
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := havocValue;                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Array Array.Cow.T failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: Cow, w: Cow, x_owner: Cow, x: Array.Cow.T, i: int)
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
 var havocValue : Cow;                                                                              
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.5): Array Array.Cow.T failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: Cow, w: Cow, x_owner: Cow, x: Array.Cow.T, i: int)
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Array Array.Cow.T failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: Cow, w: Cow, x_owner: Cow, x: Array.Cow.T, i: int)
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
 var havocValue : Cow;                                                                              
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
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
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Array Array.Cow.T failed Read-Write Left-Mover Check
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.3)
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var w_mid: Array.Cow.T;                                                                            
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var v_mid: Array.Cow.T;                                                                            
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Cow);                                               
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case C)
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var w_mid: Array.Cow.T;                                                                            
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var v_mid: Array.Cow.T;                                                                            
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Cow);                                               
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case R)
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.a is not Read-Write Stable with respect to Cow.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.a is not Read-Write Stable with respect to Cow.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.a is not Read-Write Stable with respect to Cow.a (case I)
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.a is not Write-Read Stable with respect to Cow.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.a is not Write-Read Stable with respect to Cow.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Cow.a is not Write-Read Stable with respect to Cow.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: Cow, w0: Cow, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
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
 var w0_pre: Cow;                                                                                   
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var y_post: Array.Cow.T;                                                                           
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
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
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: Cow, w0: Cow, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
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
 var w0_pre: Cow;                                                                                   
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var v_mid: Array.Cow.T;                                                                            
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Cow);                                               
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var w_mid: Cow;                                                                                    
 var j_mid: int;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var y_post: Array.Cow.T;                                                                           
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: Cow, w0: Cow, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
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
 var w0_pre: Cow;                                                                                   
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var v_mid: Array.Cow.T;                                                                            
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Cow);                                               
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var w_mid: Cow;                                                                                    
 var j_mid: int;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var y_post: Array.Cow.T;                                                                           
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
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
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: Cow, w0: Cow, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
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
 var w0_pre: Cow;                                                                                   
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var y_post: Array.Cow.T;                                                                           
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: Cow, w0: Cow, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
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
 var w0_pre: Cow;                                                                                   
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var y_post: Array.Cow.T;                                                                           
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: Cow, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
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
 var w0_pre: Array.Cow.T;                                                                           
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
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: Cow, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
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
 var tmpV : Cow;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var w0_pre: Array.Cow.T;                                                                           
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
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var i_mid: int;                                                                                    
 var w_mid: Array.Cow.T;                                                                            
 var $recorded.state_mid: int;                                                                      
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Cow);                                               
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var w0_mid: Array.Cow.T;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
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
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: Cow, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
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
 var tmpV : Cow;                                                                                    
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
 var w0_pre: Array.Cow.T;                                                                           
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
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var i_mid: int;                                                                                    
 var w_mid: Array.Cow.T;                                                                            
 var $recorded.state_mid: int;                                                                      
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Cow);                                               
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var w0_mid: Array.Cow.T;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
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
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: Cow, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
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
 var w0_pre: Array.Cow.T;                                                                           
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
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: Cow, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
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
 var w0_pre: Array.Cow.T;                                                                           
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
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
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
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
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
 var w0_pre: Cow;                                                                                   
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var y_post: Array.Cow.T;                                                                           
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
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
 var tmpV : Cow;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var w0_pre: Cow;                                                                                   
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Cow);                                               
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var y_post: Array.Cow.T;                                                                           
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
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
 var tmpV : Cow;                                                                                    
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
 var w0_pre: Cow;                                                                                   
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Cow);                                               
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var y_post: Array.Cow.T;                                                                           
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
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
 var w0_pre: Cow;                                                                                   
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var y_post: Array.Cow.T;                                                                           
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
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
 var w0_pre: Cow;                                                                                   
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                               
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                              
 var y_post: Array.Cow.T;                                                                           
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case L)
                                                                                                    
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
                                                                                                    
function {:inline} Y_Cow.a(tid : Tid, this: Cow, newValue: Array.Cow.T , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _R)) ==> (Cow.a[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.a(tid : Tid, this: Cow, newValue: Array.Cow.T , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.a.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Array.Cow.T , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]Cow);                                              
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
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
                                                                                                    
procedure Y_Cow.a.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]Cow);                                              
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.a(tid, this, Cow.a[this] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow.a.Transitive(tid : Tid, this: Cow, newValue : Array.Cow.T , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Array.Cow.T, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]Cow), Array.Cow.T._length_p: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires StateInvariant(Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
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
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                                
                                                                                                    
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Cow.a_post: [Cow]Array.Cow.T;                                                                   
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                               
var this_post: Cow;                                                                                 
var newValue_post: Array.Cow.T;                                                                     
                                                                                                    
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
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int)
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
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]Cow);                                              
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
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
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]Cow);                                              
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Array.Cow.T, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]Cow), Array.Cow.T._length_p: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires StateInvariant(Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
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
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                                
                                                                                                    
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Cow.a_post: [Cow]Array.Cow.T;                                                                   
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                               
var this_post: Cow;                                                                                 
var newValue_post: Tid;                                                                             
                                                                                                    
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
                                                                                                    
function {:inline} Y_Array.Cow.T(tid : Tid, athis: Array.Cow.T, index: int, newValue: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
(var this := Array.Cow.T._this[athis];                                                              
 ((isAccessible(Array.Cow.T._state[athis], tid) && leq(m#moverPath(ReadEval.Array.Cow.T(tid: Tid,Array.Cow.T._this[athis]: Cow,athis: Array.Cow.T,index: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _R)) ==> (Array.Cow.T._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.Cow.T(tid : Tid, athis: Array.Cow.T, index: int, newValue: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
(var this := Array.Cow.T._this[athis];                                                              
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Subsumes.W(tid : Tid, u : Tid, this: Cow, athis: Array.Cow.T, index: int, newValue: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int)
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
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]Cow);                                              
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var index_yield: int;                                                                               
var athis_yield: Array.Cow.T;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Cow.T._state[athis], u);                                                 
 assume !isError(m#moverPath(WriteEval.Array.Cow.T(u: Tid,Array.Cow.T._this[athis]: Cow,athis: Array.Cow.T,index: int,newValue: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.T(tid, athis, index, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Reflexive(tid : Tid, this: Cow, athis: Array.Cow.T, index: int , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires this == Array.Cow.T._this[athis];                                                         
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]Cow);                                              
var Cow._state_yield: [Cow]State;                                                                   
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
                                                                                                    
procedure Y_Array.Cow.T.Transitive(tid : Tid, this: Cow, athis: Array.Cow.T, index: int, newValue : Cow , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Array.Cow.T, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]Cow), Array.Cow.T._length_p: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires StateInvariant(Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
                                                                                                    
 requires this == Array.Cow.T._this[athis];                                                         
 requires ValidTid(tid);                                                                            
{                                                                                                   
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
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Cow);                                                
                                                                                                    
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Cow.a_post: [Cow]Array.Cow.T;                                                                   
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var athis_post: Array.Cow.T;                                                                        
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Array.Cow.T._elems_post: [Array.Cow.T]([int]Cow);                                               
var index_post: int;                                                                                
var this_post: Cow;                                                                                 
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume Cow._state_post == Cow._state_p && Cow.a_post == Cow.a_p && Cow._lock_post == Cow._lock_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.Cow.T._state[athis], tid);                                               
 assume Y(tid , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assume Y_Array.Cow.T(tid, athis, index, newValue , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assert Y_Array.Cow.T(tid, athis, index, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Cow), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Array.Cow.T, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]Cow), Array.Cow.T._length_p: [Array.Cow.T]int): bool
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
                                                                                                    
                                                                                                    
// 442.1-807.2: (Method:7.5)
// 451.1-451.24: (7.5): Bad tid
// 452.1-452.37: (7.5): this is not global
// 603.2-605.2: (class anchor.sink.VarDeclStmt:8.8)
// 606.2-614.80: (class anchor.sink.AAlloc:8.8)
// 615.2-617.2: (class anchor.sink.VarDeclStmt:9.8)
// 618.2-625.35: (class anchor.sink.Alloc:9.8)
// 626.2-628.2: (class anchor.sink.VarDeclStmt:10.10)
// 629.2-632.13: (class anchor.sink.Assign:10.10)
// 633.2-665.2: (class anchor.sink.AWrite:10.8)
// 645.1-645.32: (10.8): Cannot have potential null deference in left-mover part.
// 650.1-650.21: (10.8): index < 0.
// 655.1-655.41: (10.8): index is >= length.
// 659.1-659.27: (10.8): Reduction failure
// 663.1-663.59: (10.8): c became shared, but c.a may not be shared.
// 666.2-668.2: (class anchor.sink.VarDeclStmt:11.10)
// 669.2-672.13: (class anchor.sink.Assign:11.10)
// 673.2-705.2: (class anchor.sink.AWrite:11.8)
// 685.1-685.32: (11.8): Cannot have potential null deference in left-mover part.
// 690.1-690.21: (11.8): index < 0.
// 695.1-695.41: (11.8): index is >= length.
// 699.1-699.27: (11.8): Reduction failure
// 703.1-703.59: (11.8): c became shared, but c.a may not be shared.
// 706.2-708.2: (class anchor.sink.VarDeclStmt:12.10)
// 709.2-712.13: (class anchor.sink.Assign:12.10)
// 713.2-745.2: (class anchor.sink.AWrite:12.8)
// 725.1-725.32: (12.8): Cannot have potential null deference in left-mover part.
// 730.1-730.21: (12.8): index < 0.
// 735.1-735.41: (12.8): index is >= length.
// 739.1-739.27: (12.8): Reduction failure
// 743.1-743.59: (12.8): c became shared, but c.a may not be shared.
// 746.2-748.2: (class anchor.sink.VarDeclStmt:13.10)
// 749.2-752.13: (class anchor.sink.Assign:13.10)
// 753.2-785.2: (class anchor.sink.AWrite:13.8)
// 765.1-765.32: (13.8): Cannot have potential null deference in left-mover part.
// 770.1-770.21: (13.8): index < 0.
// 775.1-775.41: (13.8): index is >= length.
// 779.1-779.27: (13.8): Reduction failure
// 783.1-783.59: (13.8): c became shared, but c.a may not be shared.
// 786.2-794.41: (class anchor.sink.Yield:14.8)
// 795.2-800.15: (class anchor.sink.Assert:15.8)
// 800.1-800.15: (15.8): This assertion may not hold.
// 801.2-806.9: (class anchor.sink.Return:7.21)
// 929.1-929.34: (5.5): Cow.a failed Write-Write Right-Mover Check
// 992.1-992.30: (5.5): Cow.a failed Write-Read Right-Mover Check
// 1059.1-1059.34: (5.5): Cow.a failed Write-Write Left-Mover Check
// 1123.1-1123.30: (5.5): Cow.a failed Write-Read Left-Mover Check
// 1184.1-1184.34: (5.5): Cow.a failed Read-Write Right-Mover Check
// 1248.1-1248.34: (5.5): Cow.a failed Read-Write Left-Mover Check
// 1317.1-1317.34: (3.5): Array Array.Cow.T failed Write-Write Right-Mover Check
// 1386.1-1386.30: (3.5): Array Array.Cow.T failed Write-Read Right-Mover Check
// 1459.1-1459.34: (3.5): Array Array.Cow.T failed Write-Write Left-Mover Check
// 1529.1-1529.30: (3.5): Array Array.Cow.T failed Write-Read Left-Mover Check
// 1596.1-1596.34: (3.5): Array Array.Cow.T failed Read-Write Right-Mover Check
// 1666.1-1666.34: (3.5): Array Array.Cow.T failed Read-Write Left-Mover Check
// 1741.1-1741.140: (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.1)
// 1742.1-1742.101: (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.2)
// 1743.1-1743.158: (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.3)
// 1845.1-1845.140: (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case C)
// 1952.1-1952.144: (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case D)
// 1953.1-1953.144: (5.5): Cow.a is not Write-Write Stable with respect to Cow.a (case R)
// 2028.1-2028.136: (5.5): Cow.a is not Read-Write Stable with respect to Cow.a (case F)
// 2029.1-2029.136: (5.5): Cow.a is not Read-Write Stable with respect to Cow.a (case H)
// 2030.1-2030.146: (5.5): Cow.a is not Read-Write Stable with respect to Cow.a (case I)
// 2104.1-2104.136: (5.5): Cow.a is not Write-Read Stable with respect to Cow.a (case J)
// 2105.1-2105.136: (5.5): Cow.a is not Write-Read Stable with respect to Cow.a (case K)
// 2106.1-2106.99: (5.5): Cow.a is not Write-Read Stable with respect to Cow.a (case L)
// 2187.1-2187.140: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.1)
// 2188.1-2188.101: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.2)
// 2189.1-2189.156: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.3)
// 2298.1-2298.140: (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case C)
// 2412.1-2412.144: (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case D)
// 2413.1-2413.144: (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case R)
// 2493.1-2493.136: (5.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case F)
// 2494.1-2494.136: (5.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case H)
// 2495.1-2495.144: (5.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case I)
// 2574.1-2574.136: (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case J)
// 2575.1-2575.136: (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case K)
// 2576.1-2576.99: (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case L)
// 2657.1-2657.140: (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
// 2658.1-2658.101: (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
// 2659.1-2659.156: (5.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
// 2768.1-2768.140: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case C)
// 2882.1-2882.144: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case D)
// 2883.1-2883.144: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case R)
// 2963.1-2963.136: (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case F)
// 2964.1-2964.136: (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case H)
// 2965.1-2965.144: (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case I)
// 3044.1-3044.136: (5.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case J)
// 3045.1-3045.136: (5.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case K)
// 3046.1-3046.99: (5.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case L)
// 3132.1-3132.140: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
// 3133.1-3133.101: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
// 3134.1-3134.156: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
// 3250.1-3250.140: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case C)
// 3371.1-3371.144: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case D)
// 3372.1-3372.144: (3.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case R)
// 3457.1-3457.136: (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case F)
// 3458.1-3458.136: (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case H)
// 3459.1-3459.144: (3.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case I)
// 3543.1-3543.136: (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case J)
// 3544.1-3544.136: (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case K)
// 3545.1-3545.99: (3.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case L)
// 3578.1-3600.2: (5.5): yields_as clause for Cow.a is not valid
// 3605.1-3622.2: (5.5): yields_as clause for Cow.a is not reflexive
// 3628.1-3662.2: (5.5): yields_as clause for Cow.a is not transitive
// 3682.1-3704.2: (7.32): yields_as clause for Cow._lock is not valid
// 3709.1-3726.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 3732.1-3766.2: (7.32): yields_as clause for Cow._lock is not transitive
// 3784.1-3810.2: (3.5): yields_as clause for Array.Cow.T is not valid
// 3811.1-3834.2: (3.5): yields_as clause for Array.Cow.T is not reflexive
// 3839.1-3877.2: (3.5): yields_as clause for Array.Cow.T is not transitive
