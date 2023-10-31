                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/reduction-check-readonly.sink:          
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        t := c.c1;                                                                                  
        t := this.c1;                                                                               
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        c.c1 := t;                                                                                  
        this.c1 := t;                                                                               
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
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
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        t := c.c1;                                                                                  
        t := this.c1;                                                                               
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        c.c1 := t;                                                                                  
        this.c1 := t;                                                                               
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
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
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        t := c.c1;                                                                                  
        t := this.c1;                                                                               
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        c.c1 := t;                                                                                  
        this.c1 := t;                                                                               
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int c1 isLocal(this, tid)                                                                    
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
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
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        t := c.c1;                                                                                  
        t := this.c1;                                                                               
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        Cow c;                                                                                      
        c = new Cow();                                                                              
        int t;                                                                                      
        c.c1 := t;                                                                                  
        this.c1 := t;                                                                               
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
                                                                                                    
var Cow.c1: [Cow]int;                                                                               
                                                                                                    
function {:inline} ReadEval.Cow.c1(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isLocal(Cow._state[this], tid)) then                                                          
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.c1(tid: Tid,this : Cow,newValue: int,Cow._state: [Cow]State,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isLocal(Cow._state[this], tid)) then                                                          
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (6.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (6.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                             
                                                                                                    
ensures StateInvariant(Cow._state, Cow.c1, Cow._lock);                                              
{                                                                                                   
 var c3601633: Cow;                                                                                 
 var $pc3601636: Phase;                                                                             
 var mover3601633: Mover;                                                                           
 var Cow._lock3601633: [Cow]Tid;                                                                    
 var path3601633: int;                                                                              
 var Cow.c13601636: [Cow]int;                                                                       
 var moverPath3601633: MoverPath;                                                                   
 var c3601637: Cow;                                                                                 
 var this3601637: Cow;                                                                              
 var this3601633: Cow;                                                                              
 var tid3601636: Tid;                                                                               
 var mover3601636: Mover;                                                                           
 var path3601636: int;                                                                              
 var $pc3601633: Phase;                                                                             
 var this3601636: Cow;                                                                              
 var t3601633: int;                                                                                 
 var t3601636: int;                                                                                 
 var Cow.c13601633: [Cow]int;                                                                       
 var $recorded.state3601633: int;                                                                   
 var Cow._state3601637: [Cow]State;                                                                 
 var $recorded.state3601636: int;                                                                   
 var Cow._lock3601637: [Cow]Tid;                                                                    
 var $pc3601637: Phase;                                                                             
 var Cow._state3601633: [Cow]State;                                                                 
 var moverPath3601636: MoverPath;                                                                   
 var c3601636: Cow;                                                                                 
 var Cow._lock3601636: [Cow]Tid;                                                                    
 var Cow.c13601637: [Cow]int;                                                                       
 var $recorded.state3601637: int;                                                                   
 var tid3601633: Tid;                                                                               
 var t: int;                                                                                        
 var Cow._state3601636: [Cow]State;                                                                 
 var t3601637: int;                                                                                 
 var tid3601637: Tid;                                                                               
 var c: Cow;                                                                                        
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 7.9: Cow c;                                                                                     
                                                                                                    
                                                                                                    
 // 7.9: c = new Cow();                                                                             
                                                                                                    
 havoc c;                                                                                           
 assume c != Cow.null && isFresh(Cow._state[c]);                                                    
 Cow._state[c] := LOCAL(tid);                                                                       
 assume Cow.c1[c]  == 0;                                                                            
 assume Cow._lock[c]  == Tid.null;                                                                  
                                                                                                    
 // 8.9: int t;                                                                                     
                                                                                                    
                                                                                                    
 // 9.9: t := c.c1;                                                                                 
                                                                                                    
                                                                                                    
 moverPath3601633 := ReadEval.Cow.c1(tid: Tid,c: Cow,Cow._state,Cow.c1,Cow._lock);                  
 mover3601633 := m#moverPath(moverPath3601633);                                                     
 path3601633 := p#moverPath(moverPath3601633);                                                      
 assume Cow._state3601633 == Cow._state && Cow.c13601633 == Cow.c1 && Cow._lock3601633 == Cow._lock && t3601633 == t && c3601633 == c && this3601633 == this && tid3601633 == tid && $pc3601633 == $pc;
 assume $recorded.state3601633 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (9.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3601633);                                                              
 assert $pc != PhaseError;                                                                                 // (9.9): Reduction failure
 t := Cow.c1[c];                                                                                    
                                                                                                    
 // 10.9: t := this.c1;                                                                             
                                                                                                    
                                                                                                    
 moverPath3601636 := ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.c1,Cow._lock);               
 mover3601636 := m#moverPath(moverPath3601636);                                                     
 path3601636 := p#moverPath(moverPath3601636);                                                      
 assume Cow._state3601636 == Cow._state && Cow.c13601636 == Cow.c1 && Cow._lock3601636 == Cow._lock && t3601636 == t && c3601636 == c && this3601636 == this && tid3601636 == tid && $pc3601636 == $pc;
 assume $recorded.state3601636 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (10.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3601636);                                                              
 assert $pc != PhaseError;                                                                                 // (10.9): Reduction failure
 t := Cow.c1[this];                                                                                 
                                                                                                    
 // 6.21: // return;                                                                                
                                                                                                    
 assume Cow._state3601637 == Cow._state && Cow.c13601637 == Cow.c1 && Cow._lock3601637 == Cow._lock && t3601637 == t && c3601637 == c && this3601637 == this && tid3601637 == tid;
 assume $recorded.state3601637 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f2(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (13.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (13.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                             
                                                                                                    
ensures StateInvariant(Cow._state, Cow.c1, Cow._lock);                                              
{                                                                                                   
 var tid3601655: Tid;                                                                               
 var tid3601654: Tid;                                                                               
 var c3601655: Cow;                                                                                 
 var moverPath3601651: MoverPath;                                                                   
 var this3601654: Cow;                                                                              
 var t3601655: int;                                                                                 
 var $pc3601655: Phase;                                                                             
 var path3601651: int;                                                                              
 var path3601654: int;                                                                              
 var c3601651: Cow;                                                                                 
 var this3601651: Cow;                                                                              
 var Cow._lock3601651: [Cow]Tid;                                                                    
 var Cow.c13601651: [Cow]int;                                                                       
 var tid3601651: Tid;                                                                               
 var Cow._state3601654: [Cow]State;                                                                 
 var $recorded.state3601654: int;                                                                   
 var mover3601654: Mover;                                                                           
 var Cow.c13601655: [Cow]int;                                                                       
 var c3601654: Cow;                                                                                 
 var $pc3601654: Phase;                                                                             
 var moverPath3601654: MoverPath;                                                                   
 var Cow._lock3601654: [Cow]Tid;                                                                    
 var $recorded.state3601651: int;                                                                   
 var Cow.c13601654: [Cow]int;                                                                       
 var Cow._state3601655: [Cow]State;                                                                 
 var t3601654: int;                                                                                 
 var mover3601651: Mover;                                                                           
 var Cow._lock3601655: [Cow]Tid;                                                                    
 var t: int;                                                                                        
 var c: Cow;                                                                                        
 var this3601655: Cow;                                                                              
 var t3601651: int;                                                                                 
 var $pc3601651: Phase;                                                                             
 var $recorded.state3601655: int;                                                                   
 var Cow._state3601651: [Cow]State;                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 14.9: Cow c;                                                                                    
                                                                                                    
                                                                                                    
 // 14.9: c = new Cow();                                                                            
                                                                                                    
 havoc c;                                                                                           
 assume c != Cow.null && isFresh(Cow._state[c]);                                                    
 Cow._state[c] := LOCAL(tid);                                                                       
 assume Cow.c1[c]  == 0;                                                                            
 assume Cow._lock[c]  == Tid.null;                                                                  
                                                                                                    
 // 15.9: int t;                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 // 16.9: c.c1 := t;                                                                                
                                                                                                    
                                                                                                    
 moverPath3601651 := WriteEval.Cow.c1(tid: Tid,c: Cow,t: int,Cow._state,Cow.c1,Cow._lock);          
 mover3601651 := m#moverPath(moverPath3601651);                                                     
 path3601651 := p#moverPath(moverPath3601651);                                                      
 assume Cow._state3601651 == Cow._state && Cow.c13601651 == Cow.c1 && Cow._lock3601651 == Cow._lock && t3601651 == t && c3601651 == c && this3601651 == this && tid3601651 == tid && $pc3601651 == $pc;
 assume $recorded.state3601651 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume c != Cow.null;                                                                             
 } else {                                                                                           
  assert c != Cow.null;                                                                                    // (16.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover3601651);                                                              
 assert $pc != PhaseError;                                                                                 // (16.9): Reduction failure
 Cow.c1[c] := t;                                                                                    
                                                                                                    
                                                                                                    
 // 17.9: this.c1 := t;                                                                             
                                                                                                    
                                                                                                    
 moverPath3601654 := WriteEval.Cow.c1(tid: Tid,this: Cow,t: int,Cow._state,Cow.c1,Cow._lock);       
 mover3601654 := m#moverPath(moverPath3601654);                                                     
 path3601654 := p#moverPath(moverPath3601654);                                                      
 assume Cow._state3601654 == Cow._state && Cow.c13601654 == Cow.c1 && Cow._lock3601654 == Cow._lock && t3601654 == t && c3601654 == c && this3601654 == this && tid3601654 == tid && $pc3601654 == $pc;
 assume $recorded.state3601654 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (17.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover3601654);                                                              
 assert $pc != PhaseError;                                                                                 // (17.9): Reduction failure
 Cow.c1[this] := t;                                                                                 
                                                                                                    
 // 13.22: // return;                                                                               
                                                                                                    
 assume Cow._state3601655 == Cow._state && Cow.c13601655 == Cow.c1 && Cow._lock3601655 == Cow._lock && t3601655 == t && c3601655 == c && this3601655 == this && tid3601655 == tid;
 assume $recorded.state3601655 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.c1: [Cow]int,Cow._lock: [Cow]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)               
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Cow.c1_pre: [Cow]int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.c1(u: Tid,x: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.c1 failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Cow.c1_pre: [Cow]int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.c1(u: Tid,x: Cow,Cow._state,Cow.c1,Cow._lock);                            
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): Cow.c1 failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Cow.c1_pre: [Cow]int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.c1[x];                                                                             
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.c1[x] := havocValue;                                                                           
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.c1(u: Tid,x: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.c1 failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Cow.c1_pre: [Cow]int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.c1[x];                                                                             
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.c1(u: Tid,x: Cow,Cow._state,Cow.c1,Cow._lock);                            
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Cow.c1 failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                     
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Cow.c1_pre: [Cow]int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.c1,Cow._lock);                            
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.c1(u: Tid,x: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.c1 failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.c1(t: Tid, u: Tid, v: int, w: int, x: Cow)                      
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.c1;                                                                                   
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Cow.c1_pre: [Cow]int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Cow.c1[x];                                                                             
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.c1,Cow._lock);                            
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.c1[x] := havocValue;                                                                           
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.c1(u: Tid,x: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.c1 failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.c1,Cow._lock);               
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.c1_mid: [Cow]int;                                                                          
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.c1[x];                                                                                 
 Cow.c1[x] := v;                                                                                    
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.c1_mid == Cow.c1 && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.c1[x] := tmpV;                                                                                 
 Cow.c1[y] := w;                                                                                    
 _writeByTPost := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);               
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)   
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Cow.c1_mid: [Cow]int;                                                                          
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.c1[x];                                                                                 
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_mid == Cow._state && Cow.c1_mid == Cow.c1 && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.c1,Cow._lock);               
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.c1[x] := tmpV;                                                                                 
 Cow.c1[y] := w;                                                                                    
 _writeByTPost := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);               
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)  
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.c1,Cow._lock);                            
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.c1(u: Tid,y: Cow,w: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.c1[y] := w;                                                                                    
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.c1(t: Tid,x: Cow,Cow._state,Cow.c1,Cow._lock);                        
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.c1.Cow.c1(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)  
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.c1;                                                                                   
 modifies Cow.c1;                                                                                   
                                                                                                    
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
 var Cow.c1_pre: [Cow]int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.c1_post: [Cow]int;                                                                         
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.c1(u: Tid,y: Cow,Cow._state,Cow.c1,Cow._lock);                            
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.c1(t: Tid,x: Cow,v: int,Cow._state,Cow.c1,Cow._lock);                   
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.c1[x] := v;                                                                                    
 assume Cow._state_post == Cow._state && Cow.c1_post == Cow.c1 && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.c1(u: Tid,y: Cow,Cow._state,Cow.c1,Cow._lock);                        
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                             
requires ValidTid(tid);                                                                             
modifies Cow._state;                                                                                
modifies Cow.c1;                                                                                    
modifies Cow._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow.c1, Cow._lock);                                              
ensures Y(tid , old(Cow._state), old(Cow.c1), old(Cow._lock) , Cow._state, Cow.c1, Cow._lock);      
                                                                                                    
