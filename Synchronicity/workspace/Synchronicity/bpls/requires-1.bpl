                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/requires-1.sink:                        
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
                                                                                                    
    }                                                                                               
    class Inc {                                                                                     
       int x N                                                                                      
                                                                                                    
      invariant  this.x != 0;                                                                       
                                                                                                    
      requires d != Cow.null;                                                                       
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc(Cow d) {                                                                      
        assert d == Cow.null;                                                                       
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
      requires d != Cow.null;                                                                       
      requires d == Cow.null;                                                                       
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2(Cow d) {                                                                     
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
      requires isLocal(d, tid);                                                                     
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc3(Cow d) {                                                                     
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
      requires !isShared(this);                                                                     
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc4(Cow d) {                                                                     
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
      requires this.x > 0;                                                                          
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc5(Cow d) {                                                                     
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
      requires this.x == 0;                                                                         
      {                                                                                             
                                                                                                    
      }                                                                                             
      public int inc6(Cow d) {                                                                      
         return 3;                                                                                  
        // return -1;                                                                               
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
                                                                                                    
                                                                                                    
    }                                                                                               
    class Inc {                                                                                     
       int x N                                                                                      
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.x != 0;                                                                       
                                                                                                    
      requires d != Cow.null;                                                                       
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc(Cow d) {                                                                      
        assert d == Cow.null;                                                                       
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires d != Cow.null;                                                                       
      requires d == Cow.null;                                                                       
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2(Cow d) {                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires isLocal(d, tid);                                                                     
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc3(Cow d) {                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires !isShared(this);                                                                     
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc4(Cow d) {                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires this.x > 0;                                                                          
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc5(Cow d) {                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires this.x == 0;                                                                         
      {                                                                                             
                                                                                                    
      }                                                                                             
      public int inc6(Cow d) {                                                                      
        {                                                                                           
           return 3;                                                                                
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
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
                                                                                                    
                                                                                                    
    }                                                                                               
    class Inc {                                                                                     
       int x N                                                                                      
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.x != 0;                                                                       
                                                                                                    
      requires d != Cow.null;                                                                       
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc(Cow d) {                                                                      
        assert d == Cow.null;                                                                       
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires d != Cow.null;                                                                       
      requires d == Cow.null;                                                                       
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2(Cow d) {                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires isLocal(d, tid);                                                                     
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc3(Cow d) {                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires !isShared(this);                                                                     
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc4(Cow d) {                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires this.x > 0;                                                                          
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc5(Cow d) {                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires this.x == 0;                                                                         
      {                                                                                             
                                                                                                    
      }                                                                                             
      public int inc6(Cow d) {                                                                      
        {                                                                                           
           return 3;                                                                                
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
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
                                                                                                    
                                                                                                    
    }                                                                                               
    class Inc {                                                                                     
       int x N                                                                                      
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.x != 0;                                                                       
                                                                                                    
      requires d != Cow.null;                                                                       
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc(Cow d) {                                                                      
        assert d == Cow.null;                                                                       
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires d != Cow.null;                                                                       
      requires d == Cow.null;                                                                       
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2(Cow d) {                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires isLocal(d, tid);                                                                     
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc3(Cow d) {                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires !isShared(this);                                                                     
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc4(Cow d) {                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires this.x > 0;                                                                          
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc5(Cow d) {                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires this.x == 0;                                                                         
      {                                                                                             
                                                                                                    
      }                                                                                             
      public int inc6(Cow d) {                                                                      
        {                                                                                           
           return 3;                                                                                
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
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
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl Inc ***/                                                                            
                                                                                                    
type Inc;                                                                                           
const unique Inc.null: Inc;                                                                         
var Inc._state: [Inc]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc.x: [Inc]int;                                                                                
                                                                                                    
function {:inline} ReadEval.Inc.x(tid: Tid,this : Inc,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc.x(tid: Tid,this : Inc,newValue: int,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc._lock: [Inc]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Inc._lock(tid: Tid,this : Inc,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Inc._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Inc._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Inc._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc._lock(tid: Tid,this : Inc,newValue: Tid,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Inc._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Inc._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
function {:inline} Invariant.Inc.3643175(tid: Tid,this : Inc,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (bool) {
 (Inc.x[this]!=0)                                                                                   
}                                                                                                   
                                                                                                    
/////                                                                                               
procedure  Inc.inc.CheckConsistency(tid:Tid, this : Inc, d : Cow)                                   
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (13.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (13.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (13.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires (d!=Cow.null);                                                                             
                                                                                                    
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (13.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (13.2): Object invariant may not hold.
{ assert false; }                                                                                          // (15.9): Method has inconsistent requirements.
                                                                                                    
                                                                                                    
                                                                                                    
procedure  Inc.inc(tid:Tid, this : Inc, d : Cow)                                                    
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (13.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (13.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (13.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires (d!=Cow.null);                                                                             
                                                                                                    
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (13.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (13.2): Object invariant may not hold.
{                                                                                                   
 var this3643422: Inc;                                                                              
 var Cow._lock3643422: [Cow]Tid;                                                                    
 var d3643422: Cow;                                                                                 
 var $pc3643422: Phase;                                                                             
 var tid3643422: Tid;                                                                               
 var $recorded.state3643421: int;                                                                   
 var Cow._lock3643421: [Cow]Tid;                                                                    
 var this3643421: Inc;                                                                              
 var Inc._state3643422: [Inc]State;                                                                 
 var $recorded.state3643422: int;                                                                   
 var tid3643421: Tid;                                                                               
 var Inc.x3643421: [Inc]int;                                                                        
 var Inc.x3643422: [Inc]int;                                                                        
 var Inc._state3643421: [Inc]State;                                                                 
 var Cow._state3643421: [Cow]State;                                                                 
 var $pc3643421: Phase;                                                                             
 var Inc._lock3643422: [Inc]Tid;                                                                    
 var Inc._lock3643421: [Inc]Tid;                                                                    
 var Cow._state3643422: [Cow]State;                                                                 
 var d3643421: Cow;                                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
 assert true;                                                                                              // (13.13): Can only have right-mover memory accesses in requires clause
                                                                                                    
                                                                                                    
 // 16.6: assert d == Cow.null;                                                                     
                                                                                                    
 assume Cow._state3643421 == Cow._state && Cow._lock3643421 == Cow._lock && Inc._state3643421 == Inc._state && Inc.x3643421 == Inc.x && Inc._lock3643421 == Inc._lock && d3643421 == d && this3643421 == this && tid3643421 == tid;
 assume $recorded.state3643421 == 1;                                                                
 assert (d==Cow.null);                                                                                     // (16.6): This assertion may not hold.
                                                                                                    
 // 15.26: // return;                                                                               
                                                                                                    
 assume Cow._state3643422 == Cow._state && Cow._lock3643422 == Cow._lock && Inc._state3643422 == Inc._state && Inc.x3643422 == Inc.x && Inc._lock3643422 == Inc._lock && d3643422 == d && this3643422 == this && tid3643422 == tid;
 assume $recorded.state3643422 == 1;                                                                
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (15.26): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
procedure  Inc.inc2.CheckConsistency(tid:Tid, this : Inc, d : Cow)                                  
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (19.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (19.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (19.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires (d!=Cow.null);                                                                             
                                                                                                    
requires (d==Cow.null);                                                                             
                                                                                                    
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (19.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (19.2): Object invariant may not hold.
{ assert false; }                                                                                          // (21.9): Method has inconsistent requirements.
                                                                                                    
                                                                                                    
                                                                                                    
procedure  Inc.inc2(tid:Tid, this : Inc, d : Cow)                                                   
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (19.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (19.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (19.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires (d!=Cow.null);                                                                             
                                                                                                    
requires (d==Cow.null);                                                                             
                                                                                                    
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (19.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (19.2): Object invariant may not hold.
{                                                                                                   
 var this3643426: Inc;                                                                              
 var d3643426: Cow;                                                                                 
 var Inc._lock3643426: [Inc]Tid;                                                                    
 var $pc3643426: Phase;                                                                             
 var tid3643426: Tid;                                                                               
 var Inc._state3643426: [Inc]State;                                                                 
 var Inc.x3643426: [Inc]int;                                                                        
 var Cow._state3643426: [Cow]State;                                                                 
 var Cow._lock3643426: [Cow]Tid;                                                                    
 var $recorded.state3643426: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
 assert true;                                                                                              // (19.13): Can only have right-mover memory accesses in requires clause
 assert true;                                                                                              // (20.13): Can only have right-mover memory accesses in requires clause
                                                                                                    
                                                                                                    
 // 21.27: // return;                                                                               
                                                                                                    
 assume Cow._state3643426 == Cow._state && Cow._lock3643426 == Cow._lock && Inc._state3643426 == Inc._state && Inc.x3643426 == Inc.x && Inc._lock3643426 == Inc._lock && d3643426 == d && this3643426 == this && tid3643426 == tid;
 assume $recorded.state3643426 == 1;                                                                
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (21.27): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
procedure  Inc.inc3.CheckConsistency(tid:Tid, this : Inc, d : Cow)                                  
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (25.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (25.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (25.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires isLocal(Cow._state[d], tid);                                                               
                                                                                                    
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (25.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (25.2): Object invariant may not hold.
{ assert false; }                                                                                          // (26.9): Method has inconsistent requirements.
                                                                                                    
                                                                                                    
                                                                                                    
procedure  Inc.inc3(tid:Tid, this : Inc, d : Cow)                                                   
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (25.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (25.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (25.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires isLocal(Cow._state[d], tid);                                                               
                                                                                                    
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (25.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (25.2): Object invariant may not hold.
{                                                                                                   
 var Inc._lock3643430: [Inc]Tid;                                                                    
 var Cow._lock3643430: [Cow]Tid;                                                                    
 var $pc3643430: Phase;                                                                             
 var $recorded.state3643430: int;                                                                   
 var Cow._state3643430: [Cow]State;                                                                 
 var this3643430: Inc;                                                                              
 var tid3643430: Tid;                                                                               
 var Inc._state3643430: [Inc]State;                                                                 
 var d3643430: Cow;                                                                                 
 var Inc.x3643430: [Inc]int;                                                                        
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
 assert true;                                                                                              // (25.11): Can only have right-mover memory accesses in requires clause
                                                                                                    
                                                                                                    
 // 26.27: // return;                                                                               
                                                                                                    
 assume Cow._state3643430 == Cow._state && Cow._lock3643430 == Cow._lock && Inc._state3643430 == Inc._state && Inc.x3643430 == Inc.x && Inc._lock3643430 == Inc._lock && d3643430 == d && this3643430 == this && tid3643430 == tid;
 assume $recorded.state3643430 == 1;                                                                
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (26.27): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
procedure  Inc.inc4.CheckConsistency(tid:Tid, this : Inc, d : Cow)                                  
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (30.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (30.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (30.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires !(isShared(Inc._state[this]));                                                             
                                                                                                    
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (30.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (30.2): Object invariant may not hold.
{ assert false; }                                                                                          // (31.9): Method has inconsistent requirements.
                                                                                                    
                                                                                                    
                                                                                                    
procedure  Inc.inc4(tid:Tid, this : Inc, d : Cow)                                                   
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (30.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (30.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (30.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires !(isShared(Inc._state[this]));                                                             
                                                                                                    
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (30.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (30.2): Object invariant may not hold.
{                                                                                                   
 var d3643434: Cow;                                                                                 
 var Cow._lock3643434: [Cow]Tid;                                                                    
 var this3643434: Inc;                                                                              
 var Cow._state3643434: [Cow]State;                                                                 
 var tid3643434: Tid;                                                                               
 var $pc3643434: Phase;                                                                             
 var $recorded.state3643434: int;                                                                   
 var Inc.x3643434: [Inc]int;                                                                        
 var Inc._lock3643434: [Inc]Tid;                                                                    
 var Inc._state3643434: [Inc]State;                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
 assert true;                                                                                              // (30.11): Can only have right-mover memory accesses in requires clause
                                                                                                    
                                                                                                    
 // 31.27: // return;                                                                               
                                                                                                    
 assume Cow._state3643434 == Cow._state && Cow._lock3643434 == Cow._lock && Inc._state3643434 == Inc._state && Inc.x3643434 == Inc.x && Inc._lock3643434 == Inc._lock && d3643434 == d && this3643434 == this && tid3643434 == tid;
 assume $recorded.state3643434 == 1;                                                                
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (31.27): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
procedure  Inc.inc5.CheckConsistency(tid:Tid, this : Inc, d : Cow)                                  
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (35.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (35.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (35.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires (Inc.x[this]>0);                                                                           
                                                                                                    
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (35.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (35.2): Object invariant may not hold.
{ assert false; }                                                                                          // (36.9): Method has inconsistent requirements.
                                                                                                    
                                                                                                    
                                                                                                    
procedure  Inc.inc5(tid:Tid, this : Inc, d : Cow)                                                   
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (35.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (35.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (35.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires (Inc.x[this]>0);                                                                           
                                                                                                    
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (35.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (35.2): Object invariant may not hold.
{                                                                                                   
 var $pc3643438: Phase;                                                                             
 var tid3643438: Tid;                                                                               
 var $recorded.state3643438: int;                                                                   
 var Cow._state3643438: [Cow]State;                                                                 
 var Inc._lock3643438: [Inc]Tid;                                                                    
 var d3643438: Cow;                                                                                 
 var Inc.x3643438: [Inc]int;                                                                        
 var this3643438: Inc;                                                                              
 var Inc._state3643438: [Inc]State;                                                                 
 var Cow._lock3643438: [Cow]Tid;                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
 assert true && leq(m#moverPath(ReadEval.Inc.x(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)),_R);       // (35.18): Can only have right-mover memory accesses in requires clause
                                                                                                    
                                                                                                    
 // 36.27: // return;                                                                               
                                                                                                    
 assume Cow._state3643438 == Cow._state && Cow._lock3643438 == Cow._lock && Inc._state3643438 == Inc._state && Inc.x3643438 == Inc.x && Inc._lock3643438 == Inc._lock && d3643438 == d && this3643438 == this && tid3643438 == tid;
 assume $recorded.state3643438 == 1;                                                                
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (36.27): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
procedure  Inc.inc6.CheckConsistency(tid:Tid, this : Inc, d : Cow)                                  
returns ($result : int)                                                                             
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (40.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (40.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (40.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires (Inc.x[this]==0);                                                                          
                                                                                                    
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (40.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (40.2): Object invariant may not hold.
{ assert false; }                                                                                          // (40.2): Method has inconsistent requirements.
                                                                                                    
                                                                                                    
                                                                                                    
procedure  Inc.inc6(tid:Tid, this : Inc, d : Cow)                                                   
returns ($result : int)                                                                             
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (40.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (40.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (40.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires (Inc.x[this]==0);                                                                          
                                                                                                    
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (40.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (40.2): Object invariant may not hold.
{                                                                                                   
 var $recorded.state3643448: int;                                                                   
 var $recorded.state3643444: int;                                                                   
 var Inc.x3643448: [Inc]int;                                                                        
 var Cow._lock3643444: [Cow]Tid;                                                                    
 var $pc3643448: Phase;                                                                             
 var this3643444: Inc;                                                                              
 var Cow._state3643444: [Cow]State;                                                                 
 var Cow._state3643448: [Cow]State;                                                                 
 var $result3643448: int;                                                                           
 var Inc._state3643448: [Inc]State;                                                                 
 var d3643444: Cow;                                                                                 
 var Inc._lock3643448: [Inc]Tid;                                                                    
 var Inc.x3643444: [Inc]int;                                                                        
 var Cow._lock3643448: [Cow]Tid;                                                                    
 var $result3643444: int;                                                                           
 var tid3643444: Tid;                                                                               
 var $pc3643444: Phase;                                                                             
 var this3643448: Inc;                                                                              
 var Inc._state3643444: [Inc]State;                                                                 
 var Inc._lock3643444: [Inc]Tid;                                                                    
 var tid3643448: Tid;                                                                               
 var d3643448: Cow;                                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
 assert true && leq(m#moverPath(ReadEval.Inc.x(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)),_R);       // (40.18): Can only have right-mover memory accesses in requires clause
                                                                                                    
                                                                                                    
 // 42.9:  return 3;                                                                                
                                                                                                    
 assume Cow._state3643444 == Cow._state && Cow._lock3643444 == Cow._lock && Inc._state3643444 == Inc._state && Inc.x3643444 == Inc.x && Inc._lock3643444 == Inc._lock && $result3643444 == $result && d3643444 == d && this3643444 == this && tid3643444 == tid;
 assume $recorded.state3643444 == 1;                                                                
 $result := 3;                                                                                      
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (42.9): Object invariant may not hold.
 return;                                                                                            
                                                                                                    
 // 41.26: // return -1;                                                                            
                                                                                                    
 assume Cow._state3643448 == Cow._state && Cow._lock3643448 == Cow._lock && Inc._state3643448 == Inc._state && Inc.x3643448 == Inc.x && Inc._lock3643448 == Inc._lock && $result3643448 == $result && d3643448 == d && this3643448 == this && tid3643448 == tid;
 assume $recorded.state3643448 == 1;                                                                
 $result := -1;                                                                                     
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (41.26): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Inc  :: _i == Inc.null <==> isNull(Inc._state[_i])) &&                                
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (9.5): Inc.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                 
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Inc.x(u: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (9.5): Inc.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                 
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Inc.x[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (9.5): Inc.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                  
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Inc.x(u: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (9.5): Inc.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                      
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (9.5): Inc.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                       
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Inc.x[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Inc.x[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (9.5): Inc.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.x;                                                                                    
                                                                                                    
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
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.x;                                                                                    
                                                                                                    
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
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc._state_mid: [Inc]State;                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.x[x];                                                                                  
 Inc.x[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.x[x] := tmpV;                                                                                  
 Inc.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)     
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.x;                                                                                    
                                                                                                    
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
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc._state_mid: [Inc]State;                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.x[x];                                                                                  
 Inc.x[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.x[x] := tmpV;                                                                                  
 Inc.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.x;                                                                                    
                                                                                                    
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
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);         
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.x(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);     
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Inc.x is not Read-Write Stable with respect to Inc.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Inc.x is not Read-Write Stable with respect to Inc.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): Inc.x is not Read-Write Stable with respect to Inc.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.x;                                                                                    
 modifies Inc.x;                                                                                    
                                                                                                    
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
 var Inc.x_pre: [Inc]int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.x(u: Tid,y: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);         
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.x(u: Tid,y: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock);     
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): Inc.x is not Write-Read Stable with respect to Inc.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): Inc.x is not Write-Read Stable with respect to Inc.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (9.5): Inc.x is not Write-Read Stable with respect to Inc.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                       
requires ValidTid(tid);                                                                             
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (<undefined position>): Object invariant may not hold.
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                        
ensures Y(tid , old(Cow._state), old(Cow._lock), old(Inc._state), old(Inc.x), old(Inc._lock) , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)), _N);
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);     
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires StateInvariant(Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);            
 requires ValidTid(tid);                                                                            
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (5.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);     
}                                                                                                   
// Inc.x:                                                                                           
                                                                                                    
function {:inline} Y_Inc.x(tid : Tid, this: Inc, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc.x(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)), _R)) ==> (Inc.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.x(tid : Tid, this: Inc, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc.x.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc.x(u: Tid,this: Inc,newValue: int,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.x(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);         
}                                                                                                   
                                                                                                    
procedure Y_Inc.x.Reflexive(tid : Tid, this: Inc , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.x(tid, this, Inc.x[this] , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);      
}                                                                                                   
                                                                                                    
procedure Y_Inc.x.Transitive(tid : Tid, this: Inc, newValue : int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires StateInvariant(Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);            
 requires ValidTid(tid);                                                                            
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (9.11): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);
 assume Y_Inc.x(tid, this, newValue , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc.x(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);         
}                                                                                                   
// Inc._lock:                                                                                       
                                                                                                    
function {:inline} Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)), _R)) ==> (Inc._lock[this] == newValue))
 &&(((Inc._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc._lock(u: Tid,this: Inc,newValue: Tid,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)));
 assume leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock)), _N);
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);     
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Reflexive(tid : Tid, this: Inc , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, Inc._lock[this] , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Transitive(tid : Tid, this: Inc, newValue : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);                      
 requires StateInvariant(Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);            
 requires ValidTid(tid);                                                                            
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.3643175(tid: Tid,_this : Inc,Cow._state,Cow._lock,Inc._state,Inc.x,Inc._lock));       // (7.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);
 assume Y_Inc._lock(tid, this, newValue , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.x_p, Inc._lock_p);
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc._lock(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock);     
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock))
 && (forall this: Inc :: Y_Inc.x(tid : Tid, this, Inc.x_p[this] , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock))
 && (forall this: Inc :: Y_Inc._lock(tid : Tid, this, Inc._lock_p[this] , Cow._state, Cow._lock, Inc._state, Inc.x, Inc._lock))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
 && (forall _i : Inc :: isShared(Inc._state[_i]) ==> isShared(Inc._state_p[_i]))                    
 && (forall _i : Inc :: isLocal(Inc._state[_i], tid) <==> isLocal(Inc._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 720.1-800.2: (Method:13.2)
// 727.1-727.24: (13.2): Bad tid
// 728.1-728.44: (13.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 729.1-729.37: (13.2): this is not global
// 734.1-734.199: (13.2): Object invariant may not hold.
// 737.1-737.198: (13.2): Object invariant may not hold.
// 738.1-738.18: (15.9): Method has inconsistent requirements.
// 749.1-749.24: (13.2): Bad tid
// 750.1-750.44: (13.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 751.1-751.37: (13.2): this is not global
// 756.1-756.199: (13.2): Object invariant may not hold.
// 759.1-759.198: (13.2): Object invariant may not hold.
// 785.1-785.14: (13.13): Can only have right-mover memory accesses in requires clause
// 787.2-792.23: (class anchor.sink.Assert:16.6)
// 792.1-792.23: (16.6): This assertion may not hold.
// 793.2-799.9: (class anchor.sink.Return:15.26)
// 798.1-798.198: (15.26): Object invariant may not hold.
// 801.1-870.2: (Method:19.2)
// 808.1-808.24: (19.2): Bad tid
// 809.1-809.44: (19.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 810.1-810.37: (19.2): this is not global
// 817.1-817.199: (19.2): Object invariant may not hold.
// 820.1-820.198: (19.2): Object invariant may not hold.
// 821.1-821.18: (21.9): Method has inconsistent requirements.
// 832.1-832.24: (19.2): Bad tid
// 833.1-833.44: (19.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 834.1-834.37: (19.2): this is not global
// 841.1-841.199: (19.2): Object invariant may not hold.
// 844.1-844.198: (19.2): Object invariant may not hold.
// 860.1-860.14: (19.13): Can only have right-mover memory accesses in requires clause
// 861.1-861.14: (20.13): Can only have right-mover memory accesses in requires clause
// 863.2-869.9: (class anchor.sink.Return:21.27)
// 868.1-868.198: (21.27): Object invariant may not hold.
// 871.1-935.2: (Method:25.2)
// 878.1-878.24: (25.2): Bad tid
// 879.1-879.44: (25.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 880.1-880.37: (25.2): this is not global
// 885.1-885.199: (25.2): Object invariant may not hold.
// 888.1-888.198: (25.2): Object invariant may not hold.
// 889.1-889.18: (26.9): Method has inconsistent requirements.
// 900.1-900.24: (25.2): Bad tid
// 901.1-901.44: (25.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 902.1-902.37: (25.2): this is not global
// 907.1-907.199: (25.2): Object invariant may not hold.
// 910.1-910.198: (25.2): Object invariant may not hold.
// 926.1-926.14: (25.11): Can only have right-mover memory accesses in requires clause
// 928.2-934.9: (class anchor.sink.Return:26.27)
// 933.1-933.198: (26.27): Object invariant may not hold.
// 936.1-1000.2: (Method:30.2)
// 943.1-943.24: (30.2): Bad tid
// 944.1-944.44: (30.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 945.1-945.37: (30.2): this is not global
// 950.1-950.199: (30.2): Object invariant may not hold.
// 953.1-953.198: (30.2): Object invariant may not hold.
// 954.1-954.18: (31.9): Method has inconsistent requirements.
// 965.1-965.24: (30.2): Bad tid
// 966.1-966.44: (30.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 967.1-967.37: (30.2): this is not global
// 972.1-972.199: (30.2): Object invariant may not hold.
// 975.1-975.198: (30.2): Object invariant may not hold.
// 991.1-991.14: (30.11): Can only have right-mover memory accesses in requires clause
// 993.2-999.9: (class anchor.sink.Return:31.27)
// 998.1-998.198: (31.27): Object invariant may not hold.
// 1001.1-1065.2: (Method:35.2)
// 1008.1-1008.24: (35.2): Bad tid
// 1009.1-1009.44: (35.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 1010.1-1010.37: (35.2): this is not global
// 1015.1-1015.199: (35.2): Object invariant may not hold.
// 1018.1-1018.198: (35.2): Object invariant may not hold.
// 1019.1-1019.18: (36.9): Method has inconsistent requirements.
// 1030.1-1030.24: (35.2): Bad tid
// 1031.1-1031.44: (35.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 1032.1-1032.37: (35.2): this is not global
// 1037.1-1037.199: (35.2): Object invariant may not hold.
// 1040.1-1040.198: (35.2): Object invariant may not hold.
// 1056.1-1056.121: (35.18): Can only have right-mover memory accesses in requires clause
// 1058.2-1064.9: (class anchor.sink.Return:36.27)
// 1063.1-1063.198: (36.27): Object invariant may not hold.
// 1066.1-1153.2: (Method:40.2)
// 1074.1-1074.24: (40.2): Bad tid
// 1075.1-1075.44: (40.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 1076.1-1076.37: (40.2): this is not global
// 1081.1-1081.199: (40.2): Object invariant may not hold.
// 1084.1-1084.198: (40.2): Object invariant may not hold.
// 1085.1-1085.18: (40.2): Method has inconsistent requirements.
// 1097.1-1097.24: (40.2): Bad tid
// 1098.1-1098.44: (40.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 1099.1-1099.37: (40.2): this is not global
// 1104.1-1104.199: (40.2): Object invariant may not hold.
// 1107.1-1107.198: (40.2): Object invariant may not hold.
// 1135.1-1135.121: (40.18): Can only have right-mover memory accesses in requires clause
// 1137.2-1144.9: (class anchor.sink.Return:42.9)
// 1143.1-1143.198: (42.9): Object invariant may not hold.
// 1145.2-1152.9: (class anchor.sink.Return:41.26)
// 1151.1-1151.198: (41.26): Object invariant may not hold.
// 1232.1-1232.34: (9.5): Inc.x failed Write-Write Right-Mover Check
// 1293.1-1293.30: (9.5): Inc.x failed Write-Read Right-Mover Check
// 1358.1-1358.34: (9.5): Inc.x failed Write-Write Left-Mover Check
// 1420.1-1420.30: (9.5): Inc.x failed Write-Read Left-Mover Check
// 1479.1-1479.34: (9.5): Inc.x failed Read-Write Right-Mover Check
// 1541.1-1541.34: (9.5): Inc.x failed Read-Write Left-Mover Check
// 1614.1-1614.140: (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.1)
// 1615.1-1615.101: (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.2)
// 1616.1-1616.158: (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.3)
// 1715.1-1715.140: (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case C)
// 1819.1-1819.144: (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case D)
// 1820.1-1820.144: (9.5): Inc.x is not Write-Write Stable with respect to Inc.x (case R)
// 1893.1-1893.136: (9.5): Inc.x is not Read-Write Stable with respect to Inc.x (case F)
// 1894.1-1894.136: (9.5): Inc.x is not Read-Write Stable with respect to Inc.x (case H)
// 1895.1-1895.146: (9.5): Inc.x is not Read-Write Stable with respect to Inc.x (case I)
// 1967.1-1967.136: (9.5): Inc.x is not Write-Read Stable with respect to Inc.x (case J)
// 1968.1-1968.136: (9.5): Inc.x is not Write-Read Stable with respect to Inc.x (case K)
// 1969.1-1969.99: (9.5): Inc.x is not Write-Read Stable with respect to Inc.x (case L)
// 1976.1-1976.199: (<undefined position>): Object invariant may not hold.
// 1984.1-1984.198: (<undefined position>): Object invariant may not hold.
// 2005.1-2026.2: (7.32): yields_as clause for Cow._lock is not valid
// 2031.1-2047.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 2053.1-2053.199: (5.1): Object invariant may not hold.
// 2054.1-2086.2: (7.32): yields_as clause for Cow._lock is not transitive
// 2105.1-2126.2: (9.5): yields_as clause for Inc.x is not valid
// 2131.1-2147.2: (9.5): yields_as clause for Inc.x is not reflexive
// 2153.1-2153.199: (9.11): Object invariant may not hold.
// 2154.1-2186.2: (9.5): yields_as clause for Inc.x is not transitive
// 2206.1-2227.2: (7.32): yields_as clause for Inc._lock is not valid
// 2232.1-2248.2: (7.32): yields_as clause for Inc._lock is not reflexive
// 2254.1-2254.199: (7.1): Object invariant may not hold.
// 2255.1-2287.2: (7.32): yields_as clause for Inc._lock is not transitive
