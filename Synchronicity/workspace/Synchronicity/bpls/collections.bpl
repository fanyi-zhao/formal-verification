                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/collections.anchor:                      
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        Set<int> s;                                                                                 
        s = SetEmpty<int>();                                                                        
        s = SetAdd<int>(s,4);                                                                       
        boolean tmp1;                                                                               
        tmp1 = SetContains<int>(s,4);                                                               
        assert tmp1 /* == SetContains<int>(s,4) */;                                                 
        boolean tmp2;                                                                               
        boolean tmp3;                                                                               
        tmp3 = SetContains<int>(s,3);                                                               
        tmp2 = !tmp3;                                                                               
        assert tmp2 /* == !SetContains<int>(s,3) */;                                                
        s = SetAdd<int>(s,3);                                                                       
        boolean tmp4;                                                                               
        tmp4 = SetContains<int>(s,3);                                                               
        assert tmp4 /* == SetContains<int>(s,3) */;                                                 
        Set<Set<int>> ss;                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void g() {                                                                             
        Set<int> s;                                                                                 
        Set<Set<int>> ss;                                                                           
        s = SetEmpty<int>();                                                                        
        ss = SetEmpty<Set<int>>();                                                                  
        s = SetAdd<int>(s,4);                                                                       
        s = SetAdd<int>(s,5);                                                                       
        s = SetAdd<int>(s,6);                                                                       
        ss = SetAdd<Set<int>>(ss,s);                                                                
        boolean tmp5;                                                                               
        tmp5 = SetContains<Set<int>>(ss,s);                                                         
        assert tmp5 /* == SetContains<Set<int>>(ss,s) */;                                           
        s = SetAdd<int>(s,7);                                                                       
        boolean tmp6;                                                                               
        boolean tmp7;                                                                               
        tmp7 = SetContains<Set<int>>(ss,s);                                                         
        tmp6 = !tmp7;                                                                               
        assert tmp6 /* == !SetContains<Set<int>>(ss,s) */;                                          
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
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
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        Set<int> s;                                                                                 
        s = SetEmpty<int>();                                                                        
        s = SetAdd<int>(s,4);                                                                       
        boolean tmp1;                                                                               
        tmp1 = SetContains<int>(s,4);                                                               
        assert tmp1 /* == SetContains<int>(s,4) */;                                                 
        boolean tmp2;                                                                               
        boolean tmp3;                                                                               
        tmp3 = SetContains<int>(s,3);                                                               
        tmp2 = !tmp3;                                                                               
        assert tmp2 /* == !SetContains<int>(s,3) */;                                                
        s = SetAdd<int>(s,3);                                                                       
        boolean tmp4;                                                                               
        tmp4 = SetContains<int>(s,3);                                                               
        assert tmp4 /* == SetContains<int>(s,3) */;                                                 
        Set<Set<int>> ss;                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void g() {                                                                             
        Set<int> s;                                                                                 
        Set<Set<int>> ss;                                                                           
        s = SetEmpty<int>();                                                                        
        ss = SetEmpty<Set<int>>();                                                                  
        s = SetAdd<int>(s,4);                                                                       
        s = SetAdd<int>(s,5);                                                                       
        s = SetAdd<int>(s,6);                                                                       
        ss = SetAdd<Set<int>>(ss,s);                                                                
        boolean tmp5;                                                                               
        tmp5 = SetContains<Set<int>>(ss,s);                                                         
        assert tmp5 /* == SetContains<Set<int>>(ss,s) */;                                           
        s = SetAdd<int>(s,7);                                                                       
        boolean tmp6;                                                                               
        boolean tmp7;                                                                               
        tmp7 = SetContains<Set<int>>(ss,s);                                                         
        tmp6 = !tmp7;                                                                               
        assert tmp6 /* == !SetContains<Set<int>>(ss,s) */;                                          
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
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
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        Set<int> s;                                                                                 
        s = SetEmpty<int>();                                                                        
        s = SetAdd<int>(s,4);                                                                       
        boolean tmp1;                                                                               
        tmp1 = SetContains<int>(s,4);                                                               
        assert tmp1 /* == SetContains<int>(s,4) */;                                                 
        boolean tmp2;                                                                               
        boolean tmp3;                                                                               
        tmp3 = SetContains<int>(s,3);                                                               
        tmp2 = !tmp3;                                                                               
        assert tmp2 /* == !SetContains<int>(s,3) */;                                                
        s = SetAdd<int>(s,3);                                                                       
        boolean tmp4;                                                                               
        tmp4 = SetContains<int>(s,3);                                                               
        assert tmp4 /* == SetContains<int>(s,3) */;                                                 
        Set<Set<int>> ss;                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void g() {                                                                             
        Set<int> s;                                                                                 
        Set<Set<int>> ss;                                                                           
        s = SetEmpty<int>();                                                                        
        ss = SetEmpty<Set<int>>();                                                                  
        s = SetAdd<int>(s,4);                                                                       
        s = SetAdd<int>(s,5);                                                                       
        s = SetAdd<int>(s,6);                                                                       
        ss = SetAdd<Set<int>>(ss,s);                                                                
        boolean tmp5;                                                                               
        tmp5 = SetContains<Set<int>>(ss,s);                                                         
        assert tmp5 /* == SetContains<Set<int>>(ss,s) */;                                           
        s = SetAdd<int>(s,7);                                                                       
        boolean tmp6;                                                                               
        boolean tmp7;                                                                               
        tmp7 = SetContains<Set<int>>(ss,s);                                                         
        tmp6 = !tmp7;                                                                               
        assert tmp6 /* == !SetContains<Set<int>>(ss,s) */;                                          
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
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
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        Set<int> s;                                                                                 
        s = SetEmpty<int>();                                                                        
        s = SetAdd<int>(s,4);                                                                       
        boolean tmp1;                                                                               
        tmp1 = SetContains<int>(s,4);                                                               
        assert tmp1 /* == SetContains<int>(s,4) */;                                                 
        boolean tmp2;                                                                               
        boolean tmp3;                                                                               
        tmp3 = SetContains<int>(s,3);                                                               
        tmp2 = !tmp3;                                                                               
        assert tmp2 /* == !SetContains<int>(s,3) */;                                                
        s = SetAdd<int>(s,3);                                                                       
        boolean tmp4;                                                                               
        tmp4 = SetContains<int>(s,3);                                                               
        assert tmp4 /* == SetContains<int>(s,3) */;                                                 
        Set<Set<int>> ss;                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void g() {                                                                             
        Set<int> s;                                                                                 
        Set<Set<int>> ss;                                                                           
        s = SetEmpty<int>();                                                                        
        ss = SetEmpty<Set<int>>();                                                                  
        s = SetAdd<int>(s,4);                                                                       
        s = SetAdd<int>(s,5);                                                                       
        s = SetAdd<int>(s,6);                                                                       
        ss = SetAdd<Set<int>>(ss,s);                                                                
        boolean tmp5;                                                                               
        tmp5 = SetContains<Set<int>>(ss,s);                                                         
        assert tmp5 /* == SetContains<Set<int>>(ss,s) */;                                           
        s = SetAdd<int>(s,7);                                                                       
        boolean tmp6;                                                                               
        boolean tmp7;                                                                               
        tmp7 = SetContains<Set<int>>(ss,s);                                                         
        tmp6 = !tmp7;                                                                               
        assert tmp6 /* == !SetContains<Set<int>>(ss,s) */;                                          
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
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (4.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (4.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock);                                                     
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock);                                                      
{                                                                                                   
 var s: Set.int;                                                                                    
 var s894119: Set.int;                                                                              
 var Cow._lock894144: [Cow]Tid;                                                                     
 var tmp2894144: bool;                                                                              
 var $recorded.state894091: int;                                                                    
 var s894091: Set.int;                                                                              
 var tmp1894119: bool;                                                                              
 var Cow._state894119: [Cow]State;                                                                  
 var tmp1894150: bool;                                                                              
 var Cow._lock894119: [Cow]Tid;                                                                     
 var this894091: Cow;                                                                               
 var tmp1: bool;                                                                                    
 var tmp2894119: bool;                                                                              
 var tmp2: bool;                                                                                    
 var Cow._state894144: [Cow]State;                                                                  
 var tid894144: Tid;                                                                                
 var $recorded.state894150: int;                                                                    
 var ss: Set.Set.int;                                                                               
 var this894144: Cow;                                                                               
 var this894119: Cow;                                                                               
 var Cow._lock894150: [Cow]Tid;                                                                     
 var $pc894150: Phase;                                                                              
 var ss894150: Set.Set.int;                                                                         
 var this894150: Cow;                                                                               
 var tmp3894150: bool;                                                                              
 var tmp3894119: bool;                                                                              
 var tid894119: Tid;                                                                                
 var $pc894091: Phase;                                                                              
 var $pc894119: Phase;                                                                              
 var tmp2894150: bool;                                                                              
 var $recorded.state894144: int;                                                                    
 var Cow._state894150: [Cow]State;                                                                  
 var Cow._state894091: [Cow]State;                                                                  
 var tmp1894091: bool;                                                                              
 var tmp1894144: bool;                                                                              
 var tmp3: bool;                                                                                    
 var tmp4: bool;                                                                                    
 var $pc894144: Phase;                                                                              
 var tid894091: Tid;                                                                                
 var tmp4894144: bool;                                                                              
 var s894144: Set.int;                                                                              
 var tmp3894144: bool;                                                                              
 var s894150: Set.int;                                                                              
 var Cow._lock894091: [Cow]Tid;                                                                     
 var $recorded.state894119: int;                                                                    
 var tmp4894150: bool;                                                                              
 var tid894150: Tid;                                                                                
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 5.9: Set<int> s;                                                                                
                                                                                                    
                                                                                                    
 // 6.9: s = SetEmpty<int>();                                                                       
                                                                                                    
 s := SetEmpty.int();                                                                               
                                                                                                    
 // 7.9: s = SetAdd<int>(s,4);                                                                      
                                                                                                    
 s := SetAdd.int(s,4);                                                                              
                                                                                                    
 // 8.9: boolean tmp1;                                                                              
                                                                                                    
                                                                                                    
 // 8.9: tmp1 = SetContains<int>(s,4);                                                              
                                                                                                    
 tmp1 := SetContains.int(s,4);                                                                      
                                                                                                    
 // 8.9: assert tmp1 /* == SetContains<int>(s,4) */;                                                
                                                                                                    
 assume Cow._state894091 == Cow._state && Cow._lock894091 == Cow._lock && tmp1894091 == tmp1 && s894091 == s && this894091 == this && tid894091 == tid;
 assume $recorded.state894091 == 1;                                                                 
 assert tmp1 /* lowered SetContains.int(s,4) */;                                                           // (8.9): This assertion may not hold.
                                                                                                    
 // 9.9: boolean tmp2;                                                                              
                                                                                                    
                                                                                                    
 // 9.9: boolean tmp3;                                                                              
                                                                                                    
                                                                                                    
 // 9.9: tmp3 = SetContains<int>(s,3);                                                              
                                                                                                    
 tmp3 := SetContains.int(s,3);                                                                      
                                                                                                    
 // 9.9: tmp2 = !tmp3;                                                                              
                                                                                                    
 tmp2 := !(tmp3);                                                                                   
                                                                                                    
 // 9.9: assert tmp2 /* == !SetContains<int>(s,3) */;                                               
                                                                                                    
 assume Cow._state894119 == Cow._state && Cow._lock894119 == Cow._lock && tmp3894119 == tmp3 && tmp2894119 == tmp2 && tmp1894119 == tmp1 && s894119 == s && this894119 == this && tid894119 == tid;
 assume $recorded.state894119 == 1;                                                                 
 assert tmp2 /* lowered !(SetContains.int(s,3)) */;                                                        // (9.9): This assertion may not hold.
                                                                                                    
 // 10.9: s = SetAdd<int>(s,3);                                                                     
                                                                                                    
 s := SetAdd.int(s,3);                                                                              
                                                                                                    
 // 11.9: boolean tmp4;                                                                             
                                                                                                    
                                                                                                    
 // 11.9: tmp4 = SetContains<int>(s,3);                                                             
                                                                                                    
 tmp4 := SetContains.int(s,3);                                                                      
                                                                                                    
 // 11.9: assert tmp4 /* == SetContains<int>(s,3) */;                                               
                                                                                                    
 assume Cow._state894144 == Cow._state && Cow._lock894144 == Cow._lock && tmp4894144 == tmp4 && tmp3894144 == tmp3 && tmp2894144 == tmp2 && tmp1894144 == tmp1 && s894144 == s && this894144 == this && tid894144 == tid;
 assume $recorded.state894144 == 1;                                                                 
 assert tmp4 /* lowered SetContains.int(s,3) */;                                                           // (11.9): This assertion may not hold.
                                                                                                    
 // 13.9: Set<Set<int>> ss;                                                                         
                                                                                                    
                                                                                                    
 // 4.21: // return;                                                                                
                                                                                                    
 assume Cow._state894150 == Cow._state && Cow._lock894150 == Cow._lock && ss894150 == ss && tmp4894150 == tmp4 && tmp3894150 == tmp3 && tmp2894150 == tmp2 && tmp1894150 == tmp1 && s894150 == s && this894150 == this && tid894150 == tid;
 assume $recorded.state894150 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.g(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (16.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (16.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock);                                                     
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock);                                                      
{                                                                                                   
 var s: Set.int;                                                                                    
 var s894217: Set.int;                                                                              
 var ss894217: Set.Set.int;                                                                         
 var tmp5: bool;                                                                                    
 var Cow._lock894253: [Cow]Tid;                                                                     
 var $pc894253: Phase;                                                                              
 var tmp6894252: bool;                                                                              
 var $recorded.state894252: int;                                                                    
 var tid894253: Tid;                                                                                
 var this894217: Cow;                                                                               
 var ss894252: Set.Set.int;                                                                         
 var s894252: Set.int;                                                                              
 var s894253: Set.int;                                                                              
 var tid894252: Tid;                                                                                
 var this894253: Cow;                                                                               
 var $recorded.state894253: int;                                                                    
 var ss: Set.Set.int;                                                                               
 var tmp6894253: bool;                                                                              
 var $pc894252: Phase;                                                                              
 var this894252: Cow;                                                                               
 var tmp7894253: bool;                                                                              
 var $pc894217: Phase;                                                                              
 var Cow._state894252: [Cow]State;                                                                  
 var Cow._state894253: [Cow]State;                                                                  
 var tmp7894252: bool;                                                                              
 var Cow._state894217: [Cow]State;                                                                  
 var tmp7: bool;                                                                                    
 var tid894217: Tid;                                                                                
 var tmp5894253: bool;                                                                              
 var tmp5894252: bool;                                                                              
 var tmp6: bool;                                                                                    
 var Cow._lock894252: [Cow]Tid;                                                                     
 var tmp5894217: bool;                                                                              
 var Cow._lock894217: [Cow]Tid;                                                                     
 var ss894253: Set.Set.int;                                                                         
 var $recorded.state894217: int;                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 17.9: Set<int> s;                                                                               
                                                                                                    
                                                                                                    
 // 18.9: Set<Set<int>> ss;                                                                         
                                                                                                    
                                                                                                    
 // 19.9: s = SetEmpty<int>();                                                                      
                                                                                                    
 s := SetEmpty.int();                                                                               
                                                                                                    
 // 20.9: ss = SetEmpty<Set<int>>();                                                                
                                                                                                    
 ss := SetEmpty.Set.int();                                                                          
                                                                                                    
 // 21.9: s = SetAdd<int>(s,4);                                                                     
                                                                                                    
 s := SetAdd.int(s,4);                                                                              
                                                                                                    
 // 22.9: s = SetAdd<int>(s,5);                                                                     
                                                                                                    
 s := SetAdd.int(s,5);                                                                              
                                                                                                    
 // 23.9: s = SetAdd<int>(s,6);                                                                     
                                                                                                    
 s := SetAdd.int(s,6);                                                                              
                                                                                                    
 // 24.9: ss = SetAdd<Set<int>>(ss,s);                                                              
                                                                                                    
 ss := SetAdd.Set.int(ss,s);                                                                        
                                                                                                    
 // 25.9: boolean tmp5;                                                                             
                                                                                                    
                                                                                                    
 // 25.9: tmp5 = SetContains<Set<int>>(ss,s);                                                       
                                                                                                    
 tmp5 := SetContains.Set.int(ss,s);                                                                 
                                                                                                    
 // 25.9: assert tmp5 /* == SetContains<Set<int>>(ss,s) */;                                         
                                                                                                    
 assume Cow._state894217 == Cow._state && Cow._lock894217 == Cow._lock && tmp5894217 == tmp5 && ss894217 == ss && s894217 == s && this894217 == this && tid894217 == tid;
 assume $recorded.state894217 == 1;                                                                 
 assert tmp5 /* lowered SetContains.Set.int(ss,s) */;                                                      // (25.9): This assertion may not hold.
                                                                                                    
 // 26.9: s = SetAdd<int>(s,7);                                                                     
                                                                                                    
 s := SetAdd.int(s,7);                                                                              
                                                                                                    
 // 27.9: boolean tmp6;                                                                             
                                                                                                    
                                                                                                    
 // 27.9: boolean tmp7;                                                                             
                                                                                                    
                                                                                                    
 // 27.9: tmp7 = SetContains<Set<int>>(ss,s);                                                       
                                                                                                    
 tmp7 := SetContains.Set.int(ss,s);                                                                 
                                                                                                    
 // 27.9: tmp6 = !tmp7;                                                                             
                                                                                                    
 tmp6 := !(tmp7);                                                                                   
                                                                                                    
 // 27.9: assert tmp6 /* == !SetContains<Set<int>>(ss,s) */;                                        
                                                                                                    
 assume Cow._state894252 == Cow._state && Cow._lock894252 == Cow._lock && tmp7894252 == tmp7 && tmp6894252 == tmp6 && tmp5894252 == tmp5 && ss894252 == ss && s894252 == s && this894252 == this && tid894252 == tid;
 assume $recorded.state894252 == 1;                                                                 
 assert tmp6 /* lowered !(SetContains.Set.int(ss,s)) */;                                                   // (27.9): This assertion may not hold.
                                                                                                    
 // 16.21: // return;                                                                               
                                                                                                    
 assume Cow._state894253 == Cow._state && Cow._lock894253 == Cow._lock && tmp7894253 == tmp7 && tmp6894253 == tmp6 && tmp5894253 == tmp5 && ss894253 == ss && s894253 == s && this894253 == this && tid894253 == tid;
 assume $recorded.state894253 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow._lock: [Cow]Tid) returns (bool) {     
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow._lock);                                                     
requires ValidTid(tid);                                                                             
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow._lock);                                                      
ensures Y(tid , old(Cow._state), old(Cow._lock) , Cow._state, Cow._lock);                           
                                                                                                    
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow._lock);                                                    
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow._lock)), _N);          
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow._lock);                                   
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow._lock: [Cow]Tid) 
 requires StateInvariant(Cow._state, Cow._lock);                                                    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow._lock);                            
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow._lock);                                                    
 requires StateInvariant(Cow._state_p, Cow._lock_p);                                                
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock , Cow._state_p, Cow._lock_p);                                 
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow._lock_p);                               
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow._lock);                                   
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow._lock))      
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
/// Set.int:                                                                                        
                                                                                                    