// Cow.c1:                                                                                          
                                                                                                    
function {:inline} Y_Cow.c1(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.c1(tid: Tid,this: Cow,Cow._state,Cow.c1,Cow._lock)), _R)) ==> (Cow.c1[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.c1(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.c1.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Cow.c1_yield: [Cow]int;                                                                         
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.c1(u: Tid,this: Cow,newValue: int,Cow._state,Cow.c1,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.c1(tid, this, newValue , Cow._state, Cow.c1, Cow._lock);                              
}                                                                                                   
                                                                                                    
procedure Y_Cow.c1.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Cow.c1_yield: [Cow]int;                                                                         
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.c1(tid, this, Cow.c1[this] , Cow._state, Cow.c1, Cow._lock);                          
}                                                                                                   
                                                                                                    
procedure Y_Cow.c1.Transitive(tid : Tid, this: Cow, newValue : int , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.c1_p: [Cow]int, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires StateInvariant(Cow._state_p, Cow.c1_p, Cow._lock_p);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.c1_pre: [Cow]int;                                                                           
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
                                                                                                    
var $recorded.state_post: int;                                                                      
var Cow.c1_post: [Cow]int;                                                                          
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.c1, Cow._lock , Cow._state_p, Cow.c1_p, Cow._lock_p);               
 assume Y_Cow.c1(tid, this, newValue , Cow._state_p, Cow.c1_p, Cow._lock_p);                        
assume Cow._state_post == Cow._state_p && Cow.c1_post == Cow.c1_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.c1(tid, this, newValue , Cow._state, Cow.c1, Cow._lock);                              
}                                                                                                   
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.c1,Cow._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Cow.c1_yield: [Cow]int;                                                                         
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow.c1,Cow._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.c1,Cow._lock)), _N);   
assume Cow._state_yield == Cow._state && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.c1, Cow._lock);                           
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Cow.c1_yield: [Cow]int;                                                                         
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.c1_yield == Cow.c1 && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow.c1, Cow._lock);                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.c1_p: [Cow]int, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.c1, Cow._lock);                                            
 requires StateInvariant(Cow._state_p, Cow.c1_p, Cow._lock_p);                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.c1_pre: [Cow]int;                                                                           
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Cow.c1_post: [Cow]int;                                                                          
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.c1_pre == Cow.c1 && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.c1, Cow._lock , Cow._state_p, Cow.c1_p, Cow._lock_p);               
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow.c1_p, Cow._lock_p);                     
assume Cow._state_post == Cow._state_p && Cow.c1_post == Cow.c1_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.c1, Cow._lock);                           
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow.c1: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.c1_p: [Cow]int, Cow._lock_p: [Cow]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow.c1(tid : Tid, this, Cow.c1_p[this] , Cow._state, Cow.c1, Cow._lock))    
 && (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow.c1, Cow._lock))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 470.1-580.2: (Method:6.5)
