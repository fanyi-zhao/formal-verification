                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/annot-1.sink:                            
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 10;                                                                                     
        boolean z;                                                                                  
        z = x < y;                                                                                  
        if (z) {                                                                                    
          x = 2;                                                                                    
        } else {                                                                                    
          x = 3;                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 10;                                                                                     
        boolean z;                                                                                  
        z = x < y;                                                                                  
        while (z)   {                                                                               
          x = x + 1;                                                                                
          z = x < y;                                                                                
        }                                                                                           
        y = 6;                                                                                      
        assert false;                                                                               
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 10;                                                                                     
        boolean z;                                                                                  
        z = x < y;                                                                                  
        if (z) {                                                                                    
          x = 2;                                                                                    
        } else {                                                                                    
          x = 3;                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 10;                                                                                     
        boolean z;                                                                                  
        z = x < y;                                                                                  
        while (z)   {                                                                               
          x = x + 1;                                                                                
          z = x < y;                                                                                
        }                                                                                           
        y = 6;                                                                                      
        assert false;                                                                               
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 10;                                                                                     
        boolean z;                                                                                  
        z = x < y;                                                                                  
        if (z) {                                                                                    
          x = 2;                                                                                    
        } else {                                                                                    
          x = 3;                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 10;                                                                                     
        boolean z;                                                                                  
        z = x < y;                                                                                  
        while (z)   {                                                                               
          x = x + 1;                                                                                
          z = x < y;                                                                                
        }                                                                                           
        y = 6;                                                                                      
        assert false;                                                                               
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 10;                                                                                     
        boolean z;                                                                                  
        z = x < y;                                                                                  
        if (z) {                                                                                    
          x = 2;                                                                                    
        } else {                                                                                    
          x = 3;                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        int x;                                                                                      
        x = 0;                                                                                      
        int y;                                                                                      
        y = 10;                                                                                     
        boolean z;                                                                                  
        z = x < y;                                                                                  
        while (z)   {                                                                               
          x = x + 1;                                                                                
          z = x < y;                                                                                
        }                                                                                           
        y = 6;                                                                                      
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
 var Cow._lock95162: [Cow]Tid;                                                                      
 var $recorded.state95162: int;                                                                     
 var x: int;                                                                                        
 var tid95162: Tid;                                                                                 
 var Cow._state95162: [Cow]State;                                                                   
 var y: int;                                                                                        
 var $pc95162: Phase;                                                                               
 var y95162: int;                                                                                   
 var this95162: Cow;                                                                                
 var z: bool;                                                                                       
 var x95162: int;                                                                                   
 var z95162: bool;                                                                                  
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 5.8: int x;                                                                                     
                                                                                                    
                                                                                                    
 // 5.16: x = 0;                                                                                    
                                                                                                    
 x := 0;                                                                                            
                                                                                                    
 // 6.8: int y;                                                                                     
                                                                                                    
                                                                                                    
 // 6.16: y = 10;                                                                                   
                                                                                                    
 y := 10;                                                                                           
                                                                                                    
 // 7.8: boolean z;                                                                                 
                                                                                                    
                                                                                                    
 // 7.22: z = x < y;                                                                                
                                                                                                    
 z := (x<y);                                                                                        
 if (z) {                                                                                           
                                                                                                    
  // 9.16: x = 2;                                                                                   
                                                                                                    
  x := 2;                                                                                           
 } else {                                                                                           
                                                                                                    
  // 11.16: x = 3;                                                                                  
                                                                                                    
  x := 3;                                                                                           
 }                                                                                                  
                                                                                                    
 // 4.21: // return;                                                                                
                                                                                                    
 assume Cow._state95162 == Cow._state && Cow._lock95162 == Cow._lock && z95162 == z && y95162 == y && x95162 == x && this95162 == this && tid95162 == tid;
 assume $recorded.state95162 == 1;                                                                  
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f2(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (15.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (15.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock);                                                     
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock);                                                      
{                                                                                                   
 var Cow._lock95203_bottom: [Cow]Tid;                                                               
 var x: int;                                                                                        
 var this95203_bottom: Cow;                                                                         
 var tid95210: Tid;                                                                                 
 var x95211: int;                                                                                   
 var phase95203: Phase;                                                                             
 var z95203: bool;                                                                                  
 var y95211: int;                                                                                   
 var Cow._state95203: [Cow]State;                                                                   
 var $recorded.state95203: int;                                                                     
 var $recorded.state95203_bottom: int;                                                              
 var $recorded.state95211: int;                                                                     
 var $pc95211: Phase;                                                                               
 var y95203: int;                                                                                   
 var $pc95203: Phase;                                                                               
 var x95203: int;                                                                                   
 var x95210: int;                                                                                   
 var Cow._lock95211: [Cow]Tid;                                                                      
 var this95211: Cow;                                                                                
 var Cow._lock95203: [Cow]Tid;                                                                      
 var y: int;                                                                                        
 var tid95211: Tid;                                                                                 
 var $recorded.state95210: int;                                                                     
 var $pc95203_bottom: Phase;                                                                        
 var x95203_bottom: int;                                                                            
 var tid95203_bottom: Tid;                                                                          
 var y95210: int;                                                                                   
 var Cow._state95210: [Cow]State;                                                                   
 var this95203: Cow;                                                                                
 var Cow._state95211: [Cow]State;                                                                   
 var z: bool;                                                                                       
 var tid95203: Tid;                                                                                 
 var z95210: bool;                                                                                  
 var y95203_bottom: int;                                                                            
 var Cow._lock95210: [Cow]Tid;                                                                      
 var this95210: Cow;                                                                                
 var z95211: bool;                                                                                  
 var $pc95210: Phase;                                                                               
 var z95203_bottom: bool;                                                                           
 var Cow._state95203_bottom: [Cow]State;                                                            
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 16.8: int x;                                                                                    
                                                                                                    
                                                                                                    
 // 16.16: x = 0;                                                                                   
                                                                                                    
 x := 0;                                                                                            
                                                                                                    
 // 17.8: int y;                                                                                    
                                                                                                    
                                                                                                    
 // 17.16: y = 10;                                                                                  
                                                                                                    
 y := 10;                                                                                           
                                                                                                    
 // 18.8: boolean z;                                                                                
                                                                                                    
                                                                                                    
 // 18.22: z = x < y;                                                                               
                                                                                                    
 z := (x<y);                                                                                        
 assume Cow._state95203 == Cow._state && Cow._lock95203 == Cow._lock && z95203 == z && y95203 == y && x95203 == x && this95203 == this && tid95203 == tid;
 assume $recorded.state95203 == 1;                                                                  
                                                                                                    
 // 19.8: while (z)   {                                                                             
                                                                                                    
 phase95203 := $pc;                                                                                 
 while (z)                                                                                          
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (15.5): Bad tid
  invariant isShared(Cow._state[this]);                                                                    // (15.5): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow._lock);                                                  
  invariant phase95203 == $pc;                                                                             // (19.8): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (19.8): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 20.18: x = x + 1;                                                                              
                                                                                                    
  x := (x+1);                                                                                       
                                                                                                    
  // 21.18: z = x < y;                                                                              
                                                                                                    
  z := (x<y);                                                                                       
  assume Cow._state95203_bottom == Cow._state && Cow._lock95203_bottom == Cow._lock && z95203_bottom == z && y95203_bottom == y && x95203_bottom == x && this95203_bottom == this && tid95203_bottom == tid;
  assume $recorded.state95203_bottom == 1;                                                          
  assert phase95203 == $pc;                                                                                // (19.8): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 23.13: y = 6;                                                                                   
                                                                                                    
 y := 6;                                                                                            
                                                                                                    
 // 24.9: assert false;                                                                             
                                                                                                    
 assume Cow._state95210 == Cow._state && Cow._lock95210 == Cow._lock && z95210 == z && y95210 == y && x95210 == x && this95210 == this && tid95210 == tid;
 assume $recorded.state95210 == 1;                                                                  
 assert false;                                                                                             // (24.9): This assertion may not hold.
                                                                                                    
 // 15.22: // return;                                                                               
                                                                                                    
 assume Cow._state95211 == Cow._state && Cow._lock95211 == Cow._lock && z95211 == z && y95211 == y && x95211 == x && this95211 == this && tid95211 == tid;
 assume $recorded.state95211 == 1;                                                                  
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
                                                                                                    
                                                                                                    
// 468.1-536.2: (Method:4.5)
// 474.1-474.24: (4.5): Bad tid
// 475.1-475.37: (4.5): this is not global
// 498.2-500.2: (class anchor.sink.VarDeclStmt:5.8)
// 501.2-504.9: (class anchor.sink.Assign:5.16)
// 505.2-507.2: (class anchor.sink.VarDeclStmt:6.8)
// 508.2-511.10: (class anchor.sink.Assign:6.16)
// 512.2-514.2: (class anchor.sink.VarDeclStmt:7.8)
// 515.2-518.13: (class anchor.sink.Assign:7.22)
// 520.3-523.10: (class anchor.sink.Assign:9.16)
// 525.3-528.10: (class anchor.sink.Assign:11.16)
// 530.2-535.9: (class anchor.sink.Return:4.21)
// 537.1-659.2: (Method:15.5)
// 543.1-543.24: (15.5): Bad tid
// 544.1-544.37: (15.5): this is not global
// 595.2-597.2: (class anchor.sink.VarDeclStmt:16.8)
// 598.2-601.9: (class anchor.sink.Assign:16.16)
// 602.2-604.2: (class anchor.sink.VarDeclStmt:17.8)
// 605.2-608.10: (class anchor.sink.Assign:17.16)
// 609.2-611.2: (class anchor.sink.VarDeclStmt:18.8)
// 612.2-615.13: (class anchor.sink.Assign:18.22)
// 618.2-622.11: (class anchor.sink.While:19.8)
// 624.1-624.27: (15.5): Bad tid
// 625.1-625.40: (15.5): this is not global
// 628.1-628.31: (19.8): Phase must be invariant at loop head
// 629.1-629.30: (19.8): Potentially infinite loop cannot be in post-commit phase.
// 631.3-634.14: (class anchor.sink.Assign:20.18)
// 635.3-638.14: (class anchor.sink.Assign:21.18)
// 641.1-641.28: (19.8): Phase must be invariant at loop head
// 643.2-646.9: (class anchor.sink.Assign:23.13)
// 647.2-652.15: (class anchor.sink.Assert:24.9)
// 652.1-652.15: (24.9): This assertion may not hold.
// 653.2-658.9: (class anchor.sink.Return:15.22)
// 706.1-724.2: (7.32): yields_as clause for Cow._lock is not valid
// 729.1-742.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 748.1-774.2: (7.32): yields_as clause for Cow._lock is not transitive