type Set.int = [int]bool;                                                                           
                                                                                                    
function {:builtin "MapConst"} mapconstbool.Set.int(bool) : Set.int;                                
function {:builtin "MapAnd"}   mapand.Set.int(Set.int, Set.int) : Set.int;                          
function {:builtin "MapOr"}    mapor.Set.int(Set.int, Set.int) : Set.int;                           
function {:builtin "MapNot"}   mapnot.Set.int(Set.int) : Set.int;                                   
function {:builtin "MapIte"}   mapitebool.Set.int(Set.int, Set.int, Set.int) : Set.int;             
function {:builtin "MapIff"}   mapiff.Set.int(Set.int, Set.int) : Set.int;                          
function {:builtin "MapImp"}   mapimp.Set.int(Set.int, Set.int) : Set.int;                          
                                                                                                    
const SetEmptyConst.int: Set.int;                                                                   
axiom SetEmptyConst.int == mapconstbool.Set.int(false);                                             
                                                                                                    
function {:inline} SetEmpty.int() : Set.int {                                                       
SetEmptyConst.int                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} SetSingleton.int(x: int) : Set.int {                                             
SetEmpty.int()[x := true]                                                                           
}                                                                                                   
                                                                                                    
function {:inline} SetUnion.int(a: Set.int, b: Set.int) : Set.int {                                 
mapor.Set.int(a, b)                                                                                 
}                                                                                                   
                                                                                                    
