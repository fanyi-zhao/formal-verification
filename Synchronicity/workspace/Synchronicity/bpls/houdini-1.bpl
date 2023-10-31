                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/houdini-1.sink:                         
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
       int x N                                                                                      
                                                                                                    
      invariant  p1 ==> this.x != 0;                                                                
      invariant  p2 ==> this.x == 0;                                                                
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc() {                                                                           
        this.x := 0;                                                                                
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Inc2 {                                                                                    
       int x N                                                                                      
                                                                                                    
      invariant  this.x != 0;                                                                       
      invariant  this.x == 0;                                                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2() {                                                                          
        this.x := 0;                                                                                
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Main {                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void main() {                                                                          
        Inc i;                                                                                      
        i = new Inc();                                                                              
        i.x := 0;                                                                                   
        yield;                                                                                      
        i.inc()                                                                                     
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
    boolean p1;                                                                                     
    boolean p2;                                                                                     
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  p1 ==> this.x != 0;                                                                
      invariant  p2 ==> this.x == 0;                                                                
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc() {                                                                           
        this.x := 0;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Inc2 {                                                                                    
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
      invariant  this.x == 0;                                                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2() {                                                                          
        this.x := 0;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Main {                                                                                    
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
      public void main() {                                                                          
        Inc i;                                                                                      
        i = new Inc();                                                                              
        i.x := 0;                                                                                   
        yield;                                                                                      
        i.inc()                                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    boolean p1;                                                                                     
    boolean p2;                                                                                     
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  p1 ==> this.x != 0;                                                                
      invariant  p2 ==> this.x == 0;                                                                
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc() {                                                                           
        this.x := 0;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Inc2 {                                                                                    
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
      invariant  this.x == 0;                                                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2() {                                                                          
        this.x := 0;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Main {                                                                                    
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
      public void main() {                                                                          
        Inc i;                                                                                      
        i = new Inc();                                                                              
        i.x := 0;                                                                                   
        yield;                                                                                      
        {                                                                                           
          inlined i.inc();                                                                          
          exit$169: {                                                                               
            Inc this$169;                                                                           
            this$169 = i;                                                                           
            {                                                                                       
              this$169.x := 0;                                                                      
              {                                                                                     
                break exit$169;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    boolean p1;                                                                                     
    boolean p2;                                                                                     
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  p1 ==> this.x != 0;                                                                
      invariant  p2 ==> this.x == 0;                                                                
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc() {                                                                           
        this.x := 0;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Inc2 {                                                                                    
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
      invariant  this.x == 0;                                                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc2() {                                                                          
        this.x := 0;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Main {                                                                                    
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
      public void main() {                                                                          
        Inc i;                                                                                      
        i = new Inc();                                                                              
        i.x := 0;                                                                                   
        yield;                                                                                      
        {                                                                                           
          inlined i.inc();                                                                          
          exit$169: {                                                                               
            Inc this$169;                                                                           
            this$169 = i;                                                                           
            {                                                                                       
              this$169.x := 0;                                                                      
              {                                                                                     
                break exit$169;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    boolean p1;                                                                                     
    boolean p2;                                                                                     
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
/*** Class Decl Inc ***/                                                                            
                                                                                                    
type Inc;                                                                                           
const unique Inc.null: Inc;                                                                         
var Inc._state: [Inc]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc.x: [Inc]int;                                                                                
                                                                                                    
function {:inline} ReadEval.Inc.x(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc.x(tid: Tid,this : Inc,newValue: int,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc._lock: [Inc]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Inc._lock(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Inc._lock(tid: Tid,this : Inc,newValue: Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} Invariant.Inc.2058827(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (bool) {
 (Inc.x[this]==0)                                                                                   
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Inc.inc(tid:Tid, this : Inc)                                                             
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
modifies Inc2._state;                                                                               
modifies Inc2.x;                                                                                    
modifies Inc2._lock;                                                                                
modifies Main._state;                                                                               
modifies Main._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (13.2): Bad tid
requires isShared(Inc._state[this]);                                                                       // (13.2): this is not global
                                                                                                    
requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (13.2): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (13.2): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (13.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (13.2): Object invariant may not hold.
ensures  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (13.2): Object invariant may not hold.
ensures  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (13.2): Object invariant may not hold.
{                                                                                                   
 var Inc._lock2058814: [Inc]Tid;                                                                    
 var Inc._state2058813: [Inc]State;                                                                 
 var $recorded.state2058813: int;                                                                   
 var mover2058813: Mover;                                                                           
 var $pc2058813: Phase;                                                                             
 var Main._state2058813: [Main]State;                                                               
 var Inc.x2058814: [Inc]int;                                                                        
 var Main._lock2058814: [Main]Tid;                                                                  
 var Inc.x2058813: [Inc]int;                                                                        
 var moverPath2058813: MoverPath;                                                                   
 var this2058814: Inc;                                                                              
 var $recorded.state2058814: int;                                                                   
 var path2058813: int;                                                                              
 var Inc._lock2058813: [Inc]Tid;                                                                    
 var Inc2._state2058813: [Inc2]State;                                                               
 var Inc2._lock2058814: [Inc2]Tid;                                                                  
 var Inc2._state2058814: [Inc2]State;                                                               
 var $pc2058814: Phase;                                                                             
 var Inc._state2058814: [Inc]State;                                                                 
 var tid2058813: Tid;                                                                               
 var Inc2.x2058814: [Inc2]int;                                                                      
 var Inc2.x2058813: [Inc2]int;                                                                      
 var Main._state2058814: [Main]State;                                                               
 var this2058813: Inc;                                                                              
 var tid2058814: Tid;                                                                               
 var Inc2._lock2058813: [Inc2]Tid;                                                                  
 var Main._lock2058813: [Main]Tid;                                                                  
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 // 14.9: this.x := 0;                                                                              
                                                                                                    
                                                                                                    
 moverPath2058813 := WriteEval.Inc.x(tid: Tid,this: Inc,0: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 mover2058813 := m#moverPath(moverPath2058813);                                                     
 path2058813 := p#moverPath(moverPath2058813);                                                      
 assume Inc._state2058813 == Inc._state && Inc.x2058813 == Inc.x && Inc._lock2058813 == Inc._lock && Inc2._state2058813 == Inc2._state && Inc2.x2058813 == Inc2.x && Inc2._lock2058813 == Inc2._lock && Main._state2058813 == Main._state && Main._lock2058813 == Main._lock && this2058813 == this && tid2058813 == tid && $pc2058813 == $pc;
 assume $recorded.state2058813 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (14.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2058813);                                                              
 assert $pc != PhaseError;                                                                                 // (14.9): Reduction failure
 Inc.x[this] := 0;                                                                                  
                                                                                                    
 // 13.21: // return;                                                                               
                                                                                                    
 assume Inc._state2058814 == Inc._state && Inc.x2058814 == Inc.x && Inc._lock2058814 == Inc._lock && Inc2._state2058814 == Inc2._state && Inc2.x2058814 == Inc2.x && Inc2._lock2058814 == Inc2._lock && Main._state2058814 == Main._state && Main._lock2058814 == Main._lock && this2058814 == this && tid2058814 == tid;
 assume $recorded.state2058814 == 1;                                                                
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (13.21): Object invariant may not hold.
 assert  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (13.21): Object invariant may not hold.
 assert  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (13.21): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl Inc2 ***/                                                                           
                                                                                                    
type Inc2;                                                                                          
const unique Inc2.null: Inc2;                                                                       
var Inc2._state: [Inc2]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc2.x: [Inc2]int;                                                                              
                                                                                                    
function {:inline} ReadEval.Inc2.x(tid: Tid,this : Inc2,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc2.x(tid: Tid,this : Inc2,newValue: int,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc2._lock: [Inc2]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Inc2._lock(tid: Tid,this : Inc2,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Inc2._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc2._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Inc2._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Inc2._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc2._lock(tid: Tid,this : Inc2,newValue: Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc2._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc2._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Inc2._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Inc2._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
function {:inline} Invariant.Inc2.2058938(tid: Tid,this : Inc2,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (bool) {
 (Inc2.x[this]!=0)                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Inc2.2058945(tid: Tid,this : Inc2,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (bool) {
 (Inc2.x[this]==0)                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Inc2.inc2(tid:Tid, this : Inc2)                                                          
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
modifies Inc2._state;                                                                               
modifies Inc2.x;                                                                                    
modifies Inc2._lock;                                                                                
modifies Main._state;                                                                               
modifies Main._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (27.2): Bad tid
requires isShared(Inc2._state[this]);                                                                      // (27.2): this is not global
                                                                                                    
requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (27.2): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (27.2): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (27.2): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (27.2): Object invariant may not hold.
ensures  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (27.2): Object invariant may not hold.
ensures  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (27.2): Object invariant may not hold.
{                                                                                                   
 var $pc2058927: Phase;                                                                             
 var this2058928: Inc2;                                                                             
 var Main._state2058927: [Main]State;                                                               
 var Inc.x2058928: [Inc]int;                                                                        
 var Inc.x2058927: [Inc]int;                                                                        
 var Inc2.x2058928: [Inc2]int;                                                                      
 var $recorded.state2058927: int;                                                                   
 var this2058927: Inc2;                                                                             
 var Inc2.x2058927: [Inc2]int;                                                                      
 var Main._lock2058928: [Main]Tid;                                                                  
 var Inc._state2058928: [Inc]State;                                                                 
 var $recorded.state2058928: int;                                                                   
 var Inc2._state2058928: [Inc2]State;                                                               
 var tid2058927: Tid;                                                                               
 var Inc._lock2058927: [Inc]Tid;                                                                    
 var mover2058927: Mover;                                                                           
 var Inc2._lock2058927: [Inc2]Tid;                                                                  
 var Inc._state2058927: [Inc]State;                                                                 
 var moverPath2058927: MoverPath;                                                                   
 var Inc._lock2058928: [Inc]Tid;                                                                    
 var Inc2._lock2058928: [Inc2]Tid;                                                                  
 var Main._lock2058927: [Main]Tid;                                                                  
 var tid2058928: Tid;                                                                               
 var $pc2058928: Phase;                                                                             
 var Main._state2058928: [Main]State;                                                               
 var Inc2._state2058927: [Inc2]State;                                                               
 var path2058927: int;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 // 28.9: this.x := 0;                                                                              
                                                                                                    
                                                                                                    
 moverPath2058927 := WriteEval.Inc2.x(tid: Tid,this: Inc2,0: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 mover2058927 := m#moverPath(moverPath2058927);                                                     
 path2058927 := p#moverPath(moverPath2058927);                                                      
 assume Inc._state2058927 == Inc._state && Inc.x2058927 == Inc.x && Inc._lock2058927 == Inc._lock && Inc2._state2058927 == Inc2._state && Inc2.x2058927 == Inc2.x && Inc2._lock2058927 == Inc2._lock && Main._state2058927 == Main._state && Main._lock2058927 == Main._lock && this2058927 == this && tid2058927 == tid && $pc2058927 == $pc;
 assume $recorded.state2058927 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc2.null;                                                                         
 } else {                                                                                           
  assert this != Inc2.null;                                                                                // (28.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2058927);                                                              
 assert $pc != PhaseError;                                                                                 // (28.9): Reduction failure
 Inc2.x[this] := 0;                                                                                 
                                                                                                    
 // 27.22: // return;                                                                               
                                                                                                    
 assume Inc._state2058928 == Inc._state && Inc.x2058928 == Inc.x && Inc._lock2058928 == Inc._lock && Inc2._state2058928 == Inc2._state && Inc2.x2058928 == Inc2.x && Inc2._lock2058928 == Inc2._lock && Main._state2058928 == Main._state && Main._lock2058928 == Main._lock && this2058928 == this && tid2058928 == tid;
 assume $recorded.state2058928 == 1;                                                                
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (27.22): Object invariant may not hold.
 assert  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (27.22): Object invariant may not hold.
 assert  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (27.22): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl Main ***/                                                                           
                                                                                                    
type Main;                                                                                          
const unique Main.null: Main;                                                                       
var Main._state: [Main]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Main._lock: [Main]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Main._lock(tid: Tid,this : Main,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Main._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Main._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Main._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Main._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Main._lock(tid: Tid,this : Main,newValue: Tid,Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Main._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Main._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Main._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Main._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Main.main(tid:Tid, this : Main)                                                          
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
modifies Inc2._state;                                                                               
modifies Inc2.x;                                                                                    
modifies Inc2._lock;                                                                                
modifies Main._state;                                                                               
modifies Main._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (34.3): Bad tid
requires isShared(Main._state[this]);                                                                      // (34.3): this is not global
                                                                                                    
requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (34.3): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (34.3): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (34.3): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (34.3): Object invariant may not hold.
ensures  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (34.3): Object invariant may not hold.
ensures  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (34.3): Object invariant may not hold.
{                                                                                                   
 var Inc._lock2059048: [Inc]Tid;                                                                    
 var Inc2._lock2059061: [Inc2]Tid;                                                                  
 var Inc2._lock2059048: [Inc2]Tid;                                                                  
 var moverPath2059047: MoverPath;                                                                   
 var Main._lock2059048: [Main]Tid;                                                                  
 var Inc._state2059061: [Inc]State;                                                                 
 var this2059068: Main;                                                                             
 var Main._lock2059047: [Main]Tid;                                                                  
 var Inc2.x2059061: [Inc2]int;                                                                      
 var Inc2.x2059048_post: [Inc2]int;                                                                 
 var Inc2.x2059047: [Inc2]int;                                                                      
 var tid2059048_post: Tid;                                                                          
 var Inc._state2059048_post: [Inc]State;                                                            
 var tid2059061: Tid;                                                                               
 var this2059048: Main;                                                                             
 var Inc._lock2059061: [Inc]Tid;                                                                    
 var $pc2059061: Phase;                                                                             
 var Inc.x2059047: [Inc]int;                                                                        
 var this2059061: Main;                                                                             
 var Main._state2059061: [Main]State;                                                               
 var Inc._state2059068: [Inc]State;                                                                 
 var Inc2._state2059061: [Inc2]State;                                                               
 var Main._lock2059068: [Main]Tid;                                                                  
 var mover2059047: Mover;                                                                           
 var $pc2059068: Phase;                                                                             
 var $recorded.state2059068: int;                                                                   
 var tid2059047: Tid;                                                                               
 var Main._lock2059048_post: [Main]Tid;                                                             
 var path2059047: int;                                                                              
 var tid2059068: Tid;                                                                               
 var Main._state2059047: [Main]State;                                                               
 var i: Inc;                                                                                        
 var i2059061: Inc;                                                                                 
 var Inc2._lock2059047: [Inc2]Tid;                                                                  
 var i2059068: Inc;                                                                                 
 var tid2059048: Tid;                                                                               
 var this$169: Inc;                                                                                 
 var Inc2._state2059047: [Inc2]State;                                                               
 var mover2059061: Mover;                                                                           
 var i2059047: Inc;                                                                                 
 var Inc.x2059048_post: [Inc]int;                                                                   
 var $recorded.state2059061: int;                                                                   
 var Inc2._state2059048_post: [Inc2]State;                                                          
 var $recorded.state2059047: int;                                                                   
 var $pc2059048: Phase;                                                                             
 var Inc2._state2059048: [Inc2]State;                                                               
 var Main._state2059048_post: [Main]State;                                                          
 var Inc.x2059061: [Inc]int;                                                                        
 var $pc2059047: Phase;                                                                             
 var Inc._state2059047: [Inc]State;                                                                 
 var moverPath2059061: MoverPath;                                                                   
 var Main._lock2059061: [Main]Tid;                                                                  
 var Main._state2059068: [Main]State;                                                               
 var $pc2059048_post: Phase;                                                                        
 var $recorded.state2059048: int;                                                                   
 var path2059061: int;                                                                              
 var this2059047: Main;                                                                             
 var this$1692059061: Inc;                                                                          
 var Inc.x2059048: [Inc]int;                                                                        
 var $recorded.state2059048_post: int;                                                              
 var Inc2._state2059068: [Inc2]State;                                                               
 var Inc._lock2059068: [Inc]Tid;                                                                    
 var Inc2._lock2059068: [Inc2]Tid;                                                                  
 var Inc._state2059048: [Inc]State;                                                                 
 var Main._state2059048: [Main]State;                                                               
 var i2059048: Inc;                                                                                 
 var i2059048_post: Inc;                                                                            
 var Inc2.x2059068: [Inc2]int;                                                                      
 var Inc._lock2059048_post: [Inc]Tid;                                                               
 var Inc2.x2059048: [Inc2]int;                                                                      
 var Inc._lock2059047: [Inc]Tid;                                                                    
 var Inc.x2059068: [Inc]int;                                                                        
 var this2059048_post: Main;                                                                        
 var Inc2._lock2059048_post: [Inc2]Tid;                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 35.5: Inc i;                                                                                    
                                                                                                    
                                                                                                    
 // 35.5: i = new Inc();                                                                            
                                                                                                    
 havoc i;                                                                                           
 assume i != Inc.null && isFresh(Inc._state[i]);                                                    
 Inc._state[i] := LOCAL(tid);                                                                       
 assume Inc.x[i]  == 0;                                                                             
 assume Inc._lock[i]  == Tid.null;                                                                  
                                                                                                    
                                                                                                    
 // 36.5: i.x := 0;                                                                                 
                                                                                                    
                                                                                                    
 moverPath2059047 := WriteEval.Inc.x(tid: Tid,i: Inc,0: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 mover2059047 := m#moverPath(moverPath2059047);                                                     
 path2059047 := p#moverPath(moverPath2059047);                                                      
 assume Inc._state2059047 == Inc._state && Inc.x2059047 == Inc.x && Inc._lock2059047 == Inc._lock && Inc2._state2059047 == Inc2._state && Inc2.x2059047 == Inc2.x && Inc2._lock2059047 == Inc2._lock && Main._state2059047 == Main._state && Main._lock2059047 == Main._lock && i2059047 == i && this2059047 == this && tid2059047 == tid && $pc2059047 == $pc;
 assume $recorded.state2059047 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume i != Inc.null;                                                                             
 } else {                                                                                           
  assert i != Inc.null;                                                                                    // (36.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2059047);                                                              
 assert $pc != PhaseError;                                                                                 // (36.5): Reduction failure
 Inc.x[i] := 0;                                                                                     
                                                                                                    
 // 37.5: yield;                                                                                    
                                                                                                    
 assume Inc._state2059048 == Inc._state && Inc.x2059048 == Inc.x && Inc._lock2059048 == Inc._lock && Inc2._state2059048 == Inc2._state && Inc2.x2059048 == Inc2.x && Inc2._lock2059048 == Inc2._lock && Main._state2059048 == Main._state && Main._lock2059048 == Main._lock && i2059048 == i && this2059048 == this && tid2059048 == tid;
 assume $recorded.state2059048 == 1;                                                                
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (37.5): Object invariant may not hold.
 assert  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (37.5): Object invariant may not hold.
 assert  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (37.5): Object invariant may not hold.
 call Yield(tid);                                                                                   
 assume  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (37.5): Object invariant may not hold.
 assume  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (37.5): Object invariant may not hold.
 assume  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (37.5): Object invariant may not hold.
 $pc := PreCommit;                                                                                  
 assume Inc._state2059048_post == Inc._state && Inc.x2059048_post == Inc.x && Inc._lock2059048_post == Inc._lock && Inc2._state2059048_post == Inc2._state && Inc2.x2059048_post == Inc2.x && Inc2._lock2059048_post == Inc2._lock && Main._state2059048_post == Main._state && Main._lock2059048_post == Main._lock && i2059048_post == i && this2059048_post == this && tid2059048_post == tid;
 assume $recorded.state2059048_post == 1;                                                           
 // inlined: i.inc()}                                                                               
 exit$169_top:                                                                                      
                                                                                                    
 // 38.5: Inc this$169;                                                                             
                                                                                                    
                                                                                                    
 // 38.5: this$169 = i;                                                                             
                                                                                                    
 this$169 := i;                                                                                     
                                                                                                    
                                                                                                    
 // 14.9: this$169.x := 0;                                                                          
                                                                                                    
                                                                                                    
 moverPath2059061 := WriteEval.Inc.x(tid: Tid,this$169: Inc,0: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 mover2059061 := m#moverPath(moverPath2059061);                                                     
 path2059061 := p#moverPath(moverPath2059061);                                                      
 assume Inc._state2059061 == Inc._state && Inc.x2059061 == Inc.x && Inc._lock2059061 == Inc._lock && Inc2._state2059061 == Inc2._state && Inc2.x2059061 == Inc2.x && Inc2._lock2059061 == Inc2._lock && Main._state2059061 == Main._state && Main._lock2059061 == Main._lock && this$1692059061 == this$169 && i2059061 == i && this2059061 == this && tid2059061 == tid && $pc2059061 == $pc;
 assume $recorded.state2059061 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$169 != Inc.null;                                                                      
 } else {                                                                                           
  assert this$169 != Inc.null;                                                                             // (14.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2059061);                                                              
 assert $pc != PhaseError;                                                                                 // (14.9): Reduction failure
 Inc.x[this$169] := 0;                                                                              
                                                                                                    
 // 13.21: break exit$169;                                                                          
                                                                                                    
 goto exit$169_bottom;                                                                              
 exit$169_bottom:                                                                                   
                                                                                                    
 // 34.22: // return;                                                                               
                                                                                                    
 assume Inc._state2059068 == Inc._state && Inc.x2059068 == Inc.x && Inc._lock2059068 == Inc._lock && Inc2._state2059068 == Inc2._state && Inc2.x2059068 == Inc2.x && Inc2._lock2059068 == Inc2._lock && Main._state2059068 == Main._state && Main._lock2059068 == Main._lock && i2059068 == i && this2059068 == this && tid2059068 == tid;
 assume $recorded.state2059068 == 1;                                                                
 assert  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (34.22): Object invariant may not hold.
 assert  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (34.22): Object invariant may not hold.
 assert  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (34.22): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Inc._state: [Inc]State,Inc.x: [Inc]int,Inc._lock: [Inc]Tid,Inc2._state: [Inc2]State,Inc2.x: [Inc2]int,Inc2._lock: [Inc2]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Inc  :: _i == Inc.null <==> isNull(Inc._state[_i])) &&                                
  (forall _i: Inc2  :: _i == Inc2.null <==> isNull(Inc2._state[_i])) &&                             
  (forall _i: Main  :: _i == Main.null <==> isNull(Main._state[_i])) &&                             
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.x[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.5): Inc.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                 
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.x[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Inc.x(u: Tid,x: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (8.5): Inc.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                 
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.x[x];                                                                              
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Inc.x[x] := havocValue;                                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.5): Inc.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                  
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.x[x];                                                                              
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Inc.x(u: Tid,x: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (8.5): Inc.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                      
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.5): Inc.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Inc.x(t: Tid, u: Tid, v: int, w: int, x: Inc)                       
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Inc.x[x];                                                                              
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Inc.x[x] := havocValue;                                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Inc.x(u: Tid,x: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.5): Inc.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Inc2.x(t: Tid, u: Tid, v: int, w: int, x: Inc2)              
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[x], u);                                                          
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc2.x[x] := v;                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc2.x(u: Tid,x: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (22.5): Inc2.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Inc2.x(t: Tid, u: Tid, v: int, w: int, x: Inc2)               
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[x], u);                                                          
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc2.x[x] := v;                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Inc2.x(u: Tid,x: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (22.5): Inc2.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Inc2.x(t: Tid, u: Tid, v: int, w: int, x: Inc2)               
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[x], u);                                                          
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc2.x[x];                                                                             
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Inc2.x[x] := havocValue;                                                                           
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc2.x(u: Tid,x: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (22.5): Inc2.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Inc2.x(t: Tid, u: Tid, v: int, w: int, x: Inc2)                
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[x], u);                                                          
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc2.x[x];                                                                             
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Inc2.x(u: Tid,x: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (22.5): Inc2.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Inc2.x(t: Tid, u: Tid, v: int, w: int, x: Inc2)                    
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[x], u);                                                          
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc2.x(t: Tid,x: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Inc2.x(u: Tid,x: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (22.5): Inc2.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Inc2.x(t: Tid, u: Tid, v: int, w: int, x: Inc2)                     
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[x], u);                                                          
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Inc2.x[x];                                                                             
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc2.x(t: Tid,x: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Inc2.x[x] := havocValue;                                                                           
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Inc2.x(u: Tid,x: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (22.5): Inc2.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)      
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Inc2._lock_mid: [Inc2]Tid;                                                                     
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var Inc2._state_mid: [Inc2]State;                                                                  
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var Inc2.x_mid: [Inc2]int;                                                                         
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.x[x];                                                                                  
 Inc.x[x] := v;                                                                                     
                                                                                                    
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc._lock_mid == Inc._lock && Inc2._state_mid == Inc2._state && Inc2.x_mid == Inc2.x && Inc2._lock_mid == Inc2._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.x[x] := tmpV;                                                                                  
 Inc.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Inc.x is not Write-Write Stable with respect to Inc.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)     
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Inc2._lock_mid: [Inc2]Tid;                                                                     
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var Inc2._state_mid: [Inc2]State;                                                                  
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var Inc2.x_mid: [Inc2]int;                                                                         
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.x[x];                                                                                  
 Inc.x[x] := v;                                                                                     
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc._lock_mid == Inc._lock && Inc2._state_mid == Inc2._state && Inc2.x_mid == Inc2.x && Inc2._lock_mid == Inc2._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.x[x] := tmpV;                                                                                  
 Inc.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Inc.x is not Write-Write Stable with respect to Inc.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Inc.x is not Write-Write Stable with respect to Inc.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[y] := w;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.x(t: Tid,x: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Inc.x is not Read-Write Stable with respect to Inc.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Inc.x is not Read-Write Stable with respect to Inc.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Inc.x is not Read-Write Stable with respect to Inc.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)    
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.x(u: Tid,y: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.x(u: Tid,y: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Inc.x is not Write-Read Stable with respect to Inc.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Inc.x is not Write-Read Stable with respect to Inc.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.5): Inc.x is not Write-Read Stable with respect to Inc.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.x.Inc2.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc2)    
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc.x;                                                                                    
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc2.x(u: Tid,y: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc2.x(u: Tid,y: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (22.5): Inc2.x is not Write-Write Stable with respect to Inc.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (22.5): Inc2.x is not Write-Write Stable with respect to Inc.x (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (22.5): Inc2.x is not Write-Write Stable with respect to Inc.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.x.Inc2.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc2)    
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc.x;                                                                                    
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Inc2._lock_mid: [Inc2]Tid;                                                                     
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var Inc2._state_mid: [Inc2]State;                                                                  
 var Inc._state_mid: [Inc]State;                                                                    
 var y_mid: Inc2;                                                                                   
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var Inc2.x_mid: [Inc2]int;                                                                         
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.x[x];                                                                                  
 Inc.x[x] := v;                                                                                     
                                                                                                    
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc._lock_mid == Inc._lock && Inc2._state_mid == Inc2._state && Inc2.x_mid == Inc2.x && Inc2._lock_mid == Inc2._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc2.x(u: Tid,y: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.x[x] := tmpV;                                                                                  
 Inc2.x[y] := w;                                                                                    
 _writeByTPost := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Inc.x is not Write-Write Stable with respect to Inc2.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.x.Inc2.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc2)   
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc.x;                                                                                    
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Inc2._lock_mid: [Inc2]Tid;                                                                     
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var Inc2._state_mid: [Inc2]State;                                                                  
 var Inc._state_mid: [Inc]State;                                                                    
 var y_mid: Inc2;                                                                                   
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var Inc2.x_mid: [Inc2]int;                                                                         
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc2.x(u: Tid,y: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.x[x];                                                                                  
 Inc.x[x] := v;                                                                                     
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc._lock_mid == Inc._lock && Inc2._state_mid == Inc2._state && Inc2.x_mid == Inc2.x && Inc2._lock_mid == Inc2._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc2.x(u: Tid,y: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.x[x] := tmpV;                                                                                  
 Inc2.x[y] := w;                                                                                    
 _writeByTPost := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Inc.x is not Write-Write Stable with respect to Inc2.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Inc.x is not Write-Write Stable with respect to Inc2.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.x.Inc2.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc2)  
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc.x;                                                                                    
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.x(t: Tid,x: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc2.x(u: Tid,y: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc2.x[y] := w;                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.x(t: Tid,x: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Inc.x is not Read-Write Stable with respect to Inc2.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Inc.x is not Read-Write Stable with respect to Inc2.x (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Inc.x is not Read-Write Stable with respect to Inc2.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.x.Inc2.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc2)  
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc.x;                                                                                    
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc2.x(u: Tid,y: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.x(t: Tid,x: Inc,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[x] := v;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc2.x(u: Tid,y: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (22.5): Inc2.x is not Write-Read Stable with respect to Inc.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (22.5): Inc2.x is not Write-Read Stable with respect to Inc.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (22.5): Inc2.x is not Write-Read Stable with respect to Inc.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc2.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc)    
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc2.x;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var y_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc;                                                                                   
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc2.x[x] := v;                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.5): Inc.x is not Write-Write Stable with respect to Inc2.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.5): Inc.x is not Write-Write Stable with respect to Inc2.x (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.5): Inc.x is not Write-Write Stable with respect to Inc2.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc2.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc)    
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc2.x;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var y_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Inc2._lock_mid: [Inc2]Tid;                                                                     
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var Inc2._state_mid: [Inc2]State;                                                                  
 var Inc._state_mid: [Inc]State;                                                                    
 var x_mid: Inc2;                                                                                   
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var Inc2.x_mid: [Inc2]int;                                                                         
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc;                                                                                   
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc2.x[x];                                                                                 
 Inc2.x[x] := v;                                                                                    
                                                                                                    
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc._lock_mid == Inc._lock && Inc2._state_mid == Inc2._state && Inc2.x_mid == Inc2.x && Inc2._lock_mid == Inc2._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc2.x[x] := tmpV;                                                                                 
 Inc.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (22.5): Inc2.x is not Write-Write Stable with respect to Inc.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc2.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc)   
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc2.x;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var y_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Inc2._lock_mid: [Inc2]Tid;                                                                     
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var Inc2._state_mid: [Inc2]State;                                                                  
 var Inc._state_mid: [Inc]State;                                                                    
 var x_mid: Inc2;                                                                                   
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var Inc2.x_mid: [Inc2]int;                                                                         
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc;                                                                                   
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc2.x[x];                                                                                 
 Inc2.x[x] := v;                                                                                    
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc._lock_mid == Inc._lock && Inc2._state_mid == Inc2._state && Inc2.x_mid == Inc2.x && Inc2._lock_mid == Inc2._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc2.x[x] := tmpV;                                                                                 
 Inc.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (22.5): Inc2.x is not Write-Write Stable with respect to Inc.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (22.5): Inc2.x is not Write-Write Stable with respect to Inc.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc2.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc)  
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc2.x;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var y_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc;                                                                                   
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc2.x(t: Tid,x: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.x(u: Tid,y: Inc,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.x[y] := w;                                                                                     
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc2.x(t: Tid,x: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (22.5): Inc2.x is not Read-Write Stable with respect to Inc.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (22.5): Inc2.x is not Read-Write Stable with respect to Inc.x (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (22.5): Inc2.x is not Read-Write Stable with respect to Inc.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc2.x.Inc.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc)  
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc2.x;                                                                                   
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var y_pre: Inc;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc;                                                                                   
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.x(u: Tid,y: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc2.x[x] := v;                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.x(u: Tid,y: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Inc.x is not Write-Read Stable with respect to Inc2.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Inc.x is not Write-Read Stable with respect to Inc2.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.5): Inc.x is not Write-Read Stable with respect to Inc2.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc2.x.Inc2.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc2)  
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc2.x;                                                                                   
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc2.x(u: Tid,y: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc2.x[x] := v;                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc2.x(u: Tid,y: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (22.5): Inc2.x is not Write-Write Stable with respect to Inc2.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (22.5): Inc2.x is not Write-Write Stable with respect to Inc2.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (22.5): Inc2.x is not Write-Write Stable with respect to Inc2.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc2.x.Inc2.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc2)  
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc2.x;                                                                                   
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Inc2._lock_mid: [Inc2]Tid;                                                                     
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var Inc2._state_mid: [Inc2]State;                                                                  
 var Inc._state_mid: [Inc]State;                                                                    
 var x_mid: Inc2;                                                                                   
 var y_mid: Inc2;                                                                                   
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var Inc2.x_mid: [Inc2]int;                                                                         
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc2.x[x];                                                                                 
 Inc2.x[x] := v;                                                                                    
                                                                                                    
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc._lock_mid == Inc._lock && Inc2._state_mid == Inc2._state && Inc2.x_mid == Inc2.x && Inc2._lock_mid == Inc2._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc2.x(u: Tid,y: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc2.x[x] := tmpV;                                                                                 
 Inc2.x[y] := w;                                                                                    
 _writeByTPost := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (22.5): Inc2.x is not Write-Write Stable with respect to Inc2.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc2.x.Inc2.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc2) 
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc2.x;                                                                                   
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Inc2._lock_mid: [Inc2]Tid;                                                                     
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var Inc2._state_mid: [Inc2]State;                                                                  
 var Inc._state_mid: [Inc]State;                                                                    
 var x_mid: Inc2;                                                                                   
 var y_mid: Inc2;                                                                                   
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var v_mid: int;                                                                                    
 var Inc.x_mid: [Inc]int;                                                                           
 var Inc2.x_mid: [Inc2]int;                                                                         
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc2.x(u: Tid,y: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc2.x[x];                                                                                 
 Inc2.x[x] := v;                                                                                    
 assume Inc._state_mid == Inc._state && Inc.x_mid == Inc.x && Inc._lock_mid == Inc._lock && Inc2._state_mid == Inc2._state && Inc2.x_mid == Inc2.x && Inc2._lock_mid == Inc2._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc2.x(u: Tid,y: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc2.x[x] := tmpV;                                                                                 
 Inc2.x[y] := w;                                                                                    
 _writeByTPost := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (22.5): Inc2.x is not Write-Write Stable with respect to Inc2.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (22.5): Inc2.x is not Write-Write Stable with respect to Inc2.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc2.x.Inc2.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc2)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc2.x;                                                                                   
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc2.x(t: Tid,x: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc2.x(u: Tid,y: Inc2,w: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc2.x[y] := w;                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc2.x(t: Tid,x: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (22.5): Inc2.x is not Read-Write Stable with respect to Inc2.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (22.5): Inc2.x is not Read-Write Stable with respect to Inc2.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (22.5): Inc2.x is not Read-Write Stable with respect to Inc2.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc2.x.Inc2.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc2)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc2.x;                                                                                   
 modifies Inc2.x;                                                                                   
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var Inc2._state_pre: [Inc2]State;                                                                  
 var Inc2.x_pre: [Inc2]int;                                                                         
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.x_post: [Inc2]int;                                                                        
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var Inc.x_post: [Inc]int;                                                                          
 var Inc._lock_post: [Inc]Tid;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc2.x(u: Tid,y: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc2.x(t: Tid,x: Inc2,v: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc2.x[x] := v;                                                                                    
 assume Inc._state_post == Inc._state && Inc.x_post == Inc.x && Inc._lock_post == Inc._lock && Inc2._state_post == Inc2._state && Inc2.x_post == Inc2.x && Inc2._lock_post == Inc2._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc2.x(u: Tid,y: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (22.5): Inc2.x is not Write-Read Stable with respect to Inc2.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (22.5): Inc2.x is not Write-Read Stable with respect to Inc2.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (22.5): Inc2.x is not Write-Read Stable with respect to Inc2.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
requires ValidTid(tid);                                                                             
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
modifies Inc._state;                                                                                
modifies Inc.x;                                                                                     
modifies Inc._lock;                                                                                 
modifies Inc2._state;                                                                               
modifies Inc2.x;                                                                                    
modifies Inc2._lock;                                                                                
modifies Main._state;                                                                               
modifies Main._lock;                                                                                
ensures StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
ensures Y(tid , old(Inc._state), old(Inc.x), old(Inc._lock), old(Inc2._state), old(Inc2.x), old(Inc2._lock), old(Main._state), old(Main._lock) , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
ensures  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
ensures  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
ensures  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// Inc.x:                                                                                           
                                                                                                    
function {:inline} Y_Inc.x(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc.x(tid: Tid,this: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)), _R)) ==> (Inc.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.x(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc.x.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var Inc2.x_yield: [Inc2]int;                                                                        
var u_yield: Tid;                                                                                   
var Inc2._state_yield: [Inc2]State;                                                                 
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc.x(u: Tid,this: Inc,newValue: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)));
                                                                                                    
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && Inc2._state_yield == Inc2._state && Inc2.x_yield == Inc2.x && Inc2._lock_yield == Inc2._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.x(tid, this, newValue , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc.x.Reflexive(tid : Tid, this: Inc , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Inc2.x_yield: [Inc2]int;                                                                        
var Inc2._state_yield: [Inc2]State;                                                                 
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && Inc2._state_yield == Inc2._state && Inc2.x_yield == Inc2.x && Inc2._lock_yield == Inc2._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.x(tid, this, Inc.x[this] , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc.x.Transitive(tid : Tid, this: Inc, newValue : int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid , Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid, Inc2._state_p: [Inc2]State, Inc2.x_p: [Inc2]int, Inc2._lock_p: [Inc2]Tid, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires StateInvariant(Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (8.11): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (8.11): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (8.11): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Main._lock_pre: [Main]Tid;                                                                      
var Inc2._lock_pre: [Inc2]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var Inc2._state_pre: [Inc2]State;                                                                   
var this_pre: Inc;                                                                                  
var Inc2.x_pre: [Inc2]int;                                                                          
var $pc_pre: Phase;                                                                                 
                                                                                                    
var Inc2.x_post: [Inc2]int;                                                                         
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var Main._state_post: [Main]State;                                                                  
var $pc_post: Phase;                                                                                
var Inc2._lock_post: [Inc2]Tid;                                                                     
var this_post: Inc;                                                                                 
var tid_post: Tid;                                                                                  
var Inc2._state_post: [Inc2]State;                                                                  
var Main._lock_post: [Main]Tid;                                                                     
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock , Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
 assume Y_Inc.x(tid, this, newValue , Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
assume Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc._lock_post == Inc._lock_p && Inc2._state_post == Inc2._state_p && Inc2.x_post == Inc2.x_p && Inc2._lock_post == Inc2._lock_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc.x(tid, this, newValue , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
// Inc._lock:                                                                                       
                                                                                                    
function {:inline} Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)), _R)) ==> (Inc._lock[this] == newValue))
 &&(((Inc._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Inc2.x_yield: [Inc2]int;                                                                        
var u_yield: Tid;                                                                                   
var Inc2._state_yield: [Inc2]State;                                                                 
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc._lock(u: Tid,this: Inc,newValue: Tid,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)));
 assume leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)), _N);
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && Inc2._state_yield == Inc2._state && Inc2.x_yield == Inc2.x && Inc2._lock_yield == Inc2._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, newValue , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Reflexive(tid : Tid, this: Inc , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Inc2.x_yield: [Inc2]int;                                                                        
var Inc2._state_yield: [Inc2]State;                                                                 
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && Inc2._state_yield == Inc2._state && Inc2.x_yield == Inc2.x && Inc2._lock_yield == Inc2._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, Inc._lock[this] , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Transitive(tid : Tid, this: Inc, newValue : Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid , Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid, Inc2._state_p: [Inc2]State, Inc2.x_p: [Inc2]int, Inc2._lock_p: [Inc2]Tid, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires StateInvariant(Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (6.1): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (6.1): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (6.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Main._lock_pre: [Main]Tid;                                                                      
var Inc2._lock_pre: [Inc2]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var Inc2._state_pre: [Inc2]State;                                                                   
var this_pre: Inc;                                                                                  
var Inc2.x_pre: [Inc2]int;                                                                          
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var Inc2.x_post: [Inc2]int;                                                                         
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var Main._state_post: [Main]State;                                                                  
var $pc_post: Phase;                                                                                
var Inc2._lock_post: [Inc2]Tid;                                                                     
var this_post: Inc;                                                                                 
var tid_post: Tid;                                                                                  
var Inc2._state_post: [Inc2]State;                                                                  
var Main._lock_post: [Main]Tid;                                                                     
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock , Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
 assume Y_Inc._lock(tid, this, newValue , Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
assume Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc._lock_post == Inc._lock_p && Inc2._state_post == Inc2._state_p && Inc2.x_post == Inc2.x_p && Inc2._lock_post == Inc2._lock_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc._lock(tid, this, newValue , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
// Inc2.x:                                                                                          
                                                                                                    
function {:inline} Y_Inc2.x(tid : Tid, this: Inc2, newValue: int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 ((isAccessible(Inc2._state[this], tid) && leq(m#moverPath(ReadEval.Inc2.x(tid: Tid,this: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)), _R)) ==> (Inc2.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc2.x(tid : Tid, this: Inc2, newValue: int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc2.x.Subsumes.W(tid : Tid, u : Tid, this: Inc2, newValue: int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var Inc2.x_yield: [Inc2]int;                                                                        
var u_yield: Tid;                                                                                   
var Inc2._state_yield: [Inc2]State;                                                                 
var this_yield: Inc2;                                                                               
var Inc._lock_yield: [Inc]Tid;                                                                      
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc2._state[this], tid);                                                       
 assume isAccessible(Inc2._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Inc2.x(u: Tid,this: Inc2,newValue: int,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)));
                                                                                                    
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && Inc2._state_yield == Inc2._state && Inc2.x_yield == Inc2.x && Inc2._lock_yield == Inc2._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc2.x(tid, this, newValue , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc2.x.Reflexive(tid : Tid, this: Inc2 , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Inc2.x_yield: [Inc2]int;                                                                        
var Inc2._state_yield: [Inc2]State;                                                                 
var this_yield: Inc2;                                                                               
var Inc._lock_yield: [Inc]Tid;                                                                      
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc2._state[this], tid);                                                       
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && Inc2._state_yield == Inc2._state && Inc2.x_yield == Inc2.x && Inc2._lock_yield == Inc2._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc2.x(tid, this, Inc2.x[this] , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc2.x.Transitive(tid : Tid, this: Inc2, newValue : int , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid , Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid, Inc2._state_p: [Inc2]State, Inc2.x_p: [Inc2]int, Inc2._lock_p: [Inc2]Tid, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires StateInvariant(Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (22.11): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (22.11): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (22.11): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Main._lock_pre: [Main]Tid;                                                                      
var Inc2._lock_pre: [Inc2]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var Inc2._state_pre: [Inc2]State;                                                                   
var Inc2.x_pre: [Inc2]int;                                                                          
var $pc_pre: Phase;                                                                                 
var this_pre: Inc2;                                                                                 
                                                                                                    
var this_post: Inc2;                                                                                
var Inc2.x_post: [Inc2]int;                                                                         
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var Main._state_post: [Main]State;                                                                  
var $pc_post: Phase;                                                                                
var Inc2._lock_post: [Inc2]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Inc2._state_post: [Inc2]State;                                                                  
var Main._lock_post: [Main]Tid;                                                                     
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc2._state[this], tid);                                                       
 assume Y(tid , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock , Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
 assume Y_Inc2.x(tid, this, newValue , Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
assume Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc._lock_post == Inc._lock_p && Inc2._state_post == Inc2._state_p && Inc2.x_post == Inc2.x_p && Inc2._lock_post == Inc2._lock_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc2.x(tid, this, newValue , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
// Inc2._lock:                                                                                      
                                                                                                    
function {:inline} Y_Inc2._lock(tid : Tid, this: Inc2, newValue: Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 ((isAccessible(Inc2._state[this], tid) && leq(m#moverPath(ReadEval.Inc2._lock(tid: Tid,this: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)), _R)) ==> (Inc2._lock[this] == newValue))
 &&(((Inc2._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc2._lock(tid : Tid, this: Inc2, newValue: Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc2._lock.Subsumes.W(tid : Tid, u : Tid, this: Inc2, newValue: Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Inc2.x_yield: [Inc2]int;                                                                        
var u_yield: Tid;                                                                                   
var Inc2._state_yield: [Inc2]State;                                                                 
var this_yield: Inc2;                                                                               
var Inc._lock_yield: [Inc]Tid;                                                                      
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc2._state[this], tid);                                                       
 assume isAccessible(Inc2._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Inc2._lock(u: Tid,this: Inc2,newValue: Tid,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)));
 assume leq(m#moverPath(ReadEval.Inc2._lock(tid: Tid,this: Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)), _N);
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && Inc2._state_yield == Inc2._state && Inc2.x_yield == Inc2.x && Inc2._lock_yield == Inc2._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc2._lock(tid, this, newValue , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc2._lock.Reflexive(tid : Tid, this: Inc2 , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var Inc2.x_yield: [Inc2]int;                                                                        
var Inc2._state_yield: [Inc2]State;                                                                 
var this_yield: Inc2;                                                                               
var Inc._lock_yield: [Inc]Tid;                                                                      
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc2._state[this], tid);                                                       
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && Inc2._state_yield == Inc2._state && Inc2.x_yield == Inc2.x && Inc2._lock_yield == Inc2._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc2._lock(tid, this, Inc2._lock[this] , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Inc2._lock.Transitive(tid : Tid, this: Inc2, newValue : Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid , Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid, Inc2._state_p: [Inc2]State, Inc2.x_p: [Inc2]int, Inc2._lock_p: [Inc2]Tid, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires StateInvariant(Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (20.1): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (20.1): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (20.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Main._lock_pre: [Main]Tid;                                                                      
var Inc2._lock_pre: [Inc2]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var Inc2._state_pre: [Inc2]State;                                                                   
var Inc2.x_pre: [Inc2]int;                                                                          
var $pc_pre: Phase;                                                                                 
var this_pre: Inc2;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var this_post: Inc2;                                                                                
var Inc2.x_post: [Inc2]int;                                                                         
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var Main._state_post: [Main]State;                                                                  
var $pc_post: Phase;                                                                                
var Inc2._lock_post: [Inc2]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Inc2._state_post: [Inc2]State;                                                                  
var Main._lock_post: [Main]Tid;                                                                     
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc2._state[this], tid);                                                       
 assume Y(tid , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock , Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
 assume Y_Inc2._lock(tid, this, newValue , Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
assume Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc._lock_post == Inc._lock_p && Inc2._state_post == Inc2._state_p && Inc2.x_post == Inc2.x_p && Inc2._lock_post == Inc2._lock_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc2._lock(tid, this, newValue , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
// Main._lock:                                                                                      
                                                                                                    
function {:inline} Y_Main._lock(tid : Tid, this: Main, newValue: Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 ((isAccessible(Main._state[this], tid) && leq(m#moverPath(ReadEval.Main._lock(tid: Tid,this: Main,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)), _R)) ==> (Main._lock[this] == newValue))
 &&(((Main._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Main._lock(tid : Tid, this: Main, newValue: Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Main._lock.Subsumes.W(tid : Tid, u : Tid, this: Main, newValue: Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var this_yield: Main;                                                                               
var Inc2.x_yield: [Inc2]int;                                                                        
var u_yield: Tid;                                                                                   
var Inc2._state_yield: [Inc2]State;                                                                 
var Inc._lock_yield: [Inc]Tid;                                                                      
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Main._state[this], tid);                                                       
 assume isAccessible(Main._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Main._lock(u: Tid,this: Main,newValue: Tid,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)));
 assume leq(m#moverPath(ReadEval.Main._lock(tid: Tid,this: Main,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock)), _N);
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && Inc2._state_yield == Inc2._state && Inc2.x_yield == Inc2.x && Inc2._lock_yield == Inc2._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Main._lock(tid, this, newValue , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Main._lock.Reflexive(tid : Tid, this: Main , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var Inc.x_yield: [Inc]int;                                                                          
var $pc_yield: Phase;                                                                               
var this_yield: Main;                                                                               
var Inc2.x_yield: [Inc2]int;                                                                        
var Inc2._state_yield: [Inc2]State;                                                                 
var Inc._lock_yield: [Inc]Tid;                                                                      
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Main._state[this], tid);                                                       
assume Inc._state_yield == Inc._state && Inc.x_yield == Inc.x && Inc._lock_yield == Inc._lock && Inc2._state_yield == Inc2._state && Inc2.x_yield == Inc2.x && Inc2._lock_yield == Inc2._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Main._lock(tid, this, Main._lock[this] , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Main._lock.Transitive(tid : Tid, this: Main, newValue : Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid , Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid, Inc2._state_p: [Inc2]State, Inc2.x_p: [Inc2]int, Inc2._lock_p: [Inc2]Tid, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
 requires StateInvariant(Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : Inc ::  { Inc._state[_this] } isAccessible(Inc._state[_this], tid) && true ==> Invariant.Inc.2058827(tid: Tid,_this : Inc,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (33.1): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058938(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (33.1): Object invariant may not hold.
requires  (forall _this : Inc2 ::  { Inc2._state[_this] } isAccessible(Inc2._state[_this], tid) && true ==> Invariant.Inc2.2058945(tid: Tid,_this : Inc2,Inc._state,Inc.x,Inc._lock,Inc2._state,Inc2.x,Inc2._lock,Main._state,Main._lock));       // (33.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Inc.x_pre: [Inc]int;                                                                            
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var this_pre: Main;                                                                                 
var Main._lock_pre: [Main]Tid;                                                                      
var Inc2._lock_pre: [Inc2]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var Inc2._state_pre: [Inc2]State;                                                                   
var Inc2.x_pre: [Inc2]int;                                                                          
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var Inc2.x_post: [Inc2]int;                                                                         
var Inc._state_post: [Inc]State;                                                                    
var this_post: Main;                                                                                
var $recorded.state_post: int;                                                                      
var Main._state_post: [Main]State;                                                                  
var $pc_post: Phase;                                                                                
var Inc2._lock_post: [Inc2]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Inc2._state_post: [Inc2]State;                                                                  
var Main._lock_post: [Main]Tid;                                                                     
var Inc.x_post: [Inc]int;                                                                           
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.x_pre == Inc.x && Inc._lock_pre == Inc._lock && Inc2._state_pre == Inc2._state && Inc2.x_pre == Inc2.x && Inc2._lock_pre == Inc2._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Main._state[this], tid);                                                       
 assume Y(tid , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock , Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
 assume Y_Main._lock(tid, this, newValue , Inc._state_p, Inc.x_p, Inc._lock_p, Inc2._state_p, Inc2.x_p, Inc2._lock_p, Main._state_p, Main._lock_p);
assume Inc._state_post == Inc._state_p && Inc.x_post == Inc.x_p && Inc._lock_post == Inc._lock_p && Inc2._state_post == Inc2._state_p && Inc2.x_post == Inc2.x_p && Inc2._lock_post == Inc2._lock_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Main._lock(tid, this, newValue , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Inc._state: [Inc]State, Inc.x: [Inc]int, Inc._lock: [Inc]Tid, Inc2._state: [Inc2]State, Inc2.x: [Inc2]int, Inc2._lock: [Inc2]Tid, Main._state: [Main]State, Main._lock: [Main]Tid , Inc._state_p: [Inc]State, Inc.x_p: [Inc]int, Inc._lock_p: [Inc]Tid, Inc2._state_p: [Inc2]State, Inc2.x_p: [Inc2]int, Inc2._lock_p: [Inc2]Tid, Main._state_p: [Main]State, Main._lock_p: [Main]Tid): bool
{                                                                                                   
 (forall this: Inc :: Y_Inc.x(tid : Tid, this, Inc.x_p[this] , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock))
 && (forall this: Inc :: Y_Inc._lock(tid : Tid, this, Inc._lock_p[this] , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock))
 && (forall this: Inc2 :: Y_Inc2.x(tid : Tid, this, Inc2.x_p[this] , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock))
 && (forall this: Inc2 :: Y_Inc2._lock(tid : Tid, this, Inc2._lock_p[this] , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock))
 && (forall this: Main :: Y_Main._lock(tid : Tid, this, Main._lock_p[this] , Inc._state, Inc.x, Inc._lock, Inc2._state, Inc2.x, Inc2._lock, Main._state, Main._lock))
 && (forall _i : Inc :: isShared(Inc._state[_i]) ==> isShared(Inc._state_p[_i]))                    
 && (forall _i : Inc :: isLocal(Inc._state[_i], tid) <==> isLocal(Inc._state_p[_i], tid))           
 && (forall _i : Inc2 :: isShared(Inc2._state[_i]) ==> isShared(Inc2._state_p[_i]))                 
 && (forall _i : Inc2 :: isLocal(Inc2._state[_i], tid) <==> isLocal(Inc2._state_p[_i], tid))        
 && (forall _i : Main :: isShared(Main._state[_i]) ==> isShared(Main._state_p[_i]))                 
 && (forall _i : Main :: isLocal(Main._state[_i], tid) <==> isLocal(Main._state_p[_i], tid))        
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 624.1-708.2: (Method:13.2)
// 636.1-636.24: (13.2): Bad tid
// 637.1-637.37: (13.2): this is not global
// 640.1-640.231: (13.2): Object invariant may not hold.
// 641.1-641.236: (13.2): Object invariant may not hold.
// 642.1-642.236: (13.2): Object invariant may not hold.
// 645.1-645.230: (13.2): Object invariant may not hold.
// 646.1-646.235: (13.2): Object invariant may not hold.
// 647.1-647.235: (13.2): Object invariant may not hold.
// 682.2-698.19: (class anchor.sink.Write:14.9)
// 694.1-694.27: (14.9): Cannot have potential null deference in left-mover part.
// 697.1-697.27: (14.9): Reduction failure
// 699.2-707.9: (class anchor.sink.Return:13.21)
// 704.1-704.230: (13.21): Object invariant may not hold.
// 705.1-705.235: (13.21): Object invariant may not hold.
// 706.1-706.235: (13.21): Object invariant may not hold.
// 814.1-898.2: (Method:27.2)
// 826.1-826.24: (27.2): Bad tid
// 827.1-827.38: (27.2): this is not global
// 830.1-830.231: (27.2): Object invariant may not hold.
// 831.1-831.236: (27.2): Object invariant may not hold.
// 832.1-832.236: (27.2): Object invariant may not hold.
// 835.1-835.230: (27.2): Object invariant may not hold.
// 836.1-836.235: (27.2): Object invariant may not hold.
// 837.1-837.235: (27.2): Object invariant may not hold.
// 872.2-888.20: (class anchor.sink.Write:28.9)
// 884.1-884.28: (28.9): Cannot have potential null deference in left-mover part.
// 887.1-887.27: (28.9): Reduction failure
// 889.2-897.9: (class anchor.sink.Return:27.22)
// 894.1-894.230: (27.22): Object invariant may not hold.
// 895.1-895.235: (27.22): Object invariant may not hold.
// 896.1-896.235: (27.22): Object invariant may not hold.
// 976.1-1165.2: (Method:34.3)
// 988.1-988.24: (34.3): Bad tid
// 989.1-989.38: (34.3): this is not global
// 992.1-992.231: (34.3): Object invariant may not hold.
// 993.1-993.236: (34.3): Object invariant may not hold.
// 994.1-994.236: (34.3): Object invariant may not hold.
// 997.1-997.230: (34.3): Object invariant may not hold.
// 998.1-998.235: (34.3): Object invariant may not hold.
// 999.1-999.235: (34.3): Object invariant may not hold.
// 1080.2-1082.2: (class anchor.sink.VarDeclStmt:35.5)
// 1083.2-1090.35: (class anchor.sink.Alloc:35.5)
// 1092.2-1108.16: (class anchor.sink.Write:36.5)
// 1104.1-1104.24: (36.5): Cannot have potential null deference in left-mover part.
// 1107.1-1107.27: (36.5): Reduction failure
// 1109.2-1123.42: (class anchor.sink.Yield:37.5)
// 1114.1-1114.230: (37.5): Object invariant may not hold.
// 1115.1-1115.235: (37.5): Object invariant may not hold.
// 1116.1-1116.235: (37.5): Object invariant may not hold.
// 1118.1-1118.230: (37.5): Object invariant may not hold.
// 1119.1-1119.235: (37.5): Object invariant may not hold.
// 1120.1-1120.235: (37.5): Object invariant may not hold.
// 1126.2-1128.2: (class anchor.sink.VarDeclStmt:38.5)
// 1129.2-1132.16: (class anchor.sink.Assign:38.5)
// 1134.2-1150.23: (class anchor.sink.Write:14.9)
// 1146.1-1146.31: (14.9): Cannot have potential null deference in left-mover part.
// 1149.1-1149.27: (14.9): Reduction failure
// 1151.2-1154.23: (class anchor.sink.Break:13.21)
// 1156.2-1164.9: (class anchor.sink.Return:34.22)
// 1161.1-1161.230: (34.22): Object invariant may not hold.
// 1162.1-1162.235: (34.22): Object invariant may not hold.
// 1163.1-1163.235: (34.22): Object invariant may not hold.
// 1251.1-1251.34: (8.5): Inc.x failed Write-Write Right-Mover Check
// 1318.1-1318.30: (8.5): Inc.x failed Write-Read Right-Mover Check
// 1389.1-1389.34: (8.5): Inc.x failed Write-Write Left-Mover Check
// 1457.1-1457.30: (8.5): Inc.x failed Write-Read Left-Mover Check
// 1522.1-1522.34: (8.5): Inc.x failed Read-Write Right-Mover Check
// 1590.1-1590.34: (8.5): Inc.x failed Read-Write Left-Mover Check
// 1657.1-1657.34: (22.5): Inc2.x failed Write-Write Right-Mover Check
// 1724.1-1724.30: (22.5): Inc2.x failed Write-Read Right-Mover Check
// 1795.1-1795.34: (22.5): Inc2.x failed Write-Write Left-Mover Check
// 1863.1-1863.30: (22.5): Inc2.x failed Write-Read Left-Mover Check
// 1928.1-1928.34: (22.5): Inc2.x failed Read-Write Right-Mover Check
// 1996.1-1996.34: (22.5): Inc2.x failed Read-Write Left-Mover Check
// 2075.1-2075.140: (8.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.1)
// 2076.1-2076.101: (8.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.2)
// 2077.1-2077.158: (8.5): Inc.x is not Write-Write Stable with respect to Inc.x (case A.3)
// 2185.1-2185.140: (8.5): Inc.x is not Write-Write Stable with respect to Inc.x (case C)
// 2298.1-2298.144: (8.5): Inc.x is not Write-Write Stable with respect to Inc.x (case D)
// 2299.1-2299.144: (8.5): Inc.x is not Write-Write Stable with respect to Inc.x (case R)
// 2378.1-2378.136: (8.5): Inc.x is not Read-Write Stable with respect to Inc.x (case F)
// 2379.1-2379.136: (8.5): Inc.x is not Read-Write Stable with respect to Inc.x (case H)
// 2380.1-2380.146: (8.5): Inc.x is not Read-Write Stable with respect to Inc.x (case I)
// 2458.1-2458.136: (8.5): Inc.x is not Write-Read Stable with respect to Inc.x (case J)
// 2459.1-2459.136: (8.5): Inc.x is not Write-Read Stable with respect to Inc.x (case K)
// 2460.1-2460.99: (8.5): Inc.x is not Write-Read Stable with respect to Inc.x (case L)
// 2540.1-2540.140: (22.5): Inc2.x is not Write-Write Stable with respect to Inc.x (case A.1)
// 2541.1-2541.101: (22.5): Inc2.x is not Write-Write Stable with respect to Inc.x (case A.2)
// 2542.1-2542.156: (22.5): Inc2.x is not Write-Write Stable with respect to Inc.x (case A.3)
// 2650.1-2650.140: (8.5): Inc.x is not Write-Write Stable with respect to Inc2.x (case C)
// 2763.1-2763.144: (8.5): Inc.x is not Write-Write Stable with respect to Inc2.x (case D)
// 2764.1-2764.144: (8.5): Inc.x is not Write-Write Stable with respect to Inc2.x (case R)
// 2843.1-2843.136: (8.5): Inc.x is not Read-Write Stable with respect to Inc2.x (case F)
// 2844.1-2844.136: (8.5): Inc.x is not Read-Write Stable with respect to Inc2.x (case H)
// 2845.1-2845.144: (8.5): Inc.x is not Read-Write Stable with respect to Inc2.x (case I)
// 2923.1-2923.136: (22.5): Inc2.x is not Write-Read Stable with respect to Inc.x (case J)
// 2924.1-2924.136: (22.5): Inc2.x is not Write-Read Stable with respect to Inc.x (case K)
// 2925.1-2925.99: (22.5): Inc2.x is not Write-Read Stable with respect to Inc.x (case L)
// 3005.1-3005.140: (8.5): Inc.x is not Write-Write Stable with respect to Inc2.x (case A.1)
// 3006.1-3006.101: (8.5): Inc.x is not Write-Write Stable with respect to Inc2.x (case A.2)
// 3007.1-3007.156: (8.5): Inc.x is not Write-Write Stable with respect to Inc2.x (case A.3)
// 3115.1-3115.140: (22.5): Inc2.x is not Write-Write Stable with respect to Inc.x (case C)
// 3228.1-3228.144: (22.5): Inc2.x is not Write-Write Stable with respect to Inc.x (case D)
// 3229.1-3229.144: (22.5): Inc2.x is not Write-Write Stable with respect to Inc.x (case R)
// 3308.1-3308.136: (22.5): Inc2.x is not Read-Write Stable with respect to Inc.x (case F)
// 3309.1-3309.136: (22.5): Inc2.x is not Read-Write Stable with respect to Inc.x (case H)
// 3310.1-3310.144: (22.5): Inc2.x is not Read-Write Stable with respect to Inc.x (case I)
// 3388.1-3388.136: (8.5): Inc.x is not Write-Read Stable with respect to Inc2.x (case J)
// 3389.1-3389.136: (8.5): Inc.x is not Write-Read Stable with respect to Inc2.x (case K)
// 3390.1-3390.99: (8.5): Inc.x is not Write-Read Stable with respect to Inc2.x (case L)
// 3470.1-3470.140: (22.5): Inc2.x is not Write-Write Stable with respect to Inc2.x (case A.1)
// 3471.1-3471.101: (22.5): Inc2.x is not Write-Write Stable with respect to Inc2.x (case A.2)
// 3472.1-3472.158: (22.5): Inc2.x is not Write-Write Stable with respect to Inc2.x (case A.3)
// 3580.1-3580.140: (22.5): Inc2.x is not Write-Write Stable with respect to Inc2.x (case C)
// 3693.1-3693.144: (22.5): Inc2.x is not Write-Write Stable with respect to Inc2.x (case D)
// 3694.1-3694.144: (22.5): Inc2.x is not Write-Write Stable with respect to Inc2.x (case R)
// 3773.1-3773.136: (22.5): Inc2.x is not Read-Write Stable with respect to Inc2.x (case F)
// 3774.1-3774.136: (22.5): Inc2.x is not Read-Write Stable with respect to Inc2.x (case H)
// 3775.1-3775.146: (22.5): Inc2.x is not Read-Write Stable with respect to Inc2.x (case I)
// 3853.1-3853.136: (22.5): Inc2.x is not Write-Read Stable with respect to Inc2.x (case J)
// 3854.1-3854.136: (22.5): Inc2.x is not Write-Read Stable with respect to Inc2.x (case K)
// 3855.1-3855.99: (22.5): Inc2.x is not Write-Read Stable with respect to Inc2.x (case L)
// 3862.1-3862.231: (<undefined position>): Object invariant may not hold.
// 3863.1-3863.236: (<undefined position>): Object invariant may not hold.
// 3864.1-3864.236: (<undefined position>): Object invariant may not hold.
// 3875.1-3875.230: (<undefined position>): Object invariant may not hold.
// 3876.1-3876.235: (<undefined position>): Object invariant may not hold.
// 3877.1-3877.235: (<undefined position>): Object invariant may not hold.
// 3897.1-3921.2: (8.5): yields_as clause for Inc.x is not valid
// 3926.1-3945.2: (8.5): yields_as clause for Inc.x is not reflexive
// 3951.1-3951.231: (8.11): Object invariant may not hold.
// 3952.1-3952.236: (8.11): Object invariant may not hold.
// 3953.1-3953.236: (8.11): Object invariant may not hold.
// 3954.1-3992.2: (8.5): yields_as clause for Inc.x is not transitive
// 4012.1-4036.2: (7.32): yields_as clause for Inc._lock is not valid
// 4041.1-4060.2: (7.32): yields_as clause for Inc._lock is not reflexive
// 4066.1-4066.231: (6.1): Object invariant may not hold.
// 4067.1-4067.236: (6.1): Object invariant may not hold.
// 4068.1-4068.236: (6.1): Object invariant may not hold.
// 4069.1-4107.2: (7.32): yields_as clause for Inc._lock is not transitive
// 4126.1-4150.2: (22.5): yields_as clause for Inc2.x is not valid
// 4155.1-4174.2: (22.5): yields_as clause for Inc2.x is not reflexive
// 4180.1-4180.231: (22.11): Object invariant may not hold.
// 4181.1-4181.236: (22.11): Object invariant may not hold.
// 4182.1-4182.236: (22.11): Object invariant may not hold.
// 4183.1-4221.2: (22.5): yields_as clause for Inc2.x is not transitive
// 4241.1-4265.2: (7.32): yields_as clause for Inc2._lock is not valid
// 4270.1-4289.2: (7.32): yields_as clause for Inc2._lock is not reflexive
// 4295.1-4295.231: (20.1): Object invariant may not hold.
// 4296.1-4296.236: (20.1): Object invariant may not hold.
// 4297.1-4297.236: (20.1): Object invariant may not hold.
// 4298.1-4336.2: (7.32): yields_as clause for Inc2._lock is not transitive
// 4356.1-4380.2: (7.32): yields_as clause for Main._lock is not valid
// 4385.1-4404.2: (7.32): yields_as clause for Main._lock is not reflexive
// 4410.1-4410.231: (33.1): Object invariant may not hold.
// 4411.1-4411.236: (33.1): Object invariant may not hold.
// 4412.1-4412.236: (33.1): Object invariant may not hold.
// 4413.1-4451.2: (7.32): yields_as clause for Main._lock is not transitive