// 477.1-477.24: (6.5): Bad tid
// 478.1-478.37: (6.5): this is not global
// 524.2-526.2: (class anchor.sink.VarDeclStmt:7.9)
// 527.2-534.35: (class anchor.sink.Alloc:7.9)
// 535.2-537.2: (class anchor.sink.VarDeclStmt:8.9)
// 538.2-555.17: (class anchor.sink.Read:9.9)
// 550.1-550.24: (9.9): Cannot have potential null deference in left-mover part.
// 554.1-554.27: (9.9): Reduction failure
// 556.2-573.20: (class anchor.sink.Read:10.9)
// 568.1-568.27: (10.9): Cannot have potential null deference in left-mover part.
// 572.1-572.27: (10.9): Reduction failure
// 574.2-579.9: (class anchor.sink.Return:6.21)
// 581.1-691.2: (Method:13.5)
// 588.1-588.24: (13.5): Bad tid
// 589.1-589.37: (13.5): this is not global
// 635.2-637.2: (class anchor.sink.VarDeclStmt:14.9)
// 638.2-645.35: (class anchor.sink.Alloc:14.9)
// 646.2-648.2: (class anchor.sink.VarDeclStmt:15.9)
// 650.2-666.17: (class anchor.sink.Write:16.9)
// 662.1-662.24: (16.9): Cannot have potential null deference in left-mover part.
// 665.1-665.27: (16.9): Reduction failure
// 668.2-684.20: (class anchor.sink.Write:17.9)
// 680.1-680.27: (17.9): Cannot have potential null deference in left-mover part.
// 683.1-683.27: (17.9): Reduction failure
// 685.2-690.9: (class anchor.sink.Return:13.22)
// 765.1-765.34: (4.5): Cow.c1 failed Write-Write Right-Mover Check
// 822.1-822.30: (4.5): Cow.c1 failed Write-Read Right-Mover Check
// 883.1-883.34: (4.5): Cow.c1 failed Write-Write Left-Mover Check
// 941.1-941.30: (4.5): Cow.c1 failed Write-Read Left-Mover Check
// 996.1-996.34: (4.5): Cow.c1 failed Read-Write Right-Mover Check
// 1054.1-1054.34: (4.5): Cow.c1 failed Read-Write Left-Mover Check
// 1123.1-1123.140: (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.1)
// 1124.1-1124.101: (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.2)
// 1125.1-1125.158: (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case A.3)
// 1218.1-1218.140: (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case C)
// 1316.1-1316.144: (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case D)
// 1317.1-1317.144: (4.5): Cow.c1 is not Write-Write Stable with respect to Cow.c1 (case R)
// 1386.1-1386.136: (4.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case F)
// 1387.1-1387.136: (4.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case H)
// 1388.1-1388.146: (4.5): Cow.c1 is not Read-Write Stable with respect to Cow.c1 (case I)
// 1456.1-1456.136: (4.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case J)
// 1457.1-1457.136: (4.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case K)
// 1458.1-1458.99: (4.5): Cow.c1 is not Write-Read Stable with respect to Cow.c1 (case L)
// 1489.1-1508.2: (4.5): yields_as clause for Cow.c1 is not valid
// 1513.1-1527.2: (4.5): yields_as clause for Cow.c1 is not reflexive
// 1533.1-1561.2: (4.5): yields_as clause for Cow.c1 is not transitive
// 1581.1-1600.2: (7.32): yields_as clause for Cow._lock is not valid
// 1605.1-1619.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 1625.1-1653.2: (7.32): yields_as clause for Cow._lock is not transitive
