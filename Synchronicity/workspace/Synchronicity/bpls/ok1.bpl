                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/ok1.sink:                               
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
                                                                                                    
    }                                                                                               
    class Inc {                                                                                     
       Inc next isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
       Cow value isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc(Cow d) {                                                                      
        int x;                                                                                      
        Cow c;                                                                                      
        c = new Cow();                                                                              
        c = new Cow();                                                                              
        Cow y;                                                                                      
        y := this.value;                                                                            
        yield;                                                                                      
        this.value := y;                                                                            
        yield;                                                                                      
        this.next := this;                                                                          
         return;                                                                                    
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
                                                                                                    
                                                                                                    
    }                                                                                               
    class Inc {                                                                                     
       Inc next isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
       Cow value isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
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
      public void inc(Cow d) {                                                                      
        int x;                                                                                      
        Cow c;                                                                                      
        c = new Cow();                                                                              
        c = new Cow();                                                                              
        Cow y;                                                                                      
        y := this.value;                                                                            
        yield;                                                                                      
        this.value := y;                                                                            
        yield;                                                                                      
        this.next := this;                                                                          
        {                                                                                           
           return;                                                                                  
        }                                                                                           
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
                                                                                                    
                                                                                                    
    }                                                                                               
    class Inc {                                                                                     
       Inc next isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
       Cow value isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
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
      public void inc(Cow d) {                                                                      
        int x;                                                                                      
        Cow c;                                                                                      
        c = new Cow();                                                                              
        c = new Cow();                                                                              
        Cow y;                                                                                      
        y := this.value;                                                                            
        yield;                                                                                      
        this.value := y;                                                                            
        yield;                                                                                      
        this.next := this;                                                                          
        {                                                                                           
           return;                                                                                  
        }                                                                                           
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
                                                                                                    
                                                                                                    
    }                                                                                               
    class Inc {                                                                                     
       Inc next isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
       Cow value isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
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
      public void inc(Cow d) {                                                                      
        int x;                                                                                      
        Cow c;                                                                                      
        c = new Cow();                                                                              
        c = new Cow();                                                                              
        Cow y;                                                                                      
        y := this.value;                                                                            
        yield;                                                                                      
        this.value := y;                                                                            
        yield;                                                                                      
        this.next := this;                                                                          
        {                                                                                           
           return;                                                                                  
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
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc.value: [Inc]Cow,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc.value: [Inc]Cow,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
var Inc.next: [Inc]Inc;                                                                             
                                                                                                    
function {:inline} ReadEval.Inc.next(tid: Tid,this : Inc,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc.value: [Inc]Cow,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Inc.null;                                                                         
 if (isLocal(Inc._state[this], tid)) then                                                           
  if (isLocal(Inc._state[this], tid)) then                                                          
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc.next(tid: Tid,this : Inc,newValue: Inc,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc.value: [Inc]Cow,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc._state[this], tid)) then                                                           
  if (isLocal(Inc._state[this], tid)) then                                                          
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc.value: [Inc]Cow;                                                                            
                                                                                                    
function {:inline} ReadEval.Inc.value(tid: Tid,this : Inc,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc.value: [Inc]Cow,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Cow.null;                                                                         
 if (isLocal(Inc._state[this], tid)) then                                                           
  if (isLocal(Inc._state[this], tid)) then                                                          
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc.value(tid: Tid,this : Inc,newValue: Cow,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc.value: [Inc]Cow,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc._state[this], tid)) then                                                           
  if (isLocal(Inc._state[this], tid)) then                                                          
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc._lock: [Inc]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Inc._lock(tid: Tid,this : Inc,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc.value: [Inc]Cow,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Inc._lock(tid: Tid,this : Inc,newValue: Tid,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc.value: [Inc]Cow,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Inc.inc(tid:Tid, this : Inc, d : Cow)                                                    
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.next;                                                                                  
modifies Inc.value;                                                                                 
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (10.2): Bad tid
requires isSharedAssignable(Cow._state[d]);                                                                // (10.2): Parameter VarDecl(ClassType(Cow),d) is not global
requires isShared(Inc._state[this]);                                                                       // (10.2): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);         
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);          
{                                                                                                   
 var x2805305: int;                                                                                 
 var Cow._state2805316: [Cow]State;                                                                 
 var $pc2805306_post: Phase;                                                                        
 var c2805313: Cow;                                                                                 
 var this2805313: Inc;                                                                              
 var $pc2805310_post: Phase;                                                                        
 var $recorded.state2805314: int;                                                                   
 var Cow._state2805306: [Cow]State;                                                                 
 var Cow._state2805314: [Cow]State;                                                                 
 var $recorded.state2805306_post: int;                                                              
 var Inc.next2805310_post: [Inc]Inc;                                                                
 var Inc.value2805316: [Inc]Cow;                                                                    
 var tid2805314: Tid;                                                                               
 var c2805310: Cow;                                                                                 
 var this2805309: Inc;                                                                              
 var tid2805316: Tid;                                                                               
 var y2805306_post: Cow;                                                                            
 var Cow._state2805305: [Cow]State;                                                                 
 var $pc2805305: Phase;                                                                             
 var x: int;                                                                                        
 var x2805310_post: int;                                                                            
 var tid2805305: Tid;                                                                               
 var path2805305: int;                                                                              
 var path2805313: int;                                                                              
 var tid2805306: Tid;                                                                               
 var Cow._lock2805306: [Cow]Tid;                                                                    
 var Cow._state2805310: [Cow]State;                                                                 
 var Inc.value2805306_post: [Inc]Cow;                                                               
 var Cow._lock2805305: [Cow]Tid;                                                                    
 var mover2805305: Mover;                                                                           
 var $recorded.state2805309: int;                                                                   
 var c2805306: Cow;                                                                                 
 var this2805305: Inc;                                                                              
 var moverPath2805309: MoverPath;                                                                   
 var $pc2805306: Phase;                                                                             
 var Cow._lock2805310_post: [Cow]Tid;                                                               
 var d2805309: Cow;                                                                                 
 var Cow._lock2805306_post: [Cow]Tid;                                                               
 var x2805316: int;                                                                                 
 var Inc.next2805313: [Inc]Inc;                                                                     
 var c2805305: Cow;                                                                                 
 var $recorded.state2805316: int;                                                                   
 var Inc._state2805309: [Inc]State;                                                                 
 var $recorded.state2805310_post: int;                                                              
 var moverPath2805305: MoverPath;                                                                   
 var c2805316: Cow;                                                                                 
 var d2805313: Cow;                                                                                 
 var tid2805313: Tid;                                                                               
 var Inc.next2805314: [Inc]Inc;                                                                     
 var Cow._state2805313: [Cow]State;                                                                 
 var Cow._lock2805316: [Cow]Tid;                                                                    
 var Inc.next2805305: [Inc]Inc;                                                                     
 var d2805305: Cow;                                                                                 
 var Inc.next2805306_post: [Inc]Inc;                                                                
 var tid2805309: Tid;                                                                               
 var d2805314: Cow;                                                                                 
 var this2805310_post: Inc;                                                                         
 var mover2805309: Mover;                                                                           
 var $recorded.state2805305: int;                                                                   
 var mover2805313: Mover;                                                                           
 var y2805306: Cow;                                                                                 
 var tid2805310: Tid;                                                                               
 var Inc._state2805305: [Inc]State;                                                                 
 var d2805306_post: Cow;                                                                            
 var $pc2805316: Phase;                                                                             
 var Cow._lock2805313: [Cow]Tid;                                                                    
 var Inc.value2805305: [Inc]Cow;                                                                    
 var Inc._lock2805314: [Inc]Tid;                                                                    
 var Inc._state2805316: [Inc]State;                                                                 
 var y2805316: Cow;                                                                                 
 var y2805310: Cow;                                                                                 
 var Inc._lock2805305: [Inc]Tid;                                                                    
 var this2805314: Inc;                                                                              
 var Cow._state2805309: [Cow]State;                                                                 
 var Inc._state2805314: [Inc]State;                                                                 
 var this2805306: Inc;                                                                              
 var Inc.value2805310: [Inc]Cow;                                                                    
 var Inc.value2805306: [Inc]Cow;                                                                    
 var d2805310: Cow;                                                                                 
 var y2805310_post: Cow;                                                                            
 var c2805314: Cow;                                                                                 
 var y2805313: Cow;                                                                                 
 var this2805306_post: Inc;                                                                         
 var Inc._lock2805306_post: [Inc]Tid;                                                               
 var x2805306_post: int;                                                                            
 var Inc.value2805309: [Inc]Cow;                                                                    
 var Inc._lock2805316: [Inc]Tid;                                                                    
 var y2805314: Cow;                                                                                 
 var x2805310: int;                                                                                 
 var Inc.value2805313: [Inc]Cow;                                                                    
 var $recorded.state2805306: int;                                                                   
 var x2805309: int;                                                                                 
 var x2805313: int;                                                                                 
 var y2805309: Cow;                                                                                 
 var Inc._lock2805306: [Inc]Tid;                                                                    
 var d2805310_post: Cow;                                                                            
 var Inc._lock2805310_post: [Inc]Tid;                                                               
 var Inc._lock2805310: [Inc]Tid;                                                                    
 var Inc._state2805306: [Inc]State;                                                                 
 var Inc.next2805310: [Inc]Inc;                                                                     
 var Cow._lock2805309: [Cow]Tid;                                                                    
 var moverPath2805313: MoverPath;                                                                   
 var Inc.value2805314: [Inc]Cow;                                                                    
 var $recorded.state2805310: int;                                                                   
 var Inc._lock2805313: [Inc]Tid;                                                                    
 var Inc._lock2805309: [Inc]Tid;                                                                    
 var Inc.value2805310_post: [Inc]Cow;                                                               
 var $pc2805313: Phase;                                                                             
 var c2805309: Cow;                                                                                 
 var $pc2805309: Phase;                                                                             
 var Cow._lock2805310: [Cow]Tid;                                                                    
 var this2805310: Inc;                                                                              
 var y: Cow;                                                                                        
 var Inc._state2805310_post: [Inc]State;                                                            
 var Inc._state2805313: [Inc]State;                                                                 
 var this2805316: Inc;                                                                              
 var $recorded.state2805313: int;                                                                   
 var c2805310_post: Cow;                                                                            
 var tid2805310_post: Tid;                                                                          
 var Cow._state2805306_post: [Cow]State;                                                            
 var Inc._state2805310: [Inc]State;                                                                 
 var $pc2805310: Phase;                                                                             
 var x2805314: int;                                                                                 
 var c: Cow;                                                                                        
 var d2805306: Cow;                                                                                 
 var $pc2805314: Phase;                                                                             
 var tid2805306_post: Tid;                                                                          
 var y2805305: Cow;                                                                                 
 var Cow._lock2805314: [Cow]Tid;                                                                    
 var Inc.next2805316: [Inc]Inc;                                                                     
 var x2805306: int;                                                                                 
 var c2805306_post: Cow;                                                                            
 var d2805316: Cow;                                                                                 
 var Inc.next2805306: [Inc]Inc;                                                                     
 var Inc.next2805309: [Inc]Inc;                                                                     
 var path2805309: int;                                                                              
 var Cow._state2805310_post: [Cow]State;                                                            
 var Inc._state2805306_post: [Inc]State;                                                            
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 11.3: int x;                                                                                    
                                                                                                    
                                                                                                    
 // 12.6: Cow c;                                                                                    
                                                                                                    
                                                                                                    
 // 12.6: c = new Cow();                                                                            
                                                                                                    
 havoc c;                                                                                           
 assume c != Cow.null && isFresh(Cow._state[c]);                                                    
 Cow._state[c] := LOCAL(tid);                                                                       
 assume Cow._lock[c]  == Tid.null;                                                                  
                                                                                                    
 // 13.6: c = new Cow();                                                                            
                                                                                                    
 havoc c;                                                                                           
 assume c != Cow.null && isFresh(Cow._state[c]);                                                    
 Cow._state[c] := LOCAL(tid);                                                                       
 assume Cow._lock[c]  == Tid.null;                                                                  
                                                                                                    
 // 14.3: Cow y;                                                                                    
                                                                                                    
                                                                                                    
 // 14.3: y := this.value;                                                                          
                                                                                                    
                                                                                                    
 moverPath2805305 := ReadEval.Inc.value(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 mover2805305 := m#moverPath(moverPath2805305);                                                     
 path2805305 := p#moverPath(moverPath2805305);                                                      
 assume Cow._state2805305 == Cow._state && Cow._lock2805305 == Cow._lock && Inc._state2805305 == Inc._state && Inc.next2805305 == Inc.next && Inc.value2805305 == Inc.value && Inc._lock2805305 == Inc._lock && y2805305 == y && c2805305 == c && x2805305 == x && d2805305 == d && this2805305 == this && tid2805305 == tid && $pc2805305 == $pc;
 assume $recorded.state2805305 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (14.3): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2805305);                                                              
 assert $pc != PhaseError;                                                                                 // (14.3): Reduction failure
 y := Inc.value[this];                                                                              
                                                                                                    
 // 15.3: yield;                                                                                    
                                                                                                    
 assume Cow._state2805306 == Cow._state && Cow._lock2805306 == Cow._lock && Inc._state2805306 == Inc._state && Inc.next2805306 == Inc.next && Inc.value2805306 == Inc.value && Inc._lock2805306 == Inc._lock && y2805306 == y && c2805306 == c && x2805306 == x && d2805306 == d && this2805306 == this && tid2805306 == tid;
 assume $recorded.state2805306 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2805306_post == Cow._state && Cow._lock2805306_post == Cow._lock && Inc._state2805306_post == Inc._state && Inc.next2805306_post == Inc.next && Inc.value2805306_post == Inc.value && Inc._lock2805306_post == Inc._lock && y2805306_post == y && c2805306_post == c && x2805306_post == x && d2805306_post == d && this2805306_post == this && tid2805306_post == tid;
 assume $recorded.state2805306_post == 1;                                                           
                                                                                                    
                                                                                                    
 // 16.3: this.value := y;                                                                          
                                                                                                    
                                                                                                    
 moverPath2805309 := WriteEval.Inc.value(tid: Tid,this: Inc,y: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 mover2805309 := m#moverPath(moverPath2805309);                                                     
 path2805309 := p#moverPath(moverPath2805309);                                                      
 assume Cow._state2805309 == Cow._state && Cow._lock2805309 == Cow._lock && Inc._state2805309 == Inc._state && Inc.next2805309 == Inc.next && Inc.value2805309 == Inc.value && Inc._lock2805309 == Inc._lock && y2805309 == y && c2805309 == c && x2805309 == x && d2805309 == d && this2805309 == this && tid2805309 == tid && $pc2805309 == $pc;
 assume $recorded.state2805309 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (16.3): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2805309);                                                              
 assert $pc != PhaseError;                                                                                 // (16.3): Reduction failure
 Inc.value[this] := y;                                                                              
 if (isLocal(Cow._state[y], tid)) {                                                                 
  Cow._state[y] := SHARED();                                                                        
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 17.3: yield;                                                                                    
                                                                                                    
 assume Cow._state2805310 == Cow._state && Cow._lock2805310 == Cow._lock && Inc._state2805310 == Inc._state && Inc.next2805310 == Inc.next && Inc.value2805310 == Inc.value && Inc._lock2805310 == Inc._lock && y2805310 == y && c2805310 == c && x2805310 == x && d2805310 == d && this2805310 == this && tid2805310 == tid;
 assume $recorded.state2805310 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2805310_post == Cow._state && Cow._lock2805310_post == Cow._lock && Inc._state2805310_post == Inc._state && Inc.next2805310_post == Inc.next && Inc.value2805310_post == Inc.value && Inc._lock2805310_post == Inc._lock && y2805310_post == y && c2805310_post == c && x2805310_post == x && d2805310_post == d && this2805310_post == this && tid2805310_post == tid;
 assume $recorded.state2805310_post == 1;                                                           
                                                                                                    
                                                                                                    
 // 18.3: this.next := this;                                                                        
                                                                                                    
                                                                                                    
 moverPath2805313 := WriteEval.Inc.next(tid: Tid,this: Inc,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 mover2805313 := m#moverPath(moverPath2805313);                                                     
 path2805313 := p#moverPath(moverPath2805313);                                                      
 assume Cow._state2805313 == Cow._state && Cow._lock2805313 == Cow._lock && Inc._state2805313 == Inc._state && Inc.next2805313 == Inc.next && Inc.value2805313 == Inc.value && Inc._lock2805313 == Inc._lock && y2805313 == y && c2805313 == c && x2805313 == x && d2805313 == d && this2805313 == this && tid2805313 == tid && $pc2805313 == $pc;
 assume $recorded.state2805313 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (18.3): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2805313);                                                              
 assert $pc != PhaseError;                                                                                 // (18.3): Reduction failure
 Inc.next[this] := this;                                                                            
 if (isLocal(Inc._state[this], tid)) {                                                              
  Inc._state[this] := SHARED();                                                                     
  assert isSharedAssignable(Inc._state[Inc.next[this]]);                                                   // (18.3): this became shared, but this.next may not be shared.
  assert isSharedAssignable(Cow._state[Inc.value[this]]);                                                  // (18.3): this became shared, but this.value may not be shared.
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 20.3:  return;                                                                                  
                                                                                                    
 assume Cow._state2805314 == Cow._state && Cow._lock2805314 == Cow._lock && Inc._state2805314 == Inc._state && Inc.next2805314 == Inc.next && Inc.value2805314 == Inc.value && Inc._lock2805314 == Inc._lock && y2805314 == y && c2805314 == c && x2805314 == x && d2805314 == d && this2805314 == this && tid2805314 == tid;
 assume $recorded.state2805314 == 1;                                                                
 return;                                                                                            
                                                                                                    
 // 10.26: // return;                                                                               
                                                                                                    
 assume Cow._state2805316 == Cow._state && Cow._lock2805316 == Cow._lock && Inc._state2805316 == Inc._state && Inc.next2805316 == Inc.next && Inc.value2805316 == Inc.value && Inc._lock2805316 == Inc._lock && y2805316 == y && c2805316 == c && x2805316 == x && d2805316 == d && this2805316 == this && tid2805316 == tid;
 assume $recorded.state2805316 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc.value: [Inc]Cow,Inc._lock: [Inc]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Inc  :: _i == Inc.null <==> isNull(Inc._state[_i])) &&                                
  (forall _i: Inc ::  (isShared(Inc._state[_i]) ==> isSharedAssignable(Inc._state[Inc.next[_i]]))) &&
  (forall _i: Inc ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Inc._state[_i],_t) ==> isLocalAssignable(Inc._state[Inc.next[_i]], _t)))) &&
  (forall _i: Inc ::  (isShared(Inc._state[_i]) ==> isSharedAssignable(Cow._state[Inc.value[_i]]))) &&
  (forall _i: Inc ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Inc._state[_i],_t) ==> isLocalAssignable(Cow._state[Inc.value[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, x: Inc)             
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.next;                                                                                 
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.next[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.next(u: Tid,x: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (7.2): Inc.next failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, x: Inc)              
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.next;                                                                                 
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.next[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Inc.next(u: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (7.2): Inc.next failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, x: Inc)              
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.next;                                                                                 
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Inc;                                                                              
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.next[x];                                                                           
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Inc.next[x] := havocValue;                                                                         
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.next(u: Tid,x: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (7.2): Inc.next failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, x: Inc)               
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.next;                                                                                 
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Inc;                                                                              
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.next[x];                                                                           
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Inc.next(u: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (7.2): Inc.next failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, x: Inc)                   
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.next;                                                                                 
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.next(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Inc.next(u: Tid,x: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.2): Inc.next failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, x: Inc)                    
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.next;                                                                                 
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Inc;                                                                              
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Inc.next[x];                                                                           
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.next(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Inc.next[x] := havocValue;                                                                         
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Inc.next(u: Tid,x: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.2): Inc.next failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Inc.value(t: Tid, u: Tid, v: Cow, w: Cow, x: Inc)            
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.value;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.value[x] := v;                                                                                 
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.value(u: Tid,x: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.2): Inc.value failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Inc.value(t: Tid, u: Tid, v: Cow, w: Cow, x: Inc)             
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.value;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.value[x] := v;                                                                                 
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Inc.value(u: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (8.2): Inc.value failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Inc.value(t: Tid, u: Tid, v: Cow, w: Cow, x: Inc)             
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.value;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Cow;                                                                              
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.value[x];                                                                          
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Inc.value[x] := havocValue;                                                                        
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.value(u: Tid,x: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.2): Inc.value failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Inc.value(t: Tid, u: Tid, v: Cow, w: Cow, x: Inc)              
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.value;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Cow;                                                                              
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.value[x];                                                                          
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Inc.value(u: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (8.2): Inc.value failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Inc.value(t: Tid, u: Tid, v: Cow, w: Cow, x: Inc)                  
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.value;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.value(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Inc.value(u: Tid,x: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.2): Inc.value failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Inc.value(t: Tid, u: Tid, v: Cow, w: Cow, x: Inc)                   
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.value;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Cow;                                                                              
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
 assume w == Inc.value[x];                                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.value(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Inc.value[x] := havocValue;                                                                        
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Inc.value(u: Tid,x: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.2): Inc.value failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.next.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.next;                                                                                 
 modifies Inc.next;                                                                                 
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.next[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.2): Inc.next is not Write-Write Stable with respect to Inc.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.2): Inc.next is not Write-Write Stable with respect to Inc.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.2): Inc.next is not Write-Write Stable with respect to Inc.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.next.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.next;                                                                                 
 modifies Inc.next;                                                                                 
                                                                                                    
 {                                                                                                  
 var tmpV : Inc;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_mid: Inc;                                                                                   
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var Inc.next_mid: [Inc]Inc;                                                                        
 var $recorded.state_mid: int;                                                                      
 var v_mid: Inc;                                                                                    
 var w_mid: Inc;                                                                                    
 var Inc.value_mid: [Inc]Cow;                                                                       
 var Inc._state_mid: [Inc]State;                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var Cow._state_mid: [Cow]State;                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.next[x];                                                                               
 Inc.next[x] := v;                                                                                  
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Inc._state_mid == Inc._state && Inc.next_mid == Inc.next && Inc.value_mid == Inc.value && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.next[x] := tmpV;                                                                               
 Inc.next[y] := w;                                                                                  
 _writeByTPost := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Inc.next is not Write-Write Stable with respect to Inc.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.next.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.next;                                                                                 
 modifies Inc.next;                                                                                 
                                                                                                    
 {                                                                                                  
 var tmpV : Inc;                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_mid: Inc;                                                                                   
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var Inc.next_mid: [Inc]Inc;                                                                        
 var $recorded.state_mid: int;                                                                      
 var v_mid: Inc;                                                                                    
 var w_mid: Inc;                                                                                    
 var Inc.value_mid: [Inc]Cow;                                                                       
 var Inc._state_mid: [Inc]State;                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var Cow._state_mid: [Cow]State;                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.next[x];                                                                               
 Inc.next[x] := v;                                                                                  
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Inc._state_mid == Inc._state && Inc.next_mid == Inc.next && Inc.value_mid == Inc.value && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.next[x] := tmpV;                                                                               
 Inc.next[y] := w;                                                                                  
 _writeByTPost := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Inc.next is not Write-Write Stable with respect to Inc.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Inc.next is not Write-Write Stable with respect to Inc.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.next.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.next;                                                                                 
 modifies Inc.next;                                                                                 
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.next(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.next[y] := w;                                                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.next(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Inc.next is not Read-Write Stable with respect to Inc.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Inc.next is not Read-Write Stable with respect to Inc.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Inc.next is not Read-Write Stable with respect to Inc.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.next.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.next;                                                                                 
 modifies Inc.next;                                                                                 
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.next(u: Tid,y: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.next[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.next(u: Tid,y: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.2): Inc.next is not Write-Read Stable with respect to Inc.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.2): Inc.next is not Write-Read Stable with respect to Inc.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.2): Inc.next is not Write-Read Stable with respect to Inc.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.next.Inc.value(t: Tid, u: Tid, v: Inc, w: Cow, w0: Cow, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.next;                                                                                 
 modifies Inc.value;                                                                                
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.value(u: Tid,y: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.next[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.value(u: Tid,y: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.2): Inc.value is not Write-Write Stable with respect to Inc.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.2): Inc.value is not Write-Write Stable with respect to Inc.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.2): Inc.value is not Write-Write Stable with respect to Inc.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.next.Inc.value(t: Tid, u: Tid, v: Inc, w: Cow, w0: Cow, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.next;                                                                                 
 modifies Inc.value;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Inc;                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var Inc.next_mid: [Inc]Inc;                                                                        
 var $recorded.state_mid: int;                                                                      
 var v_mid: Inc;                                                                                    
 var Inc.value_mid: [Inc]Cow;                                                                       
 var Inc._state_mid: [Inc]State;                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var Cow._state_mid: [Cow]State;                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.next[x];                                                                               
 Inc.next[x] := v;                                                                                  
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Inc._state_mid == Inc._state && Inc.next_mid == Inc.next && Inc.value_mid == Inc.value && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.value(u: Tid,y: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.next[x] := tmpV;                                                                               
 Inc.value[y] := w;                                                                                 
 _writeByTPost := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Inc.next is not Write-Write Stable with respect to Inc.value (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.next.Inc.value(t: Tid, u: Tid, v: Inc, w: Cow, w0: Cow, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.next;                                                                                 
 modifies Inc.value;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Inc;                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var Inc.next_mid: [Inc]Inc;                                                                        
 var $recorded.state_mid: int;                                                                      
 var v_mid: Inc;                                                                                    
 var Inc.value_mid: [Inc]Cow;                                                                       
 var Inc._state_mid: [Inc]State;                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var Cow._state_mid: [Cow]State;                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.value(u: Tid,y: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.next[x];                                                                               
 Inc.next[x] := v;                                                                                  
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Inc._state_mid == Inc._state && Inc.next_mid == Inc.next && Inc.value_mid == Inc.value && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.value(u: Tid,y: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.next[x] := tmpV;                                                                               
 Inc.value[y] := w;                                                                                 
 _writeByTPost := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Inc.next is not Write-Write Stable with respect to Inc.value (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Inc.next is not Write-Write Stable with respect to Inc.value (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.next.Inc.value(t: Tid, u: Tid, v: Inc, w: Cow, w0: Cow, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.next;                                                                                 
 modifies Inc.value;                                                                                
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.next(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.value(u: Tid,y: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.value[y] := w;                                                                                 
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.next(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Inc.next is not Read-Write Stable with respect to Inc.value (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Inc.next is not Read-Write Stable with respect to Inc.value (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Inc.next is not Read-Write Stable with respect to Inc.value (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.next.Inc.value(t: Tid, u: Tid, v: Inc, w: Cow, w0: Cow, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.next;                                                                                 
 modifies Inc.value;                                                                                
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var v_pre: Inc;                                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var v_post: Inc;                                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.value(u: Tid,y: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.next[x] := v;                                                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.value(u: Tid,y: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.2): Inc.value is not Write-Read Stable with respect to Inc.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.2): Inc.value is not Write-Read Stable with respect to Inc.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.2): Inc.value is not Write-Read Stable with respect to Inc.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.value.Inc.next(t: Tid, u: Tid, v: Cow, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.value;                                                                                
 modifies Inc.next;                                                                                 
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.value[x] := v;                                                                                 
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.2): Inc.next is not Write-Write Stable with respect to Inc.value (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.2): Inc.next is not Write-Write Stable with respect to Inc.value (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.2): Inc.next is not Write-Write Stable with respect to Inc.value (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.value.Inc.next(t: Tid, u: Tid, v: Cow, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.value;                                                                                
 modifies Inc.next;                                                                                 
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_mid: Inc;                                                                                   
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var Inc.next_mid: [Inc]Inc;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: Inc;                                                                                    
 var Inc.value_mid: [Inc]Cow;                                                                       
 var Inc._state_mid: [Inc]State;                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.value[x];                                                                              
 Inc.value[x] := v;                                                                                 
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Inc._state_mid == Inc._state && Inc.next_mid == Inc.next && Inc.value_mid == Inc.value && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.value[x] := tmpV;                                                                              
 Inc.next[y] := w;                                                                                  
 _writeByTPost := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.2): Inc.value is not Write-Write Stable with respect to Inc.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.value.Inc.next(t: Tid, u: Tid, v: Cow, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.value;                                                                                
 modifies Inc.next;                                                                                 
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_mid: Inc;                                                                                   
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var Inc.next_mid: [Inc]Inc;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: Inc;                                                                                    
 var Inc.value_mid: [Inc]Cow;                                                                       
 var Inc._state_mid: [Inc]State;                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.value[x];                                                                              
 Inc.value[x] := v;                                                                                 
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Inc._state_mid == Inc._state && Inc.next_mid == Inc.next && Inc.value_mid == Inc.value && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.value[x] := tmpV;                                                                              
 Inc.next[y] := w;                                                                                  
 _writeByTPost := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.2): Inc.value is not Write-Write Stable with respect to Inc.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.2): Inc.value is not Write-Write Stable with respect to Inc.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.value.Inc.next(t: Tid, u: Tid, v: Cow, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.value;                                                                                
 modifies Inc.next;                                                                                 
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.value(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.next[y] := w;                                                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.value(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.2): Inc.value is not Read-Write Stable with respect to Inc.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.2): Inc.value is not Read-Write Stable with respect to Inc.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.2): Inc.value is not Read-Write Stable with respect to Inc.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.value.Inc.next(t: Tid, u: Tid, v: Cow, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.value;                                                                                
 modifies Inc.next;                                                                                 
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.next(u: Tid,y: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.value[x] := v;                                                                                 
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.next(u: Tid,y: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.2): Inc.next is not Write-Read Stable with respect to Inc.value (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.2): Inc.next is not Write-Read Stable with respect to Inc.value (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.2): Inc.next is not Write-Read Stable with respect to Inc.value (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.value.Inc.value(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.value;                                                                                
 modifies Inc.value;                                                                                
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.value(u: Tid,y: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.value[x] := v;                                                                                 
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.value(u: Tid,y: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.2): Inc.value is not Write-Write Stable with respect to Inc.value (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.2): Inc.value is not Write-Write Stable with respect to Inc.value (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.2): Inc.value is not Write-Write Stable with respect to Inc.value (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.value.Inc.value(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.value;                                                                                
 modifies Inc.value;                                                                                
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var Inc.next_mid: [Inc]Inc;                                                                        
 var $recorded.state_mid: int;                                                                      
 var Inc.value_mid: [Inc]Cow;                                                                       
 var Inc._state_mid: [Inc]State;                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.value[x];                                                                              
 Inc.value[x] := v;                                                                                 
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Inc._state_mid == Inc._state && Inc.next_mid == Inc.next && Inc.value_mid == Inc.value && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.value(u: Tid,y: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.value[x] := tmpV;                                                                              
 Inc.value[y] := w;                                                                                 
 _writeByTPost := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.2): Inc.value is not Write-Write Stable with respect to Inc.value (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.value.Inc.value(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.value;                                                                                
 modifies Inc.value;                                                                                
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var Inc.next_mid: [Inc]Inc;                                                                        
 var $recorded.state_mid: int;                                                                      
 var Inc.value_mid: [Inc]Cow;                                                                       
 var Inc._state_mid: [Inc]State;                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: Cow;                                                                                    
 var w_mid: Cow;                                                                                    
 var w0_mid: Cow;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.value(u: Tid,y: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.value[x];                                                                              
 Inc.value[x] := v;                                                                                 
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Inc._state_mid == Inc._state && Inc.next_mid == Inc.next && Inc.value_mid == Inc.value && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.value(u: Tid,y: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.value[x] := tmpV;                                                                              
 Inc.value[y] := w;                                                                                 
 _writeByTPost := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.2): Inc.value is not Write-Write Stable with respect to Inc.value (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.2): Inc.value is not Write-Write Stable with respect to Inc.value (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.value.Inc.value(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.value;                                                                                
 modifies Inc.value;                                                                                
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.value(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.value(u: Tid,y: Inc,w: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.value[y] := w;                                                                                 
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.value(t: Tid,x: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.2): Inc.value is not Read-Write Stable with respect to Inc.value (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.2): Inc.value is not Read-Write Stable with respect to Inc.value (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.2): Inc.value is not Read-Write Stable with respect to Inc.value (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.value.Inc.value(t: Tid, u: Tid, v: Cow, w: Cow, w0: Cow, x: Inc, y: Inc)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.value;                                                                                
 modifies Inc.value;                                                                                
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc.value_pre: [Inc]Cow;                                                                       
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var w_pre: Cow;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Inc.next_pre: [Inc]Inc;                                                                        
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var w0_post: Cow;                                                                                  
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Inc._lock_post: [Inc]Tid;                                                                      
 var w_post: Cow;                                                                                   
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]Cow;                                                                      
 var u_post: Tid;                                                                                   
 var v_post: Cow;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.value(u: Tid,y: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.value[x] := v;                                                                                 
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.value(u: Tid,y: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.2): Inc.value is not Write-Read Stable with respect to Inc.value (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.2): Inc.value is not Write-Read Stable with respect to Inc.value (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.2): Inc.value is not Write-Read Stable with respect to Inc.value (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);         
requires ValidTid(tid);                                                                             
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Inc._state;                                                                                
modifies Inc.next;                                                                                  
modifies Inc.value;                                                                                 
modifies Inc._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);          
ensures Y(tid , old(Cow._state), old(Cow._lock), old(Inc._state), old(Inc.next), old(Inc.value), old(Inc._lock) , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
                                                                                                    
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Inc.value_yield: [Inc]Cow;                                                                      
var Inc.next_yield: [Inc]Inc;                                                                       
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock)), _N);
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.next_yield == Inc.next && Inc.value_yield == Inc.value && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var Inc.value_yield: [Inc]Cow;                                                                      
var Inc.next_yield: [Inc]Inc;                                                                       
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.next_yield == Inc.next && Inc.value_yield == Inc.value && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.next_p: [Inc]Inc, Inc.value_p: [Inc]Cow, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires StateInvariant(Cow._state_p, Cow._lock_p, Inc._state_p, Inc.next_p, Inc.value_p, Inc._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_pre: [Inc]State;                                                                     
var Inc.value_pre: [Inc]Cow;                                                                        
var Inc._lock_pre: [Inc]Tid;                                                                        
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Inc.next_pre: [Inc]Inc;                                                                         
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
                                                                                                    
var Inc.next_post: [Inc]Inc;                                                                        
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
var Inc.value_post: [Inc]Cow;                                                                       
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.next_p, Inc.value_p, Inc._lock_p);
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.next_p, Inc.value_p, Inc._lock_p);
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Inc._state_post == Inc._state_p && Inc.next_post == Inc.next_p && Inc.value_post == Inc.value_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
}                                                                                                   
// Inc.next:                                                                                        
                                                                                                    
function {:inline} Y_Inc.next(tid : Tid, this: Inc, newValue: Inc , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc.next(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock)), _R)) ==> (Inc.next[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.next(tid : Tid, this: Inc, newValue: Inc , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc.next.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: Inc , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.value_yield: [Inc]Cow;                                                                      
var Inc.next_yield: [Inc]Inc;                                                                       
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
var newValue_yield: Inc;                                                                            
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc.next(u: Tid,this: Inc,newValue: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.next_yield == Inc.next && Inc.value_yield == Inc.value && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.next(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc.next.Reflexive(tid : Tid, this: Inc , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.value_yield: [Inc]Cow;                                                                      
var Inc.next_yield: [Inc]Inc;                                                                       
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.next_yield == Inc.next && Inc.value_yield == Inc.value && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.next(tid, this, Inc.next[this] , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc.next.Transitive(tid : Tid, this: Inc, newValue : Inc , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.next_p: [Inc]Inc, Inc.value_p: [Inc]Cow, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires StateInvariant(Cow._state_p, Cow._lock_p, Inc._state_p, Inc.next_p, Inc.value_p, Inc._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_pre: [Inc]State;                                                                     
var Inc.value_pre: [Inc]Cow;                                                                        
var Inc._lock_pre: [Inc]Tid;                                                                        
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Inc.next_pre: [Inc]Inc;                                                                         
var newValue_pre: Inc;                                                                              
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
                                                                                                    
var Inc.next_post: [Inc]Inc;                                                                        
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var newValue_post: Inc;                                                                             
var Inc._lock_post: [Inc]Tid;                                                                       
var Inc.value_post: [Inc]Cow;                                                                       
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.next_p, Inc.value_p, Inc._lock_p);
 assume Y_Inc.next(tid, this, newValue , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.next_p, Inc.value_p, Inc._lock_p);
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Inc._state_post == Inc._state_p && Inc.next_post == Inc.next_p && Inc.value_post == Inc.value_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc.next(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
}                                                                                                   
// Inc.value:                                                                                       
                                                                                                    
function {:inline} Y_Inc.value(tid : Tid, this: Inc, newValue: Cow , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc.value(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock)), _R)) ==> (Inc.value[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.value(tid : Tid, this: Inc, newValue: Cow , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc.value.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: Cow , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Cow;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.value_yield: [Inc]Cow;                                                                      
var Inc.next_yield: [Inc]Inc;                                                                       
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc.value(u: Tid,this: Inc,newValue: Cow,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.next_yield == Inc.next && Inc.value_yield == Inc.value && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.value(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc.value.Reflexive(tid : Tid, this: Inc , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.value_yield: [Inc]Cow;                                                                      
var Inc.next_yield: [Inc]Inc;                                                                       
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.next_yield == Inc.next && Inc.value_yield == Inc.value && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.value(tid, this, Inc.value[this] , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc.value.Transitive(tid : Tid, this: Inc, newValue : Cow , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.next_p: [Inc]Inc, Inc.value_p: [Inc]Cow, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires StateInvariant(Cow._state_p, Cow._lock_p, Inc._state_p, Inc.next_p, Inc.value_p, Inc._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_pre: [Inc]State;                                                                     
var Inc.value_pre: [Inc]Cow;                                                                        
var Inc._lock_pre: [Inc]Tid;                                                                        
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: Cow;                                                                              
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Inc.next_pre: [Inc]Inc;                                                                         
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
                                                                                                    
var Inc.next_post: [Inc]Inc;                                                                        
var newValue_post: Cow;                                                                             
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Inc._lock_post: [Inc]Tid;                                                                       
var Inc.value_post: [Inc]Cow;                                                                       
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.next_p, Inc.value_p, Inc._lock_p);
 assume Y_Inc.value(tid, this, newValue , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.next_p, Inc.value_p, Inc._lock_p);
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Inc._state_post == Inc._state_p && Inc.next_post == Inc.next_p && Inc.value_post == Inc.value_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc.value(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
}                                                                                                   
// Inc._lock:                                                                                       
                                                                                                    
function {:inline} Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock)), _R)) ==> (Inc._lock[this] == newValue))
 &&(((Inc._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.value_yield: [Inc]Cow;                                                                      
var Inc.next_yield: [Inc]Inc;                                                                       
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc._lock(u: Tid,this: Inc,newValue: Tid,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock)));
 assume leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Cow._state,Cow._lock,Inc._state,Inc.next,Inc.value,Inc._lock)), _N);
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.next_yield == Inc.next && Inc.value_yield == Inc.value && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Reflexive(tid : Tid, this: Inc , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var Inc.value_yield: [Inc]Cow;                                                                      
var Inc.next_yield: [Inc]Inc;                                                                       
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Inc._state_yield == Inc._state && Inc.next_yield == Inc.next && Inc.value_yield == Inc.value && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, Inc._lock[this] , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Transitive(tid : Tid, this: Inc, newValue : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.next_p: [Inc]Inc, Inc.value_p: [Inc]Cow, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);        
 requires StateInvariant(Cow._state_p, Cow._lock_p, Inc._state_p, Inc.next_p, Inc.value_p, Inc._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_pre: [Inc]State;                                                                     
var Inc.value_pre: [Inc]Cow;                                                                        
var Inc._lock_pre: [Inc]Tid;                                                                        
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Inc.next_pre: [Inc]Inc;                                                                         
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var Inc.next_post: [Inc]Inc;                                                                        
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
var Inc.value_post: [Inc]Cow;                                                                       
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.next_p, Inc.value_p, Inc._lock_p);
 assume Y_Inc._lock(tid, this, newValue , Cow._state_p, Cow._lock_p, Inc._state_p, Inc.next_p, Inc.value_p, Inc._lock_p);
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Inc._state_post == Inc._state_p && Inc.next_post == Inc.next_p && Inc.value_post == Inc.value_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc._lock(tid, this, newValue , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc.value: [Inc]Cow, Inc._lock: [Inc]Tid , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Inc._state_p: [Inc]State, Inc.next_p: [Inc]Inc, Inc.value_p: [Inc]Cow, Inc._lock_p: [Inc]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock))
 && (forall this: Inc :: Y_Inc.next(tid : Tid, this, Inc.next_p[this] , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock))
 && (forall this: Inc :: Y_Inc.value(tid : Tid, this, Inc.value_p[this] , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock))
 && (forall this: Inc :: Y_Inc._lock(tid : Tid, this, Inc._lock_p[this] , Cow._state, Cow._lock, Inc._state, Inc.next, Inc.value, Inc._lock))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
 && (forall _i : Inc :: isShared(Inc._state[_i]) ==> isShared(Inc._state_p[_i]))                    
 && (forall _i : Inc :: isLocal(Inc._state[_i], tid) <==> isLocal(Inc._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 602.1-880.2: (Method:10.2)
// 612.1-612.24: (10.2): Bad tid
// 613.1-613.44: (10.2): Parameter VarDecl(ClassType(Cow),d) is not global
// 614.1-614.37: (10.2): this is not global
// 763.2-765.2: (class anchor.sink.VarDeclStmt:11.3)
// 766.2-768.2: (class anchor.sink.VarDeclStmt:12.6)
// 769.2-775.35: (class anchor.sink.Alloc:12.6)
// 776.2-782.35: (class anchor.sink.Alloc:13.6)
// 783.2-785.2: (class anchor.sink.VarDeclStmt:14.3)
// 786.2-803.23: (class anchor.sink.Read:14.3)
// 798.1-798.27: (14.3): Cannot have potential null deference in left-mover part.
// 802.1-802.27: (14.3): Reduction failure
// 804.2-812.42: (class anchor.sink.Yield:15.3)
// 814.2-834.2: (class anchor.sink.Write:16.3)
// 826.1-826.27: (16.3): Cannot have potential null deference in left-mover part.
// 829.1-829.27: (16.3): Reduction failure
// 835.2-843.42: (class anchor.sink.Yield:17.3)
// 845.2-867.2: (class anchor.sink.Write:18.3)
// 857.1-857.27: (18.3): Cannot have potential null deference in left-mover part.
// 860.1-860.27: (18.3): Reduction failure
// 864.1-864.57: (18.3): this became shared, but this.next may not be shared.
// 865.1-865.58: (18.3): this became shared, but this.value may not be shared.
// 868.2-873.9: (class anchor.sink.Return:20.3)
// 874.2-879.9: (class anchor.sink.Return:10.26)
// 965.1-965.34: (7.2): Inc.next failed Write-Write Right-Mover Check
// 1028.1-1028.30: (7.2): Inc.next failed Write-Read Right-Mover Check
// 1095.1-1095.34: (7.2): Inc.next failed Write-Write Left-Mover Check
// 1159.1-1159.30: (7.2): Inc.next failed Write-Read Left-Mover Check
// 1220.1-1220.34: (7.2): Inc.next failed Read-Write Right-Mover Check
// 1284.1-1284.34: (7.2): Inc.next failed Read-Write Left-Mover Check
// 1347.1-1347.34: (8.2): Inc.value failed Write-Write Right-Mover Check
// 1410.1-1410.30: (8.2): Inc.value failed Write-Read Right-Mover Check
// 1477.1-1477.34: (8.2): Inc.value failed Write-Write Left-Mover Check
// 1541.1-1541.30: (8.2): Inc.value failed Write-Read Left-Mover Check
// 1602.1-1602.34: (8.2): Inc.value failed Read-Write Right-Mover Check
// 1666.1-1666.34: (8.2): Inc.value failed Read-Write Left-Mover Check
// 1741.1-1741.140: (7.2): Inc.next is not Write-Write Stable with respect to Inc.next (case A.1)
// 1742.1-1742.101: (7.2): Inc.next is not Write-Write Stable with respect to Inc.next (case A.2)
// 1743.1-1743.158: (7.2): Inc.next is not Write-Write Stable with respect to Inc.next (case A.3)
// 1845.1-1845.140: (7.2): Inc.next is not Write-Write Stable with respect to Inc.next (case C)
// 1952.1-1952.144: (7.2): Inc.next is not Write-Write Stable with respect to Inc.next (case D)
// 1953.1-1953.144: (7.2): Inc.next is not Write-Write Stable with respect to Inc.next (case R)
// 2028.1-2028.136: (7.2): Inc.next is not Read-Write Stable with respect to Inc.next (case F)
// 2029.1-2029.136: (7.2): Inc.next is not Read-Write Stable with respect to Inc.next (case H)
// 2030.1-2030.146: (7.2): Inc.next is not Read-Write Stable with respect to Inc.next (case I)
// 2104.1-2104.136: (7.2): Inc.next is not Write-Read Stable with respect to Inc.next (case J)
// 2105.1-2105.136: (7.2): Inc.next is not Write-Read Stable with respect to Inc.next (case K)
// 2106.1-2106.99: (7.2): Inc.next is not Write-Read Stable with respect to Inc.next (case L)
// 2182.1-2182.140: (8.2): Inc.value is not Write-Write Stable with respect to Inc.next (case A.1)
// 2183.1-2183.101: (8.2): Inc.value is not Write-Write Stable with respect to Inc.next (case A.2)
// 2184.1-2184.158: (8.2): Inc.value is not Write-Write Stable with respect to Inc.next (case A.3)
// 2286.1-2286.140: (7.2): Inc.next is not Write-Write Stable with respect to Inc.value (case C)
// 2393.1-2393.144: (7.2): Inc.next is not Write-Write Stable with respect to Inc.value (case D)
// 2394.1-2394.144: (7.2): Inc.next is not Write-Write Stable with respect to Inc.value (case R)
// 2469.1-2469.136: (7.2): Inc.next is not Read-Write Stable with respect to Inc.value (case F)
// 2470.1-2470.136: (7.2): Inc.next is not Read-Write Stable with respect to Inc.value (case H)
// 2471.1-2471.146: (7.2): Inc.next is not Read-Write Stable with respect to Inc.value (case I)
// 2545.1-2545.136: (8.2): Inc.value is not Write-Read Stable with respect to Inc.next (case J)
// 2546.1-2546.136: (8.2): Inc.value is not Write-Read Stable with respect to Inc.next (case K)
// 2547.1-2547.99: (8.2): Inc.value is not Write-Read Stable with respect to Inc.next (case L)
// 2623.1-2623.140: (7.2): Inc.next is not Write-Write Stable with respect to Inc.value (case A.1)
// 2624.1-2624.101: (7.2): Inc.next is not Write-Write Stable with respect to Inc.value (case A.2)
// 2625.1-2625.158: (7.2): Inc.next is not Write-Write Stable with respect to Inc.value (case A.3)
// 2727.1-2727.140: (8.2): Inc.value is not Write-Write Stable with respect to Inc.next (case C)
// 2834.1-2834.144: (8.2): Inc.value is not Write-Write Stable with respect to Inc.next (case D)
// 2835.1-2835.144: (8.2): Inc.value is not Write-Write Stable with respect to Inc.next (case R)
// 2910.1-2910.136: (8.2): Inc.value is not Read-Write Stable with respect to Inc.next (case F)
// 2911.1-2911.136: (8.2): Inc.value is not Read-Write Stable with respect to Inc.next (case H)
// 2912.1-2912.146: (8.2): Inc.value is not Read-Write Stable with respect to Inc.next (case I)
// 2986.1-2986.136: (7.2): Inc.next is not Write-Read Stable with respect to Inc.value (case J)
// 2987.1-2987.136: (7.2): Inc.next is not Write-Read Stable with respect to Inc.value (case K)
// 2988.1-2988.99: (7.2): Inc.next is not Write-Read Stable with respect to Inc.value (case L)
// 3064.1-3064.140: (8.2): Inc.value is not Write-Write Stable with respect to Inc.value (case A.1)
// 3065.1-3065.101: (8.2): Inc.value is not Write-Write Stable with respect to Inc.value (case A.2)
// 3066.1-3066.158: (8.2): Inc.value is not Write-Write Stable with respect to Inc.value (case A.3)
// 3168.1-3168.140: (8.2): Inc.value is not Write-Write Stable with respect to Inc.value (case C)
// 3275.1-3275.144: (8.2): Inc.value is not Write-Write Stable with respect to Inc.value (case D)
// 3276.1-3276.144: (8.2): Inc.value is not Write-Write Stable with respect to Inc.value (case R)
// 3351.1-3351.136: (8.2): Inc.value is not Read-Write Stable with respect to Inc.value (case F)
// 3352.1-3352.136: (8.2): Inc.value is not Read-Write Stable with respect to Inc.value (case H)
// 3353.1-3353.146: (8.2): Inc.value is not Read-Write Stable with respect to Inc.value (case I)
// 3427.1-3427.136: (8.2): Inc.value is not Write-Read Stable with respect to Inc.value (case J)
// 3428.1-3428.136: (8.2): Inc.value is not Write-Read Stable with respect to Inc.value (case K)
// 3429.1-3429.99: (8.2): Inc.value is not Write-Read Stable with respect to Inc.value (case L)
// 3464.1-3486.2: (7.32): yields_as clause for Cow._lock is not valid
// 3491.1-3508.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 3514.1-3548.2: (7.32): yields_as clause for Cow._lock is not transitive
// 3567.1-3589.2: (7.2): yields_as clause for Inc.next is not valid
// 3594.1-3611.2: (7.2): yields_as clause for Inc.next is not reflexive
// 3617.1-3651.2: (7.2): yields_as clause for Inc.next is not transitive
// 3670.1-3692.2: (8.2): yields_as clause for Inc.value is not valid
// 3697.1-3714.2: (8.2): yields_as clause for Inc.value is not reflexive
// 3720.1-3754.2: (8.2): yields_as clause for Inc.value is not transitive
// 3774.1-3796.2: (7.32): yields_as clause for Inc._lock is not valid
// 3801.1-3818.2: (7.32): yields_as clause for Inc._lock is not reflexive
// 3824.1-3858.2: (7.32): yields_as clause for Inc._lock is not transitive