function {:inline} SetAdd.int(a: Set.int, x: int) : Set.int {                                       
SetUnion.int(a, SetSingleton.int(x))                                                                
}                                                                                                   
                                                                                                    
function {:inline} SetRemove.int(a: Set.int, x: int) : Set.int {                                    
mapand.Set.int(a, mapnot.Set.int(SetEmpty.int())[x := false])                                       
}                                                                                                   
                                                                                                    
function {:inline} SetContains.int(a: Set.int, x: int) : bool {                                     
a[x]                                                                                                
}                                                                                                   
                                                                                                    
function {:inline} SetSubset.int(a: Set.int, b: Set.int) : bool {                                   
(forall x : int :: mapimp.Set.int(a,b)[x])                                                          
}                                                                                                   
                                                                                                    
function {:inline} SetEqual.int(a: Set.int, b: Set.int) : bool {                                    
(forall x : int :: mapiff.Set.int(a,b)[x])                                                          
}                                                                                                   
                                                                                                    
                                                                                                    
/// Set.Set.int:                                                                                    
                                                                                                    
type Set.Set.int = [Set.int]bool;                                                                   
                                                                                                    
function {:builtin "MapConst"} mapconstbool.Set.Set.int(bool) : Set.Set.int;                        
function {:builtin "MapAnd"}   mapand.Set.Set.int(Set.Set.int, Set.Set.int) : Set.Set.int;          
function {:builtin "MapOr"}    mapor.Set.Set.int(Set.Set.int, Set.Set.int) : Set.Set.int;           
function {:builtin "MapNot"}   mapnot.Set.Set.int(Set.Set.int) : Set.Set.int;                       
function {:builtin "MapIte"}   mapitebool.Set.Set.int(Set.Set.int, Set.Set.int, Set.Set.int) : Set.Set.int;
function {:builtin "MapIff"}   mapiff.Set.Set.int(Set.Set.int, Set.Set.int) : Set.Set.int;          
function {:builtin "MapImp"}   mapimp.Set.Set.int(Set.Set.int, Set.Set.int) : Set.Set.int;          
                                                                                                    
