                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/new-yields-ensures-2.sink:              
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       boolean flag this.flag                                                                       
       ? isRead                                                                                     
         ? R                                                                                        
         : newValue ? R : E                                                                         
       : isRead                                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : holds(this, tid) && newValue ? N : E                                                     
                                                                                                    
       int x isRead                                                                                 
       ? holds(this, tid) ? B : E                                                                   
       : holds(this, tid)                                                                           
         ? this.flag                                                                                
           ? newValue > this.x ? B : E                                                              
           : B                                                                                      
         : E                                                                                        
        yields_as this.flag ==> newValue >= this.x;                                                 
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        int t;                                                                                      
        synchronized (this) {                                                                       
          t := this.x;                                                                              
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          int this_x;                                                                               
          this_x := this.x;                                                                         
          assert this_x >= t;                                                                       
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void g() {                                                                             
        int t;                                                                                      
        synchronized (this) {                                                                       
          t := this.x;                                                                              
          this.flag := true;                                                                        
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          int this_x;                                                                               
          this_x := this.x;                                                                         
          assert this_x >= t;                                                                       
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       boolean flag this.flag                                                                       
       ? isRead                                                                                     
         ? R                                                                                        
         : newValue ? R : E                                                                         
       : isRead                                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : holds(this, tid) && newValue ? N : E                                                     
                                                                                                    
       int x isRead                                                                                 
       ? holds(this, tid) ? B : E                                                                   
       : holds(this, tid)                                                                           
         ? this.flag                                                                                
           ? newValue > this.x ? B : E                                                              
           : B                                                                                      
         : E                                                                                        
        yields_as this.flag ==> newValue >= this.x;                                                 
                                                                                                    
                                                                                                    
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
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            t := this.x;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int this_x;                                                                             
            this_x := this.x;                                                                       
            assert this_x >= t;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void g() {                                                                             
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            t := this.x;                                                                            
            this.flag := true;                                                                      
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int this_x;                                                                             
            this_x := this.x;                                                                       
            assert this_x >= t;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       boolean flag this.flag                                                                       
       ? isRead                                                                                     
         ? R                                                                                        
         : newValue ? R : E                                                                         
       : isRead                                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : holds(this, tid) && newValue ? N : E                                                     
                                                                                                    
       int x isRead                                                                                 
       ? holds(this, tid) ? B : E                                                                   
       : holds(this, tid)                                                                           
         ? this.flag                                                                                
           ? newValue > this.x ? B : E                                                              
           : B                                                                                      
         : E                                                                                        
        yields_as this.flag ==> newValue >= this.x;                                                 
                                                                                                    
                                                                                                    
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
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            t := this.x;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int this_x;                                                                             
            this_x := this.x;                                                                       
            assert this_x >= t;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void g() {                                                                             
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            t := this.x;                                                                            
            this.flag := true;                                                                      
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int this_x;                                                                             
            this_x := this.x;                                                                       
            assert this_x >= t;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       boolean flag this.flag                                                                       
       ? isRead                                                                                     
         ? R                                                                                        
         : newValue ? R : E                                                                         
       : isRead                                                                                     
         ? holds(this, tid) ? B : E                                                                 
         : holds(this, tid) && newValue ? N : E                                                     
                                                                                                    
       int x isRead                                                                                 
       ? holds(this, tid) ? B : E                                                                   
       : holds(this, tid)                                                                           
         ? this.flag                                                                                
           ? newValue > this.x ? B : E                                                              
           : B                                                                                      
         : E                                                                                        
        yields_as this.flag ==> newValue >= this.x;                                                 
                                                                                                    
                                                                                                    
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
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            t := this.x;                                                                            
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int this_x;                                                                             
            this_x := this.x;                                                                       
            assert this_x >= t;                                                                     
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void g() {                                                                             
        int t;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            t := this.x;                                                                            
            this.flag := true;                                                                      
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int this_x;                                                                             
            this_x := this.x;                                                                       
            assert this_x >= t;                                                                     
          }                                                                                         
          release(this);                                                                            
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
                                                                                                    
var Cow.flag: [Cow]bool;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow.flag(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.flag: [Cow]bool,Cow.x: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := false;                                                                            
 if (Cow.flag[this]) then                                                                           
  if (isRead) then                                                                                  
   moverPath(_R, 3)                                                                                 
  else                                                                                              
   if (newValue) then                                                                               
    moverPath(_R, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                        
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)&&newValue)) then            
    moverPath(_N, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.flag(tid: Tid,this : Cow,newValue: bool,Cow._state: [Cow]State,Cow.flag: [Cow]bool,Cow.x: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (Cow.flag[this]) then                                                                           
  if (isRead) then                                                                                  
   moverPath(_R, 3)                                                                                 
  else                                                                                              
   if (newValue) then                                                                               
    moverPath(_R, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                        
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)&&newValue)) then            
    moverPath(_N, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow.x: [Cow]int;                                                                                
                                                                                                    
function {:inline} ReadEval.Cow.x(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.flag: [Cow]bool,Cow.x: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isRead) then                                                                                   
  if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                         
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                         
   if (Cow.flag[this]) then                                                                         
    if ((newValue>Cow.x[this])) then                                                                
     moverPath(_B, 14)                                                                              
    else                                                                                            
     moverPath(_E, 6)                                                                               
   else                                                                                             
    moverPath(_B, 2)                                                                                
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.x(tid: Tid,this : Cow,newValue: int,Cow._state: [Cow]State,Cow.flag: [Cow]bool,Cow.x: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                         
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                         
   if (Cow.flag[this]) then                                                                         
    if ((newValue>Cow.x[this])) then                                                                
     moverPath(_B, 14)                                                                              
    else                                                                                            
     moverPath(_E, 6)                                                                               
   else                                                                                             
    moverPath(_B, 2)                                                                                
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.flag: [Cow]bool,Cow.x: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow.flag: [Cow]bool,Cow.x: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
modifies Cow.flag;                                                                                  
modifies Cow.x;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (17.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (17.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                    
                                                                                                    
ensures StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                     
{                                                                                                   
 var Cow.flag2768266: [Cow]bool;                                                                    
 var Cow.x2768266_post: [Cow]int;                                                                   
 var this2768284: Cow;                                                                              
 var $pc2768284: Phase;                                                                             
 var t2768279: int;                                                                                 
 var path2768261: int;                                                                              
 var Cow._lock2768261: [Cow]Tid;                                                                    
 var Cow.x2768284: [Cow]int;                                                                        
 var tid2768279: Tid;                                                                               
 var t2768266_post: int;                                                                            
 var this_x: int;                                                                                   
 var Cow._state2768274: [Cow]State;                                                                 
 var this2768266_post: Cow;                                                                         
 var Cow.x2768274: [Cow]int;                                                                        
 var Cow._state2768279: [Cow]State;                                                                 
 var tid2768261: Tid;                                                                               
 var $pc2768279: Phase;                                                                             
 var $recorded.state2768284: int;                                                                   
 var $pc2768266: Phase;                                                                             
 var t2768266: int;                                                                                 
 var $recorded.state2768266_post: int;                                                              
 var Cow._lock2768266_post: [Cow]Tid;                                                               
 var Cow.flag2768274: [Cow]bool;                                                                    
 var this2768266: Cow;                                                                              
 var mover2768274: Mover;                                                                           
 var $recorded.state2768261: int;                                                                   
 var Cow._lock2768284: [Cow]Tid;                                                                    
 var Cow.x2768261: [Cow]int;                                                                        
 var tid2768274: Tid;                                                                               
 var mover2768261: Mover;                                                                           
 var $pc2768266_post: Phase;                                                                        
 var Cow._state2768266: [Cow]State;                                                                 
 var Cow._state2768284: [Cow]State;                                                                 
 var this_x2768274: int;                                                                            
 var tid2768266_post: Tid;                                                                          
 var Cow.flag2768284: [Cow]bool;                                                                    
 var moverPath2768274: MoverPath;                                                                   
 var tid2768266: Tid;                                                                               
 var path2768274: int;                                                                              
 var Cow.flag2768279: [Cow]bool;                                                                    
 var Cow._state2768261: [Cow]State;                                                                 
 var t2768284: int;                                                                                 
 var tid2768284: Tid;                                                                               
 var Cow.flag2768266_post: [Cow]bool;                                                               
 var Cow._lock2768266: [Cow]Tid;                                                                    
 var Cow._lock2768274: [Cow]Tid;                                                                    
 var this2768274: Cow;                                                                              
 var Cow.flag2768261: [Cow]bool;                                                                    
 var $recorded.state2768279: int;                                                                   
 var this2768261: Cow;                                                                              
 var t2768261: int;                                                                                 
 var Cow.x2768279: [Cow]int;                                                                        
 var $recorded.state2768266: int;                                                                   
 var Cow.x2768266: [Cow]int;                                                                        
 var $pc2768274: Phase;                                                                             
 var t: int;                                                                                        
 var Cow._lock2768279: [Cow]Tid;                                                                    
 var $pc2768261: Phase;                                                                             
 var moverPath2768261: MoverPath;                                                                   
 var this2768279: Cow;                                                                              
 var t2768274: int;                                                                                 
 var $recorded.state2768274: int;                                                                   
 var Cow._state2768266_post: [Cow]State;                                                            
 var this_x2768279: int;                                                                            
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 18.9: int t;                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (19.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (19.22): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 20.11: t := this.x;                                                                             
                                                                                                    
                                                                                                    
 moverPath2768261 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 mover2768261 := m#moverPath(moverPath2768261);                                                     
 path2768261 := p#moverPath(moverPath2768261);                                                      
 assume Cow._state2768261 == Cow._state && Cow.flag2768261 == Cow.flag && Cow.x2768261 == Cow.x && Cow._lock2768261 == Cow._lock && t2768261 == t && this2768261 == this && tid2768261 == tid && $pc2768261 == $pc;
 assume $recorded.state2768261 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (20.11): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2768261);                                                              
 assert $pc != PhaseError;                                                                                 // (20.11): Reduction failure
 t := Cow.x[this];                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (21.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (21.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (21.9): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 22.9: yield;                                                                                    
                                                                                                    
 assume Cow._state2768266 == Cow._state && Cow.flag2768266 == Cow.flag && Cow.x2768266 == Cow.x && Cow._lock2768266 == Cow._lock && t2768266 == t && this2768266 == this && tid2768266 == tid;
 assume $recorded.state2768266 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2768266_post == Cow._state && Cow.flag2768266_post == Cow.flag && Cow.x2768266_post == Cow.x && Cow._lock2768266_post == Cow._lock && t2768266_post == t && this2768266_post == this && tid2768266_post == tid;
 assume $recorded.state2768266_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (23.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (23.22): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 24.13: int this_x;                                                                              
                                                                                                    
                                                                                                    
 // 24.13: this_x := this.x;                                                                        
                                                                                                    
                                                                                                    
 moverPath2768274 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 mover2768274 := m#moverPath(moverPath2768274);                                                     
 path2768274 := p#moverPath(moverPath2768274);                                                      
 assume Cow._state2768274 == Cow._state && Cow.flag2768274 == Cow.flag && Cow.x2768274 == Cow.x && Cow._lock2768274 == Cow._lock && this_x2768274 == this_x && t2768274 == t && this2768274 == this && tid2768274 == tid && $pc2768274 == $pc;
 assume $recorded.state2768274 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (24.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2768274);                                                              
 assert $pc != PhaseError;                                                                                 // (24.13): Reduction failure
 this_x := Cow.x[this];                                                                             
                                                                                                    
 // 24.35: assert this_x >= t;                                                                      
                                                                                                    
 assume Cow._state2768279 == Cow._state && Cow.flag2768279 == Cow.flag && Cow.x2768279 == Cow.x && Cow._lock2768279 == Cow._lock && this_x2768279 == this_x && t2768279 == t && this2768279 == this && tid2768279 == tid;
 assume $recorded.state2768279 == 1;                                                                
 assert (this_x>=t);                                                                                       // (24.35): This assertion may not hold.
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (25.10): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (25.10): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (25.10): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 17.21: // return;                                                                               
                                                                                                    
 assume Cow._state2768284 == Cow._state && Cow.flag2768284 == Cow.flag && Cow.x2768284 == Cow.x && Cow._lock2768284 == Cow._lock && t2768284 == t && this2768284 == this && tid2768284 == tid;
 assume $recorded.state2768284 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.g(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow.flag;                                                                                  
modifies Cow.x;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (28.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (28.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                    
                                                                                                    
ensures StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                     
{                                                                                                   
 var t2768322: int;                                                                                 
 var Cow._state2768299: [Cow]State;                                                                 
 var Cow.flag2768304: [Cow]bool;                                                                    
 var $pc2768295: Phase;                                                                             
 var mover2768299: Mover;                                                                           
 var tid2768304_post: Tid;                                                                          
 var this2768299: Cow;                                                                              
 var t2768304: int;                                                                                 
 var Cow.x2768312: [Cow]int;                                                                        
 var t2768317: int;                                                                                 
 var Cow.x2768295: [Cow]int;                                                                        
 var path2768312: int;                                                                              
 var this_x: int;                                                                                   
 var t2768304_post: int;                                                                            
 var Cow._lock2768312: [Cow]Tid;                                                                    
 var this2768317: Cow;                                                                              
 var $pc2768299: Phase;                                                                             
 var Cow.x2768304_post: [Cow]int;                                                                   
 var tid2768295: Tid;                                                                               
 var t2768312: int;                                                                                 
 var tid2768312: Tid;                                                                               
 var $recorded.state2768322: int;                                                                   
 var Cow._state2768295: [Cow]State;                                                                 
 var Cow._lock2768317: [Cow]Tid;                                                                    
 var tid2768322: Tid;                                                                               
 var this2768312: Cow;                                                                              
 var $pc2768304: Phase;                                                                             
 var Cow._state2768322: [Cow]State;                                                                 
 var Cow._lock2768299: [Cow]Tid;                                                                    
 var mover2768312: Mover;                                                                           
 var tid2768304: Tid;                                                                               
 var this2768322: Cow;                                                                              
 var this2768304: Cow;                                                                              
 var $pc2768312: Phase;                                                                             
 var tid2768317: Tid;                                                                               
 var Cow.flag2768295: [Cow]bool;                                                                    
 var path2768295: int;                                                                              
 var moverPath2768299: MoverPath;                                                                   
 var Cow._state2768304: [Cow]State;                                                                 
 var Cow.x2768322: [Cow]int;                                                                        
 var $recorded.state2768312: int;                                                                   
 var this2768304_post: Cow;                                                                         
 var Cow.x2768317: [Cow]int;                                                                        
 var tid2768299: Tid;                                                                               
 var Cow._state2768317: [Cow]State;                                                                 
 var this2768295: Cow;                                                                              
 var Cow.x2768299: [Cow]int;                                                                        
 var Cow.flag2768304_post: [Cow]bool;                                                               
 var Cow._lock2768304_post: [Cow]Tid;                                                               
 var t2768295: int;                                                                                 
 var Cow.flag2768312: [Cow]bool;                                                                    
 var Cow.flag2768317: [Cow]bool;                                                                    
 var Cow.flag2768299: [Cow]bool;                                                                    
 var path2768299: int;                                                                              
 var $recorded.state2768304: int;                                                                   
 var $recorded.state2768295: int;                                                                   
 var $recorded.state2768317: int;                                                                   
 var $recorded.state2768299: int;                                                                   
 var $pc2768322: Phase;                                                                             
 var mover2768295: Mover;                                                                           
 var Cow._lock2768322: [Cow]Tid;                                                                    
 var Cow._state2768304_post: [Cow]State;                                                            
 var Cow._lock2768295: [Cow]Tid;                                                                    
 var $recorded.state2768304_post: int;                                                              
 var $pc2768304_post: Phase;                                                                        
 var Cow.flag2768322: [Cow]bool;                                                                    
 var this_x2768312: int;                                                                            
 var t: int;                                                                                        
 var moverPath2768295: MoverPath;                                                                   
 var this_x2768317: int;                                                                            
 var t2768299: int;                                                                                 
 var moverPath2768312: MoverPath;                                                                   
 var $pc2768317: Phase;                                                                             
 var Cow._lock2768304: [Cow]Tid;                                                                    
 var Cow.x2768304: [Cow]int;                                                                        
 var Cow._state2768312: [Cow]State;                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 29.9: int t;                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (30.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (30.22): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 31.11: t := this.x;                                                                             
                                                                                                    
                                                                                                    
 moverPath2768295 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 mover2768295 := m#moverPath(moverPath2768295);                                                     
 path2768295 := p#moverPath(moverPath2768295);                                                      
 assume Cow._state2768295 == Cow._state && Cow.flag2768295 == Cow.flag && Cow.x2768295 == Cow.x && Cow._lock2768295 == Cow._lock && t2768295 == t && this2768295 == this && tid2768295 == tid && $pc2768295 == $pc;
 assume $recorded.state2768295 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (31.11): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2768295);                                                              
 assert $pc != PhaseError;                                                                                 // (31.11): Reduction failure
 t := Cow.x[this];                                                                                  
                                                                                                    
                                                                                                    
 // 32.11: this.flag := true;                                                                       
                                                                                                    
                                                                                                    
 moverPath2768299 := WriteEval.Cow.flag(tid: Tid,this: Cow,true: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);
 mover2768299 := m#moverPath(moverPath2768299);                                                     
 path2768299 := p#moverPath(moverPath2768299);                                                      
 assume Cow._state2768299 == Cow._state && Cow.flag2768299 == Cow.flag && Cow.x2768299 == Cow.x && Cow._lock2768299 == Cow._lock && t2768299 == t && this2768299 == this && tid2768299 == tid && $pc2768299 == $pc;
 assume $recorded.state2768299 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (32.11): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2768299);                                                              
 assert $pc != PhaseError;                                                                                 // (32.11): Reduction failure
 Cow.flag[this] := true;                                                                            
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (33.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (33.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (33.9): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 34.9: yield;                                                                                    
                                                                                                    
 assume Cow._state2768304 == Cow._state && Cow.flag2768304 == Cow.flag && Cow.x2768304 == Cow.x && Cow._lock2768304 == Cow._lock && t2768304 == t && this2768304 == this && tid2768304 == tid;
 assume $recorded.state2768304 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2768304_post == Cow._state && Cow.flag2768304_post == Cow.flag && Cow.x2768304_post == Cow.x && Cow._lock2768304_post == Cow._lock && t2768304_post == t && this2768304_post == this && tid2768304_post == tid;
 assume $recorded.state2768304_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (35.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (35.22): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 36.11: int this_x;                                                                              
                                                                                                    
                                                                                                    
 // 36.11: this_x := this.x;                                                                        
                                                                                                    
                                                                                                    
 moverPath2768312 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 mover2768312 := m#moverPath(moverPath2768312);                                                     
 path2768312 := p#moverPath(moverPath2768312);                                                      
 assume Cow._state2768312 == Cow._state && Cow.flag2768312 == Cow.flag && Cow.x2768312 == Cow.x && Cow._lock2768312 == Cow._lock && this_x2768312 == this_x && t2768312 == t && this2768312 == this && tid2768312 == tid && $pc2768312 == $pc;
 assume $recorded.state2768312 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (36.11): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2768312);                                                              
 assert $pc != PhaseError;                                                                                 // (36.11): Reduction failure
 this_x := Cow.x[this];                                                                             
                                                                                                    
 // 36.33: assert this_x >= t;                                                                      
                                                                                                    
 assume Cow._state2768317 == Cow._state && Cow.flag2768317 == Cow.flag && Cow.x2768317 == Cow.x && Cow._lock2768317 == Cow._lock && this_x2768317 == this_x && t2768317 == t && this2768317 == this && tid2768317 == tid;
 assume $recorded.state2768317 == 1;                                                                
 assert (this_x>=t);                                                                                       // (36.33): This assertion may not hold.
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (37.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (37.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (37.9): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 28.21: // return;                                                                               
                                                                                                    
 assume Cow._state2768322 == Cow._state && Cow.flag2768322 == Cow.flag && Cow.x2768322 == Cow.x && Cow._lock2768322 == Cow._lock && t2768322 == t && this2768322 == this && tid2768322 == tid;
 assume $recorded.state2768322 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.flag: [Cow]bool,Cow.x: [Cow]int,Cow._lock: [Cow]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.flag(t: Tid, u: Tid, v: bool, w: bool, x: Cow)           
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.flag;                                                                                 
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
 assume w != v;                                                                                     
 Cow.flag[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.flag(u: Tid,x: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.flag failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.flag(t: Tid, u: Tid, v: bool, w: bool, x: Cow)            
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.flag;                                                                                 
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
 assume Cow.flag[x] != v;                                                                           
 Cow.flag[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.flag(u: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                  
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.5): Cow.flag failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.flag(t: Tid, u: Tid, v: bool, w: bool, x: Cow)            
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.flag;                                                                                 
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w != v;                                                                                     
 assume w == Cow.flag[x];                                                                           
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.flag[x] := havocValue;                                                                         
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.flag(u: Tid,x: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.flag failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.flag(t: Tid, u: Tid, v: bool, w: bool, x: Cow)             
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.flag;                                                                                 
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : bool;                                                                             
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow.flag[x] != v;                                                                           
 assume w == Cow.flag[x];                                                                           
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.flag(u: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                  
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): Cow.flag failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.flag(t: Tid, u: Tid, v: bool, w: bool, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.flag;                                                                                 
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow.flag[x] != w;                                                                           
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.flag(t: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                  
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.flag(u: Tid,x: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.flag failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.flag(t: Tid, u: Tid, v: bool, w: bool, x: Cow)                  
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.flag;                                                                                 
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Cow.flag[x];                                                                           
 assume Cow.flag[x] != w;                                                                           
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.flag(t: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                  
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.flag[x] := havocValue;                                                                         
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.flag(u: Tid,x: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Cow.flag failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
 assume w != v;                                                                                     
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.5): Cow.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
 assume Cow.x[x] != v;                                                                              
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.x(u: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                     
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (8.5): Cow.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w != v;                                                                                     
 assume w == Cow.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.x[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.5): Cow.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                  
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow.x[x] != v;                                                                              
 assume w == Cow.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.x(u: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                     
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (8.5): Cow.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                      
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow.x[x] != w;                                                                              
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                     
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.5): Cow.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                       
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Cow.x[x];                                                                              
 assume Cow.x[x] != w;                                                                              
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                     
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.x[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.5): Cow.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.flag.Cow.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.flag;                                                                                 
 modifies Cow.flag;                                                                                 
                                                                                                    
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
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.flag(u: Tid,y: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.flag[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.flag(u: Tid,y: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);    
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Cow.flag is not Write-Write Stable with respect to Cow.flag (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Cow.flag is not Write-Write Stable with respect to Cow.flag (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Cow.flag is not Write-Write Stable with respect to Cow.flag (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.flag.Cow.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.flag;                                                                                 
 modifies Cow.flag;                                                                                 
                                                                                                    
 {                                                                                                  
 var tmpV : bool;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var w_mid: bool;                                                                                   
 var Cow.flag_mid: [Cow]bool;                                                                       
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.flag[x];                                                                               
 Cow.flag[x] := v;                                                                                  
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.flag_mid == Cow.flag && Cow.x_mid == Cow.x && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.flag(u: Tid,y: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.flag[x] := tmpV;                                                                               
 Cow.flag[y] := w;                                                                                  
 _writeByTPost := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);    
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.flag is not Write-Write Stable with respect to Cow.flag (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.flag.Cow.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.flag;                                                                                 
 modifies Cow.flag;                                                                                 
                                                                                                    
 {                                                                                                  
 var tmpV : bool;                                                                                   
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
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var w_mid: bool;                                                                                   
 var Cow.flag_mid: [Cow]bool;                                                                       
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.flag(u: Tid,y: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.flag[x];                                                                               
 Cow.flag[x] := v;                                                                                  
 assume Cow._state_mid == Cow._state && Cow.flag_mid == Cow.flag && Cow.x_mid == Cow.x && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.flag(u: Tid,y: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);    
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.flag[x] := tmpV;                                                                               
 Cow.flag[y] := w;                                                                                  
 _writeByTPost := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);    
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.flag is not Write-Write Stable with respect to Cow.flag (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.flag is not Write-Write Stable with respect to Cow.flag (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.flag.Cow.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.flag;                                                                                 
 modifies Cow.flag;                                                                                 
                                                                                                    
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
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.flag(t: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                  
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.flag(u: Tid,y: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.flag[y] := w;                                                                                  
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.flag(t: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);              
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.flag is not Read-Write Stable with respect to Cow.flag (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.flag is not Read-Write Stable with respect to Cow.flag (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.flag is not Read-Write Stable with respect to Cow.flag (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.flag.Cow.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.flag;                                                                                 
 modifies Cow.flag;                                                                                 
                                                                                                    
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
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.flag(u: Tid,y: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                  
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.flag[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.flag(u: Tid,y: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);              
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.flag is not Write-Read Stable with respect to Cow.flag (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.flag is not Write-Read Stable with respect to Cow.flag (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Cow.flag is not Write-Read Stable with respect to Cow.flag (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.flag.Cow.x(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Cow, y: Cow)  
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.flag;                                                                                 
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.flag[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.5): Cow.x is not Write-Write Stable with respect to Cow.flag (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.5): Cow.x is not Write-Write Stable with respect to Cow.flag (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.5): Cow.x is not Write-Write Stable with respect to Cow.flag (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.flag.Cow.x(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Cow, y: Cow)  
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.flag;                                                                                 
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var tmpV : bool;                                                                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var v_mid: bool;                                                                                   
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var Cow.flag_mid: [Cow]bool;                                                                       
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.flag[x];                                                                               
 Cow.flag[x] := v;                                                                                  
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.flag_mid == Cow.flag && Cow.x_mid == Cow.x && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.flag[x] := tmpV;                                                                               
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);    
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.flag is not Write-Write Stable with respect to Cow.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.flag.Cow.x(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Cow, y: Cow) 
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.flag;                                                                                 
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var tmpV : bool;                                                                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var v_mid: bool;                                                                                   
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var Cow.flag_mid: [Cow]bool;                                                                       
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.flag[x];                                                                               
 Cow.flag[x] := v;                                                                                  
 assume Cow._state_mid == Cow._state && Cow.flag_mid == Cow.flag && Cow.x_mid == Cow.x && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.flag[x] := tmpV;                                                                               
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);    
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.flag is not Write-Write Stable with respect to Cow.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Cow.flag is not Write-Write Stable with respect to Cow.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.flag.Cow.x(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.flag;                                                                                 
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.flag(t: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                  
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.flag(t: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);              
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.flag is not Read-Write Stable with respect to Cow.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.flag is not Read-Write Stable with respect to Cow.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Cow.flag is not Read-Write Stable with respect to Cow.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.flag.Cow.x(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.flag;                                                                                 
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                     
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.flag(t: Tid,x: Cow,v: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.flag[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                 
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Cow.x is not Write-Read Stable with respect to Cow.flag (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Cow.x is not Write-Read Stable with respect to Cow.flag (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.5): Cow.x is not Write-Read Stable with respect to Cow.flag (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.x.Cow.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Cow, y: Cow) 
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.flag;                                                                                 
                                                                                                    
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
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.flag(u: Tid,y: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.flag(u: Tid,y: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);    
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Cow.flag is not Write-Write Stable with respect to Cow.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Cow.flag is not Write-Write Stable with respect to Cow.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Cow.flag is not Write-Write Stable with respect to Cow.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.x.Cow.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Cow, y: Cow) 
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.flag;                                                                                 
                                                                                                    
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
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w0_mid: bool;                                                                                  
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var w_mid: bool;                                                                                   
 var Cow.flag_mid: [Cow]bool;                                                                       
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.flag_mid == Cow.flag && Cow.x_mid == Cow.x && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.flag(u: Tid,y: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.flag[y] := w;                                                                                  
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Cow.x is not Write-Write Stable with respect to Cow.flag (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.x.Cow.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.flag;                                                                                 
                                                                                                    
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
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w0_mid: bool;                                                                                  
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var w_mid: bool;                                                                                   
 var Cow.flag_mid: [Cow]bool;                                                                       
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.flag(u: Tid,y: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.flag_mid == Cow.flag && Cow.x_mid == Cow.x && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.flag(u: Tid,y: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);    
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.flag[y] := w;                                                                                  
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Cow.x is not Write-Write Stable with respect to Cow.flag (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Cow.x is not Write-Write Stable with respect to Cow.flag (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.x.Cow.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.flag;                                                                                 
                                                                                                    
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
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                     
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.flag(u: Tid,y: Cow,w: bool,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.flag[y] := w;                                                                                  
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                 
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Cow.x is not Read-Write Stable with respect to Cow.flag (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Cow.x is not Read-Write Stable with respect to Cow.flag (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Cow.x is not Read-Write Stable with respect to Cow.flag (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.x.Cow.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.flag;                                                                                 
                                                                                                    
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
 var w_pre: bool;                                                                                   
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.flag(u: Tid,y: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                  
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.flag(u: Tid,y: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);              
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.flag is not Write-Read Stable with respect to Cow.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Cow.flag is not Write-Read Stable with respect to Cow.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Cow.flag is not Write-Read Stable with respect to Cow.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.5): Cow.x is not Write-Write Stable with respect to Cow.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.5): Cow.x is not Write-Write Stable with respect to Cow.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.5): Cow.x is not Write-Write Stable with respect to Cow.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
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
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var Cow.flag_mid: [Cow]bool;                                                                       
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.flag_mid == Cow.flag && Cow.x_mid == Cow.x && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Cow.x is not Write-Write Stable with respect to Cow.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
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
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var Cow.flag_mid: [Cow]bool;                                                                       
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.flag_mid == Cow.flag && Cow.x_mid == Cow.x && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);        
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Cow.x is not Write-Write Stable with respect to Cow.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Cow.x is not Write-Write Stable with respect to Cow.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                     
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                 
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Cow.x is not Read-Write Stable with respect to Cow.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Cow.x is not Read-Write Stable with respect to Cow.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Cow.x is not Read-Write Stable with respect to Cow.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
 var Cow.flag_pre: [Cow]bool;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var Cow.flag_post: [Cow]bool;                                                                      
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                     
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.flag,Cow.x,Cow._lock);            
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.flag_post == Cow.flag && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock);                 
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Cow.x is not Write-Read Stable with respect to Cow.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Cow.x is not Write-Read Stable with respect to Cow.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.5): Cow.x is not Write-Read Stable with respect to Cow.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                    
requires ValidTid(tid);                                                                             
modifies Cow._state;                                                                                
modifies Cow.flag;                                                                                  
modifies Cow.x;                                                                                     
modifies Cow._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                     
ensures Y(tid , old(Cow._state), old(Cow.flag), old(Cow.x), old(Cow._lock) , Cow._state, Cow.flag, Cow.x, Cow._lock);
                                                                                                    
// Cow.flag:                                                                                        
                                                                                                    
function {:inline} Y_Cow.flag(tid : Tid, this: Cow, newValue: bool , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.flag(tid: Tid,this: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock)), _R)) ==> (Cow.flag[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.flag(tid : Tid, this: Cow, newValue: bool , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.flag.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: bool , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: bool;                                                                           
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.flag_yield: [Cow]bool;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.flag(u: Tid,this: Cow,newValue: bool,Cow._state,Cow.flag,Cow.x,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.flag_yield == Cow.flag && Cow.x_yield == Cow.x && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.flag(tid, this, newValue , Cow._state, Cow.flag, Cow.x, Cow._lock);                   
}                                                                                                   
                                                                                                    
procedure Y_Cow.flag.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.flag_yield: [Cow]bool;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.flag_yield == Cow.flag && Cow.x_yield == Cow.x && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.flag(tid, this, Cow.flag[this] , Cow._state, Cow.flag, Cow.x, Cow._lock);             
}                                                                                                   
                                                                                                    
procedure Y_Cow.flag.Transitive(tid : Tid, this: Cow, newValue : bool , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.flag_p: [Cow]bool, Cow.x_p: [Cow]int, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires StateInvariant(Cow._state_p, Cow.flag_p, Cow.x_p, Cow._lock_p);                           
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var newValue_pre: bool;                                                                             
var Cow.flag_pre: [Cow]bool;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
                                                                                                    
var $recorded.state_post: int;                                                                      
var Cow.flag_post: [Cow]bool;                                                                       
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var newValue_post: bool;                                                                            
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.flag, Cow.x, Cow._lock , Cow._state_p, Cow.flag_p, Cow.x_p, Cow._lock_p);
 assume Y_Cow.flag(tid, this, newValue , Cow._state_p, Cow.flag_p, Cow.x_p, Cow._lock_p);           
assume Cow._state_post == Cow._state_p && Cow.flag_post == Cow.flag_p && Cow.x_post == Cow.x_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.flag(tid, this, newValue , Cow._state, Cow.flag, Cow.x, Cow._lock);                   
}                                                                                                   
// Cow.x:                                                                                           
                                                                                                    
function {:inline} Y_Cow.x(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock)), _R)) ==> (Cow.x[this] == newValue))
 &&((Cow.flag[this]==>(newValue>=Cow.x[this])))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.x(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
var Cow.flag_yield: [Cow]bool;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.x(u: Tid,this: Cow,newValue: int,Cow._state,Cow.flag,Cow.x,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.flag_yield == Cow.flag && Cow.x_yield == Cow.x && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.x(tid, this, newValue , Cow._state, Cow.flag, Cow.x, Cow._lock);                      
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.flag_yield: [Cow]bool;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.flag_yield == Cow.flag && Cow.x_yield == Cow.x && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.x(tid, this, Cow.x[this] , Cow._state, Cow.flag, Cow.x, Cow._lock);                   
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Transitive(tid : Tid, this: Cow, newValue : int , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.flag_p: [Cow]bool, Cow.x_p: [Cow]int, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires StateInvariant(Cow._state_p, Cow.flag_p, Cow.x_p, Cow._lock_p);                           
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var Cow.flag_pre: [Cow]bool;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
                                                                                                    
var $recorded.state_post: int;                                                                      
var Cow.flag_post: [Cow]bool;                                                                       
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.flag, Cow.x, Cow._lock , Cow._state_p, Cow.flag_p, Cow.x_p, Cow._lock_p);
 assume Y_Cow.x(tid, this, newValue , Cow._state_p, Cow.flag_p, Cow.x_p, Cow._lock_p);              
assume Cow._state_post == Cow._state_p && Cow.flag_post == Cow.flag_p && Cow.x_post == Cow.x_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.x(tid, this, newValue , Cow._state, Cow.flag, Cow.x, Cow._lock);                      
}                                                                                                   
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
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
var Cow.flag_yield: [Cow]bool;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow.flag,Cow.x,Cow._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.flag,Cow.x,Cow._lock)), _N);
assume Cow._state_yield == Cow._state && Cow.flag_yield == Cow.flag && Cow.x_yield == Cow.x && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.flag, Cow.x, Cow._lock);                  
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var Cow.flag_yield: [Cow]bool;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.flag_yield == Cow.flag && Cow.x_yield == Cow.x && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow.flag, Cow.x, Cow._lock);           
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.flag_p: [Cow]bool, Cow.x_p: [Cow]int, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.flag, Cow.x, Cow._lock);                                   
 requires StateInvariant(Cow._state_p, Cow.flag_p, Cow.x_p, Cow._lock_p);                           
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var Cow.flag_pre: [Cow]bool;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Cow.flag_post: [Cow]bool;                                                                       
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.flag_pre == Cow.flag && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.flag, Cow.x, Cow._lock , Cow._state_p, Cow.flag_p, Cow.x_p, Cow._lock_p);
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow.flag_p, Cow.x_p, Cow._lock_p);          
assume Cow._state_post == Cow._state_p && Cow.flag_post == Cow.flag_p && Cow.x_post == Cow.x_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.flag, Cow.x, Cow._lock);                  
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow.flag: [Cow]bool, Cow.x: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.flag_p: [Cow]bool, Cow.x_p: [Cow]int, Cow._lock_p: [Cow]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow.flag(tid : Tid, this, Cow.flag_p[this] , Cow._state, Cow.flag, Cow.x, Cow._lock))
 && (forall this: Cow :: Y_Cow.x(tid : Tid, this, Cow.x_p[this] , Cow._state, Cow.flag, Cow.x, Cow._lock))
 && (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow.flag, Cow.x, Cow._lock))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 686.1-869.2: (Method:17.5)
// 694.1-694.24: (17.5): Bad tid
// 695.1-695.37: (17.5): this is not global
// 770.2-772.2: (class anchor.sink.VarDeclStmt:18.9)
// 776.1-776.27: (19.22): Cannot have potential null deference in left-mover part.
// 780.1-780.27: (19.22): Reduction failure
// 782.2-799.19: (class anchor.sink.Read:20.11)
// 794.1-794.27: (20.11): Cannot have potential null deference in left-mover part.
// 798.1-798.27: (20.11): Reduction failure
// 803.1-803.27: (21.9): Cannot have potential null deference in left-mover part.
// 805.1-805.32: (21.9): lock not held
// 807.1-807.27: (21.9): Reduction failure
// 809.2-817.42: (class anchor.sink.Yield:22.9)
// 821.1-821.27: (23.22): Cannot have potential null deference in left-mover part.
// 825.1-825.27: (23.22): Reduction failure
// 827.2-829.2: (class anchor.sink.VarDeclStmt:24.13)
// 830.2-847.24: (class anchor.sink.Read:24.13)
// 842.1-842.27: (24.13): Cannot have potential null deference in left-mover part.
// 846.1-846.27: (24.13): Reduction failure
// 848.2-853.21: (class anchor.sink.Assert:24.35)
// 853.1-853.21: (24.35): This assertion may not hold.
// 857.1-857.27: (25.10): Cannot have potential null deference in left-mover part.
// 859.1-859.32: (25.10): lock not held
// 861.1-861.27: (25.10): Reduction failure
// 863.2-868.9: (class anchor.sink.Return:17.21)
// 870.1-1083.2: (Method:28.5)
// 878.1-878.24: (28.5): Bad tid
// 879.1-879.37: (28.5): this is not global
// 966.2-968.2: (class anchor.sink.VarDeclStmt:29.9)
// 972.1-972.27: (30.22): Cannot have potential null deference in left-mover part.
// 976.1-976.27: (30.22): Reduction failure
// 978.2-995.19: (class anchor.sink.Read:31.11)
// 990.1-990.27: (31.11): Cannot have potential null deference in left-mover part.
// 994.1-994.27: (31.11): Reduction failure
// 997.2-1013.25: (class anchor.sink.Write:32.11)
// 1009.1-1009.27: (32.11): Cannot have potential null deference in left-mover part.
// 1012.1-1012.27: (32.11): Reduction failure
// 1017.1-1017.27: (33.9): Cannot have potential null deference in left-mover part.
// 1019.1-1019.32: (33.9): lock not held
// 1021.1-1021.27: (33.9): Reduction failure
// 1023.2-1031.42: (class anchor.sink.Yield:34.9)
// 1035.1-1035.27: (35.22): Cannot have potential null deference in left-mover part.
// 1039.1-1039.27: (35.22): Reduction failure
// 1041.2-1043.2: (class anchor.sink.VarDeclStmt:36.11)
// 1044.2-1061.24: (class anchor.sink.Read:36.11)
// 1056.1-1056.27: (36.11): Cannot have potential null deference in left-mover part.
// 1060.1-1060.27: (36.11): Reduction failure
// 1062.2-1067.21: (class anchor.sink.Assert:36.33)
// 1067.1-1067.21: (36.33): This assertion may not hold.
// 1071.1-1071.27: (37.9): Cannot have potential null deference in left-mover part.
// 1073.1-1073.32: (37.9): lock not held
// 1075.1-1075.27: (37.9): Reduction failure
// 1077.2-1082.9: (class anchor.sink.Return:28.21)
// 1159.1-1159.34: (5.5): Cow.flag failed Write-Write Right-Mover Check
// 1218.1-1218.30: (5.5): Cow.flag failed Write-Read Right-Mover Check
// 1281.1-1281.34: (5.5): Cow.flag failed Write-Write Left-Mover Check
// 1341.1-1341.30: (5.5): Cow.flag failed Write-Read Left-Mover Check
// 1398.1-1398.34: (5.5): Cow.flag failed Read-Write Right-Mover Check
// 1458.1-1458.34: (5.5): Cow.flag failed Read-Write Left-Mover Check
// 1517.1-1517.34: (8.5): Cow.x failed Write-Write Right-Mover Check
// 1576.1-1576.30: (8.5): Cow.x failed Write-Read Right-Mover Check
// 1639.1-1639.34: (8.5): Cow.x failed Write-Write Left-Mover Check
// 1699.1-1699.30: (8.5): Cow.x failed Write-Read Left-Mover Check
// 1756.1-1756.34: (8.5): Cow.x failed Read-Write Right-Mover Check
// 1816.1-1816.34: (8.5): Cow.x failed Read-Write Left-Mover Check
// 1887.1-1887.140: (5.5): Cow.flag is not Write-Write Stable with respect to Cow.flag (case A.1)
// 1888.1-1888.101: (5.5): Cow.flag is not Write-Write Stable with respect to Cow.flag (case A.2)
// 1889.1-1889.158: (5.5): Cow.flag is not Write-Write Stable with respect to Cow.flag (case A.3)
// 1985.1-1985.140: (5.5): Cow.flag is not Write-Write Stable with respect to Cow.flag (case C)
// 2086.1-2086.144: (5.5): Cow.flag is not Write-Write Stable with respect to Cow.flag (case D)
// 2087.1-2087.144: (5.5): Cow.flag is not Write-Write Stable with respect to Cow.flag (case R)
// 2158.1-2158.136: (5.5): Cow.flag is not Read-Write Stable with respect to Cow.flag (case F)
// 2159.1-2159.136: (5.5): Cow.flag is not Read-Write Stable with respect to Cow.flag (case H)
// 2160.1-2160.146: (5.5): Cow.flag is not Read-Write Stable with respect to Cow.flag (case I)
// 2230.1-2230.136: (5.5): Cow.flag is not Write-Read Stable with respect to Cow.flag (case J)
// 2231.1-2231.136: (5.5): Cow.flag is not Write-Read Stable with respect to Cow.flag (case K)
// 2232.1-2232.99: (5.5): Cow.flag is not Write-Read Stable with respect to Cow.flag (case L)
// 2304.1-2304.140: (8.5): Cow.x is not Write-Write Stable with respect to Cow.flag (case A.1)
// 2305.1-2305.101: (8.5): Cow.x is not Write-Write Stable with respect to Cow.flag (case A.2)
// 2306.1-2306.158: (8.5): Cow.x is not Write-Write Stable with respect to Cow.flag (case A.3)
// 2402.1-2402.140: (5.5): Cow.flag is not Write-Write Stable with respect to Cow.x (case C)
// 2503.1-2503.144: (5.5): Cow.flag is not Write-Write Stable with respect to Cow.x (case D)
// 2504.1-2504.144: (5.5): Cow.flag is not Write-Write Stable with respect to Cow.x (case R)
// 2575.1-2575.136: (5.5): Cow.flag is not Read-Write Stable with respect to Cow.x (case F)
// 2576.1-2576.136: (5.5): Cow.flag is not Read-Write Stable with respect to Cow.x (case H)
// 2577.1-2577.146: (5.5): Cow.flag is not Read-Write Stable with respect to Cow.x (case I)
// 2647.1-2647.136: (8.5): Cow.x is not Write-Read Stable with respect to Cow.flag (case J)
// 2648.1-2648.136: (8.5): Cow.x is not Write-Read Stable with respect to Cow.flag (case K)
// 2649.1-2649.99: (8.5): Cow.x is not Write-Read Stable with respect to Cow.flag (case L)
// 2721.1-2721.140: (5.5): Cow.flag is not Write-Write Stable with respect to Cow.x (case A.1)
// 2722.1-2722.101: (5.5): Cow.flag is not Write-Write Stable with respect to Cow.x (case A.2)
// 2723.1-2723.158: (5.5): Cow.flag is not Write-Write Stable with respect to Cow.x (case A.3)
// 2819.1-2819.140: (8.5): Cow.x is not Write-Write Stable with respect to Cow.flag (case C)
// 2920.1-2920.144: (8.5): Cow.x is not Write-Write Stable with respect to Cow.flag (case D)
// 2921.1-2921.144: (8.5): Cow.x is not Write-Write Stable with respect to Cow.flag (case R)
// 2992.1-2992.136: (8.5): Cow.x is not Read-Write Stable with respect to Cow.flag (case F)
// 2993.1-2993.136: (8.5): Cow.x is not Read-Write Stable with respect to Cow.flag (case H)
// 2994.1-2994.146: (8.5): Cow.x is not Read-Write Stable with respect to Cow.flag (case I)
// 3064.1-3064.136: (5.5): Cow.flag is not Write-Read Stable with respect to Cow.x (case J)
// 3065.1-3065.136: (5.5): Cow.flag is not Write-Read Stable with respect to Cow.x (case K)
// 3066.1-3066.99: (5.5): Cow.flag is not Write-Read Stable with respect to Cow.x (case L)
// 3138.1-3138.140: (8.5): Cow.x is not Write-Write Stable with respect to Cow.x (case A.1)
// 3139.1-3139.101: (8.5): Cow.x is not Write-Write Stable with respect to Cow.x (case A.2)
// 3140.1-3140.158: (8.5): Cow.x is not Write-Write Stable with respect to Cow.x (case A.3)
// 3236.1-3236.140: (8.5): Cow.x is not Write-Write Stable with respect to Cow.x (case C)
// 3337.1-3337.144: (8.5): Cow.x is not Write-Write Stable with respect to Cow.x (case D)
// 3338.1-3338.144: (8.5): Cow.x is not Write-Write Stable with respect to Cow.x (case R)
// 3409.1-3409.136: (8.5): Cow.x is not Read-Write Stable with respect to Cow.x (case F)
// 3410.1-3410.136: (8.5): Cow.x is not Read-Write Stable with respect to Cow.x (case H)
// 3411.1-3411.146: (8.5): Cow.x is not Read-Write Stable with respect to Cow.x (case I)
// 3481.1-3481.136: (8.5): Cow.x is not Write-Read Stable with respect to Cow.x (case J)
// 3482.1-3482.136: (8.5): Cow.x is not Write-Read Stable with respect to Cow.x (case K)
// 3483.1-3483.99: (8.5): Cow.x is not Write-Read Stable with respect to Cow.x (case L)
// 3515.1-3535.2: (5.5): yields_as clause for Cow.flag is not valid
// 3540.1-3555.2: (5.5): yields_as clause for Cow.flag is not reflexive
// 3561.1-3591.2: (5.5): yields_as clause for Cow.flag is not transitive
// 3611.1-3631.2: (14.30): yields_as clause for Cow.x is not valid
// 3636.1-3651.2: (14.30): yields_as clause for Cow.x is not reflexive
// 3657.1-3687.2: (14.30): yields_as clause for Cow.x is not transitive
// 3707.1-3727.2: (7.32): yields_as clause for Cow._lock is not valid
// 3732.1-3747.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 3753.1-3783.2: (7.32): yields_as clause for Cow._lock is not transitive
