                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/lock-path-bad.sink:                     
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int x holds(this.y, tid) ? B : E                                                             
                                                                                                    
       Cow y N                                                                                      
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        assume this.y != Cow.null;                                                                  
        int xx;                                                                                     
        xx = 0;                                                                                     
        Cow y;                                                                                      
        y := this.y;                                                                                
        yield;                                                                                      
        synchronized (y) {                                                                          
          this.x := xx;                                                                             
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int x holds(this.y, tid) ? B : E                                                             
                                                                                                    
       Cow y N                                                                                      
                                                                                                    
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
        assume this.y != Cow.null;                                                                  
        int xx;                                                                                     
        xx = 0;                                                                                     
        Cow y;                                                                                      
        y := this.y;                                                                                
        yield;                                                                                      
        {                                                                                           
          acquire(y);                                                                               
          {                                                                                         
            this.x := xx;                                                                           
          }                                                                                         
          release(y);                                                                               
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int x holds(this.y, tid) ? B : E                                                             
                                                                                                    
       Cow y N                                                                                      
                                                                                                    
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
        assume this.y != Cow.null;                                                                  
        int xx;                                                                                     
        xx = 0;                                                                                     
        Cow y;                                                                                      
        y := this.y;                                                                                
        yield;                                                                                      
        {                                                                                           
          acquire(y);                                                                               
          {                                                                                         
            this.x := xx;                                                                           
          }                                                                                         
          release(y);                                                                               
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int x holds(this.y, tid) ? B : E                                                             
                                                                                                    
       Cow y N                                                                                      
                                                                                                    
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
        assume this.y != Cow.null;                                                                  
        int xx;                                                                                     
        xx = 0;                                                                                     
        Cow y;                                                                                      
        y := this.y;                                                                                
        yield;                                                                                      
        {                                                                                           
          acquire(y);                                                                               
          {                                                                                         
            this.x := xx;                                                                           
          }                                                                                         
          release(y);                                                                               
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
                                                                                                    
var Cow.x: [Cow]int;                                                                                
                                                                                                    
function {:inline} ReadEval.Cow.x(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if ((isAccessible(Cow._state[Cow.y[this]], tid) && Cow._lock[Cow.y[this]] == tid)) then            
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.x(tid: Tid,this : Cow,newValue: int,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(Cow._state[Cow.y[this]], tid) && Cow._lock[Cow.y[this]] == tid)) then            
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow.y: [Cow]Cow;                                                                                
                                                                                                    
function {:inline} ReadEval.Cow.y(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Cow.null;                                                                         
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.y(tid: Tid,this : Cow,newValue: Cow,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
modifies Cow.x;                                                                                     
modifies Cow.y;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (8.2): Bad tid
requires isShared(Cow._state[this]);                                                                       // (8.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                       
                                                                                                    
ensures StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                        
{                                                                                                   
 var $recorded.state2402909: int;                                                                   
 var Cow.x2402909: [Cow]int;                                                                        
 var Cow._state2402914: [Cow]State;                                                                 
 var tid2402903: Tid;                                                                               
 var $recorded.state2402904: int;                                                                   
 var Cow.y2402904_post: [Cow]Cow;                                                                   
 var $pc2402903: Phase;                                                                             
 var y2402904_post: Cow;                                                                            
 var y2402909: Cow;                                                                                 
 var this2402903: Cow;                                                                              
 var this2402914: Cow;                                                                              
 var this2402904_post: Cow;                                                                         
 var Cow.x2402904: [Cow]int;                                                                        
 var Cow.y2402904: [Cow]Cow;                                                                        
 var mover2402909: Mover;                                                                           
 var xx2402914: int;                                                                                
 var $recorded.state2402914: int;                                                                   
 var y2402903: Cow;                                                                                 
 var Cow._lock2402909: [Cow]Tid;                                                                    
 var y2402904: Cow;                                                                                 
 var this2402909: Cow;                                                                              
 var Cow._lock2402914: [Cow]Tid;                                                                    
 var xx2402904_post: int;                                                                           
 var Cow.y2402909: [Cow]Cow;                                                                        
 var tid2402904_post: Tid;                                                                          
 var $recorded.state2402904_post: int;                                                              
 var Cow.x2402903: [Cow]int;                                                                        
 var Cow.y2402903: [Cow]Cow;                                                                        
 var $pc2402904_post: Phase;                                                                        
 var Cow.x2402904_post: [Cow]int;                                                                   
 var $pc2402914: Phase;                                                                             
 var path2402903: int;                                                                              
 var Cow._state2402909: [Cow]State;                                                                 
 var xx: int;                                                                                       
 var Cow.x2402914: [Cow]int;                                                                        
 var Cow._lock2402904: [Cow]Tid;                                                                    
 var $pc2402909: Phase;                                                                             
 var Cow._state2402903: [Cow]State;                                                                 
 var Cow.y2402914: [Cow]Cow;                                                                        
 var Cow._lock2402904_post: [Cow]Tid;                                                               
 var Cow._lock2402903: [Cow]Tid;                                                                    
 var moverPath2402909: MoverPath;                                                                   
 var y: Cow;                                                                                        
 var this2402904: Cow;                                                                              
 var tid2402904: Tid;                                                                               
 var path2402909: int;                                                                              
 var y2402914: Cow;                                                                                 
 var Cow._state2402904_post: [Cow]State;                                                            
 var tid2402914: Tid;                                                                               
 var moverPath2402903: MoverPath;                                                                   
 var xx2402909: int;                                                                                
 var xx2402904: int;                                                                                
 var tid2402909: Tid;                                                                               
 var xx2402903: int;                                                                                
 var mover2402903: Mover;                                                                           
 var $recorded.state2402903: int;                                                                   
 var $pc2402904: Phase;                                                                             
 var Cow._state2402904: [Cow]State;                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 9.6: assume this.y != Cow.null;                                                                 
                                                                                                    
 assume (Cow.y[this]!=Cow.null);                                                                    
                                                                                                    
 // 10.3: int xx;                                                                                   
                                                                                                    
                                                                                                    
 // 10.12: xx = 0;                                                                                  
                                                                                                    
 xx := 0;                                                                                           
                                                                                                    
 // 11.3: Cow y;                                                                                    
                                                                                                    
                                                                                                    
 // 11.3: y := this.y;                                                                              
                                                                                                    
                                                                                                    
 moverPath2402903 := ReadEval.Cow.y(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 mover2402903 := m#moverPath(moverPath2402903);                                                     
 path2402903 := p#moverPath(moverPath2402903);                                                      
 assume Cow._state2402903 == Cow._state && Cow.x2402903 == Cow.x && Cow.y2402903 == Cow.y && Cow._lock2402903 == Cow._lock && y2402903 == y && xx2402903 == xx && this2402903 == this && tid2402903 == tid && $pc2402903 == $pc;
 assume $recorded.state2402903 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (11.3): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2402903);                                                              
 assert $pc != PhaseError;                                                                                 // (11.3): Reduction failure
 y := Cow.y[this];                                                                                  
                                                                                                    
 // 12.3: yield;                                                                                    
                                                                                                    
 assume Cow._state2402904 == Cow._state && Cow.x2402904 == Cow.x && Cow.y2402904 == Cow.y && Cow._lock2402904 == Cow._lock && y2402904 == y && xx2402904 == xx && this2402904 == this && tid2402904 == tid;
 assume $recorded.state2402904 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2402904_post == Cow._state && Cow.x2402904_post == Cow.x && Cow.y2402904_post == Cow.y && Cow._lock2402904_post == Cow._lock && y2402904_post == y && xx2402904_post == xx && this2402904_post == this && tid2402904_post == tid;
 assume $recorded.state2402904_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume y != Cow.null;                                                                             
 } else {                                                                                           
  assert y != Cow.null;                                                                                    // (13.16): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[y] == Tid.null;                                                                   
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (13.16): Reduction failure
 Cow._lock[y] := tid;                                                                               
                                                                                                    
                                                                                                    
 // 14.4: this.x := xx;                                                                             
                                                                                                    
                                                                                                    
 moverPath2402909 := WriteEval.Cow.x(tid: Tid,this: Cow,xx: int,Cow._state,Cow.x,Cow.y,Cow._lock);  
 mover2402909 := m#moverPath(moverPath2402909);                                                     
 path2402909 := p#moverPath(moverPath2402909);                                                      
 assume Cow._state2402909 == Cow._state && Cow.x2402909 == Cow.x && Cow.y2402909 == Cow.y && Cow._lock2402909 == Cow._lock && y2402909 == y && xx2402909 == xx && this2402909 == this && tid2402909 == tid && $pc2402909 == $pc;
 assume $recorded.state2402909 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (14.4): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2402909);                                                              
 assert $pc != PhaseError;                                                                                 // (14.4): Reduction failure
 Cow.x[this] := xx;                                                                                 
 if ($pc == PreCommit) {                                                                            
  assume y != Cow.null;                                                                             
 } else {                                                                                           
  assert y != Cow.null;                                                                                    // (15.3): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[y] == tid;                                                                               // (15.3): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (15.3): Reduction failure
 Cow._lock[y] := Tid.null;                                                                          
                                                                                                    
 // 8.18: // return;                                                                                
                                                                                                    
 assume Cow._state2402914 == Cow._state && Cow.x2402914 == Cow.x && Cow.y2402914 == Cow.y && Cow._lock2402914 == Cow._lock && y2402914 == y && xx2402914 == xx && this2402914 == this && tid2402914 == tid;
 assume $recorded.state2402914 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.x: [Cow]int,Cow.y: [Cow]Cow,Cow._lock: [Cow]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Cow ::  (isShared(Cow._state[_i]) ==> isSharedAssignable(Cow._state[Cow.y[_i]]))) &&  
  (forall _i: Cow ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Cow._state[_i],_t) ==> isLocalAssignable(Cow._state[Cow.y[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.2): Cow.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.x(u: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.2): Cow.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.x[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.2): Cow.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                  
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.x(u: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.2): Cow.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.2): Cow.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                       
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Cow.x[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.x[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.2): Cow.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.y[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.y(u: Tid,x: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.2): Cow.y failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.y[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.y(u: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.2): Cow.y failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.y[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.y[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.y(u: Tid,x: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.2): Cow.y failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                  
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.y[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.y(u: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.2): Cow.y failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.y(u: Tid,x: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.2): Cow.y failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, x: Cow)                       
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume w == Cow.y[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.y[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.y(u: Tid,x: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.2): Cow.y failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Cow.x is not Write-Write Stable with respect to Cow.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Cow.x is not Write-Write Stable with respect to Cow.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Cow.x is not Write-Write Stable with respect to Cow.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Cow.x is not Read-Write Stable with respect to Cow.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Cow.x is not Read-Write Stable with respect to Cow.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Cow.x is not Read-Write Stable with respect to Cow.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Cow.x is not Write-Read Stable with respect to Cow.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Cow.x is not Write-Read Stable with respect to Cow.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.2): Cow.x is not Write-Read Stable with respect to Cow.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.x.Cow.y(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.x.Cow.y(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var w0_pre: Cow;                                                                                   
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Cow.x is not Write-Write Stable with respect to Cow.y (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.x.Cow.y(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var w0_pre: Cow;                                                                                   
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Cow.x is not Write-Write Stable with respect to Cow.y (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.2): Cow.x is not Write-Write Stable with respect to Cow.y (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.x.Cow.y(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.y[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Cow.x is not Read-Write Stable with respect to Cow.y (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Cow.x is not Read-Write Stable with respect to Cow.y (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.2): Cow.x is not Read-Write Stable with respect to Cow.y (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.x.Cow.y(t: Tid, u: Tid, v: int, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.y(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.y(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.2): Cow.y is not Write-Read Stable with respect to Cow.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.2): Cow.y is not Write-Read Stable with respect to Cow.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.2): Cow.y is not Write-Read Stable with respect to Cow.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.y.Cow.x(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.y[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.y.Cow.x(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.y[x];                                                                                  
 Cow.y[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.y[x] := tmpV;                                                                                  
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Cow.y is not Write-Write Stable with respect to Cow.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.y.Cow.x(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.y[x];                                                                                  
 Cow.y[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.y[x] := tmpV;                                                                                  
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Cow.y is not Write-Write Stable with respect to Cow.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Cow.y is not Write-Write Stable with respect to Cow.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.y.Cow.x(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Cow.y is not Read-Write Stable with respect to Cow.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Cow.y is not Read-Write Stable with respect to Cow.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Cow.y is not Read-Write Stable with respect to Cow.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.y.Cow.x(t: Tid, u: Tid, v: Cow, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var Cow.y_post: [Cow]Cow;                                                                          
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.y[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Cow.x is not Write-Read Stable with respect to Cow.y (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.2): Cow.x is not Write-Read Stable with respect to Cow.y (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.2): Cow.x is not Write-Read Stable with respect to Cow.y (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.y.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.y[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.y.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.y[x];                                                                                  
 Cow.y[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.y[x] := tmpV;                                                                                  
 Cow.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Cow.y is not Write-Write Stable with respect to Cow.y (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.y.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var Cow.y_mid: [Cow]Cow;                                                                           
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.y[x];                                                                                  
 Cow.y[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow.y_mid == Cow.y && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.y[x] := tmpV;                                                                                  
 Cow.y[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Cow.y is not Write-Write Stable with respect to Cow.y (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Cow.y is not Write-Write Stable with respect to Cow.y (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.y.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.y(u: Tid,y: Cow,w: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.y[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.y(t: Tid,x: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Cow.y is not Read-Write Stable with respect to Cow.y (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Cow.y is not Read-Write Stable with respect to Cow.y (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Cow.y is not Read-Write Stable with respect to Cow.y (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.y.Cow.y(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.y;                                                                                    
 modifies Cow.y;                                                                                    
                                                                                                    
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
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.y_pre: [Cow]Cow;                                                                           
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Cow.y_post: [Cow]Cow;                                                                          
 var w_post: Cow;                                                                                   
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.y(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.y(t: Tid,x: Cow,v: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.y[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow.y_post == Cow.y && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.y(u: Tid,y: Cow,Cow._state,Cow.x,Cow.y,Cow._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.2): Cow.y is not Write-Read Stable with respect to Cow.y (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.2): Cow.y is not Write-Read Stable with respect to Cow.y (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.2): Cow.y is not Write-Read Stable with respect to Cow.y (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                       
requires ValidTid(tid);                                                                             
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow.y;                                                                                     
modifies Cow._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                        
ensures Y(tid , old(Cow._state), old(Cow.x), old(Cow.y), old(Cow._lock) , Cow._state, Cow.x, Cow.y, Cow._lock);
                                                                                                    
// Cow.x:                                                                                           
                                                                                                    
function {:inline} Y_Cow.x(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)), _R)) ==> (Cow.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.x(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.x(u: Tid,this: Cow,newValue: int,Cow._state,Cow.x,Cow.y,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.x(tid, this, newValue , Cow._state, Cow.x, Cow.y, Cow._lock);                         
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.x(tid, this, Cow.x[this] , Cow._state, Cow.x, Cow.y, Cow._lock);                      
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Transitive(tid : Tid, this: Cow, newValue : int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.x_p: [Cow]int, Cow.y_p: [Cow]Cow, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires StateInvariant(Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p);                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Cow.y_pre: [Cow]Cow;                                                                            
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Cow.y_post: [Cow]Cow;                                                                           
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.x, Cow.y, Cow._lock , Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p); 
 assume Y_Cow.x(tid, this, newValue , Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p);                 
assume Cow._state_post == Cow._state_p && Cow.x_post == Cow.x_p && Cow.y_post == Cow.y_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.x(tid, this, newValue , Cow._state, Cow.x, Cow.y, Cow._lock);                         
}                                                                                                   
// Cow.y:                                                                                           
                                                                                                    
function {:inline} Y_Cow.y(tid : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.y(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)), _R)) ==> (Cow.y[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.y(tid : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.y.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Cow;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.y(u: Tid,this: Cow,newValue: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.y(tid, this, newValue , Cow._state, Cow.x, Cow.y, Cow._lock);                         
}                                                                                                   
                                                                                                    
procedure Y_Cow.y.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.y(tid, this, Cow.y[this] , Cow._state, Cow.x, Cow.y, Cow._lock);                      
}                                                                                                   
                                                                                                    
procedure Y_Cow.y.Transitive(tid : Tid, this: Cow, newValue : Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.x_p: [Cow]int, Cow.y_p: [Cow]Cow, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires StateInvariant(Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p);                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: Cow;                                                                              
var Cow.y_pre: [Cow]Cow;                                                                            
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
                                                                                                    
var newValue_post: Cow;                                                                             
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Cow.y_post: [Cow]Cow;                                                                           
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.x, Cow.y, Cow._lock , Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p); 
 assume Y_Cow.y(tid, this, newValue , Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p);                 
assume Cow._state_post == Cow._state_p && Cow.x_post == Cow.x_p && Cow.y_post == Cow.y_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.y(tid, this, newValue , Cow._state, Cow.x, Cow.y, Cow._lock);                         
}                                                                                                   
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
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
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow.x,Cow.y,Cow._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.x,Cow.y,Cow._lock)), _N);
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.x, Cow.y, Cow._lock);                     
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.y_yield: [Cow]Cow;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow.y_yield == Cow.y && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow.x, Cow.y, Cow._lock);              
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.x_p: [Cow]int, Cow.y_p: [Cow]Cow, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow.y, Cow._lock);                                      
 requires StateInvariant(Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p);                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow.y_pre: [Cow]Cow;                                                                            
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Cow.y_post: [Cow]Cow;                                                                           
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow.y_pre == Cow.y && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.x, Cow.y, Cow._lock , Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p); 
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow.x_p, Cow.y_p, Cow._lock_p);             
assume Cow._state_post == Cow._state_p && Cow.x_post == Cow.x_p && Cow.y_post == Cow.y_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.x, Cow.y, Cow._lock);                     
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow.y: [Cow]Cow, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.x_p: [Cow]int, Cow.y_p: [Cow]Cow, Cow._lock_p: [Cow]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow.x(tid : Tid, this, Cow.x_p[this] , Cow._state, Cow.x, Cow.y, Cow._lock))
 && (forall this: Cow :: Y_Cow.y(tid : Tid, this, Cow.y_p[this] , Cow._state, Cow.x, Cow.y, Cow._lock))
 && (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow.x, Cow.y, Cow._lock))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 444.1-605.2: (Method:8.2)
// 452.1-452.24: (8.2): Bad tid
// 453.1-453.37: (8.2): this is not global
// 522.2-525.33: (class anchor.sink.Assume:9.6)
// 526.2-528.2: (class anchor.sink.VarDeclStmt:10.3)
// 529.2-532.10: (class anchor.sink.Assign:10.12)
// 533.2-535.2: (class anchor.sink.VarDeclStmt:11.3)
// 536.2-553.19: (class anchor.sink.Read:11.3)
// 548.1-548.27: (11.3): Cannot have potential null deference in left-mover part.
// 552.1-552.27: (11.3): Reduction failure
// 554.2-562.42: (class anchor.sink.Yield:12.3)
// 566.1-566.24: (13.16): Cannot have potential null deference in left-mover part.
// 570.1-570.27: (13.16): Reduction failure
// 573.2-589.20: (class anchor.sink.Write:14.4)
// 585.1-585.27: (14.4): Cannot have potential null deference in left-mover part.
// 588.1-588.27: (14.4): Reduction failure
// 593.1-593.24: (15.3): Cannot have potential null deference in left-mover part.
// 595.1-595.29: (15.3): lock not held
// 597.1-597.27: (15.3): Reduction failure
// 599.2-604.9: (class anchor.sink.Return:8.18)
// 683.1-683.34: (4.2): Cow.x failed Write-Write Right-Mover Check
// 742.1-742.30: (4.2): Cow.x failed Write-Read Right-Mover Check
// 805.1-805.34: (4.2): Cow.x failed Write-Write Left-Mover Check
// 865.1-865.30: (4.2): Cow.x failed Write-Read Left-Mover Check
// 922.1-922.34: (4.2): Cow.x failed Read-Write Right-Mover Check
// 982.1-982.34: (4.2): Cow.x failed Read-Write Left-Mover Check
// 1041.1-1041.34: (5.2): Cow.y failed Write-Write Right-Mover Check
// 1100.1-1100.30: (5.2): Cow.y failed Write-Read Right-Mover Check
// 1163.1-1163.34: (5.2): Cow.y failed Write-Write Left-Mover Check
// 1223.1-1223.30: (5.2): Cow.y failed Write-Read Left-Mover Check
// 1280.1-1280.34: (5.2): Cow.y failed Read-Write Right-Mover Check
// 1340.1-1340.34: (5.2): Cow.y failed Read-Write Left-Mover Check
// 1411.1-1411.140: (4.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.1)
// 1412.1-1412.101: (4.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.2)
// 1413.1-1413.158: (4.2): Cow.x is not Write-Write Stable with respect to Cow.x (case A.3)
// 1509.1-1509.140: (4.2): Cow.x is not Write-Write Stable with respect to Cow.x (case C)
// 1610.1-1610.144: (4.2): Cow.x is not Write-Write Stable with respect to Cow.x (case D)
// 1611.1-1611.144: (4.2): Cow.x is not Write-Write Stable with respect to Cow.x (case R)
// 1682.1-1682.136: (4.2): Cow.x is not Read-Write Stable with respect to Cow.x (case F)
// 1683.1-1683.136: (4.2): Cow.x is not Read-Write Stable with respect to Cow.x (case H)
// 1684.1-1684.146: (4.2): Cow.x is not Read-Write Stable with respect to Cow.x (case I)
// 1754.1-1754.136: (4.2): Cow.x is not Write-Read Stable with respect to Cow.x (case J)
// 1755.1-1755.136: (4.2): Cow.x is not Write-Read Stable with respect to Cow.x (case K)
// 1756.1-1756.99: (4.2): Cow.x is not Write-Read Stable with respect to Cow.x (case L)
// 1828.1-1828.140: (5.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.1)
// 1829.1-1829.101: (5.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.2)
// 1830.1-1830.158: (5.2): Cow.y is not Write-Write Stable with respect to Cow.x (case A.3)
// 1926.1-1926.140: (4.2): Cow.x is not Write-Write Stable with respect to Cow.y (case C)
// 2027.1-2027.144: (4.2): Cow.x is not Write-Write Stable with respect to Cow.y (case D)
// 2028.1-2028.144: (4.2): Cow.x is not Write-Write Stable with respect to Cow.y (case R)
// 2099.1-2099.136: (4.2): Cow.x is not Read-Write Stable with respect to Cow.y (case F)
// 2100.1-2100.136: (4.2): Cow.x is not Read-Write Stable with respect to Cow.y (case H)
// 2101.1-2101.146: (4.2): Cow.x is not Read-Write Stable with respect to Cow.y (case I)
// 2171.1-2171.136: (5.2): Cow.y is not Write-Read Stable with respect to Cow.x (case J)
// 2172.1-2172.136: (5.2): Cow.y is not Write-Read Stable with respect to Cow.x (case K)
// 2173.1-2173.99: (5.2): Cow.y is not Write-Read Stable with respect to Cow.x (case L)
// 2245.1-2245.140: (4.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.1)
// 2246.1-2246.101: (4.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.2)
// 2247.1-2247.158: (4.2): Cow.x is not Write-Write Stable with respect to Cow.y (case A.3)
// 2343.1-2343.140: (5.2): Cow.y is not Write-Write Stable with respect to Cow.x (case C)
// 2444.1-2444.144: (5.2): Cow.y is not Write-Write Stable with respect to Cow.x (case D)
// 2445.1-2445.144: (5.2): Cow.y is not Write-Write Stable with respect to Cow.x (case R)
// 2516.1-2516.136: (5.2): Cow.y is not Read-Write Stable with respect to Cow.x (case F)
// 2517.1-2517.136: (5.2): Cow.y is not Read-Write Stable with respect to Cow.x (case H)
// 2518.1-2518.146: (5.2): Cow.y is not Read-Write Stable with respect to Cow.x (case I)
// 2588.1-2588.136: (4.2): Cow.x is not Write-Read Stable with respect to Cow.y (case J)
// 2589.1-2589.136: (4.2): Cow.x is not Write-Read Stable with respect to Cow.y (case K)
// 2590.1-2590.99: (4.2): Cow.x is not Write-Read Stable with respect to Cow.y (case L)
// 2662.1-2662.140: (5.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.1)
// 2663.1-2663.101: (5.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.2)
// 2664.1-2664.158: (5.2): Cow.y is not Write-Write Stable with respect to Cow.y (case A.3)
// 2760.1-2760.140: (5.2): Cow.y is not Write-Write Stable with respect to Cow.y (case C)
// 2861.1-2861.144: (5.2): Cow.y is not Write-Write Stable with respect to Cow.y (case D)
// 2862.1-2862.144: (5.2): Cow.y is not Write-Write Stable with respect to Cow.y (case R)
// 2933.1-2933.136: (5.2): Cow.y is not Read-Write Stable with respect to Cow.y (case F)
// 2934.1-2934.136: (5.2): Cow.y is not Read-Write Stable with respect to Cow.y (case H)
// 2935.1-2935.146: (5.2): Cow.y is not Read-Write Stable with respect to Cow.y (case I)
// 3005.1-3005.136: (5.2): Cow.y is not Write-Read Stable with respect to Cow.y (case J)
// 3006.1-3006.136: (5.2): Cow.y is not Write-Read Stable with respect to Cow.y (case K)
// 3007.1-3007.99: (5.2): Cow.y is not Write-Read Stable with respect to Cow.y (case L)
// 3039.1-3059.2: (4.2): yields_as clause for Cow.x is not valid
// 3064.1-3079.2: (4.2): yields_as clause for Cow.x is not reflexive
// 3085.1-3115.2: (4.2): yields_as clause for Cow.x is not transitive
// 3134.1-3154.2: (5.2): yields_as clause for Cow.y is not valid
// 3159.1-3174.2: (5.2): yields_as clause for Cow.y is not reflexive
// 3180.1-3210.2: (5.2): yields_as clause for Cow.y is not transitive
// 3230.1-3250.2: (7.32): yields_as clause for Cow._lock is not valid
// 3255.1-3270.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 3276.1-3306.2: (7.32): yields_as clause for Cow._lock is not transitive