const SetEmptyConst.Set.int: Set.Set.int;                                                           
axiom SetEmptyConst.Set.int == mapconstbool.Set.Set.int(false);                                     
                                                                                                    
function {:inline} SetEmpty.Set.int() : Set.Set.int {                                               
SetEmptyConst.Set.int                                                                               
}                                                                                                   
                                                                                                    
function {:inline} SetSingleton.Set.int(x: Set.int) : Set.Set.int {                                 
SetEmpty.Set.int()[x := true]                                                                       
}                                                                                                   
                                                                                                    
function {:inline} SetUnion.Set.int(a: Set.Set.int, b: Set.Set.int) : Set.Set.int {                 
mapor.Set.Set.int(a, b)                                                                             
}                                                                                                   
                                                                                                    
function {:inline} SetAdd.Set.int(a: Set.Set.int, x: Set.int) : Set.Set.int {                       
SetUnion.Set.int(a, SetSingleton.Set.int(x))                                                        
}                                                                                                   
                                                                                                    
function {:inline} SetRemove.Set.int(a: Set.Set.int, x: Set.int) : Set.Set.int {                    
mapand.Set.Set.int(a, mapnot.Set.Set.int(SetEmpty.Set.int())[x := false])                           
}                                                                                                   
                                                                                                    
function {:inline} SetContains.Set.int(a: Set.Set.int, x: Set.int) : bool {                         
a[x]                                                                                                
}                                                                                                   
                                                                                                    
function {:inline} SetSubset.Set.int(a: Set.Set.int, b: Set.Set.int) : bool {                       
(forall x : Set.int :: mapimp.Set.Set.int(a,b)[x])                                                  
}                                                                                                   
                                                                                                    
function {:inline} SetEqual.Set.int(a: Set.Set.int, b: Set.Set.int) : bool {                        
(forall x : Set.int :: mapiff.Set.Set.int(a,b)[x])                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
// 526.1-661.2: (Method:4.5)
// 532.1-532.24: (4.5): Bad tid
// 533.1-533.37: (4.5): this is not global
// 591.2-593.2: (class anchor.sink.VarDeclStmt:5.9)
// 594.2-597.22: (class anchor.sink.Assign:6.9)
// 598.2-601.23: (class anchor.sink.Assign:7.9)
// 602.2-604.2: (class anchor.sink.VarDeclStmt:8.9)
// 605.2-608.31: (class anchor.sink.Assign:8.9)
// 609.2-614.49: (class anchor.sink.Assert:8.9)
// 614.1-614.49: (8.9): This assertion may not hold.
// 615.2-617.2: (class anchor.sink.VarDeclStmt:9.9)
// 618.2-620.2: (class anchor.sink.VarDeclStmt:9.9)
// 621.2-624.31: (class anchor.sink.Assign:9.9)
// 625.2-628.18: (class anchor.sink.Assign:9.9)
// 629.2-634.52: (class anchor.sink.Assert:9.9)
// 634.1-634.52: (9.9): This assertion may not hold.
// 635.2-638.23: (class anchor.sink.Assign:10.9)
// 639.2-641.2: (class anchor.sink.VarDeclStmt:11.9)
// 642.2-645.31: (class anchor.sink.Assign:11.9)
// 646.2-651.49: (class anchor.sink.Assert:11.9)
// 651.1-651.49: (11.9): This assertion may not hold.
// 652.2-654.2: (class anchor.sink.VarDeclStmt:13.9)
// 655.2-660.9: (class anchor.sink.Return:4.21)
// 662.1-789.2: (Method:16.5)
// 668.1-668.24: (16.5): Bad tid
// 669.1-669.37: (16.5): this is not global
// 716.2-718.2: (class anchor.sink.VarDeclStmt:17.9)
// 719.2-721.2: (class anchor.sink.VarDeclStmt:18.9)
// 722.2-725.22: (class anchor.sink.Assign:19.9)
// 726.2-729.27: (class anchor.sink.Assign:20.9)
// 730.2-733.23: (class anchor.sink.Assign:21.9)
// 734.2-737.23: (class anchor.sink.Assign:22.9)
// 738.2-741.23: (class anchor.sink.Assign:23.9)
// 742.2-745.29: (class anchor.sink.Assign:24.9)
// 746.2-748.2: (class anchor.sink.VarDeclStmt:25.9)
// 749.2-752.36: (class anchor.sink.Assign:25.9)
// 753.2-758.54: (class anchor.sink.Assert:25.9)
// 758.1-758.54: (25.9): This assertion may not hold.
// 759.2-762.23: (class anchor.sink.Assign:26.9)
// 763.2-765.2: (class anchor.sink.VarDeclStmt:27.9)
// 766.2-768.2: (class anchor.sink.VarDeclStmt:27.9)
// 769.2-772.36: (class anchor.sink.Assign:27.9)
// 773.2-776.18: (class anchor.sink.Assign:27.9)
// 777.2-782.57: (class anchor.sink.Assert:27.9)
// 782.1-782.57: (27.9): This assertion may not hold.
// 783.2-788.9: (class anchor.sink.Return:16.21)
// 836.1-854.2: (7.32): yields_as clause for Cow._lock is not valid
// 859.1-872.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 878.1-904.2: (7.32): yields_as clause for Cow._lock is not transitive
