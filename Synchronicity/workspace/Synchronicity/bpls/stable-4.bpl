                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/stable-4.anchor:                        
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Example {                                                                                 
       Tid owner isRead ? B : E                                                                     
                                                                                                    
      volatile boolean flag isRead                                                                  
       ? this.flag ? R : N                                                                          
       : tid == this.owner && !this.flag ? N : E                                                    
                                                                                                    
      volatile int data isRead                                                                      
       ? this.flag ? R : E                                                                          
       : tid == this.owner && !this.flag ? B : E                                                    
                                                                                                    
                                                                                                    
      requires tid == this.owner;                                                                   
      requires !this.flag;                                                                          
                                                                                                    
      public void init() {                                                                          
        assume this.owner == Tid.null;                                                              
        assume this.flag == false;                                                                  
        assume this.data == 0;                                                                      
        {                                                                                           
          int tmp1;                                                                                 
          tmp1 = 3;                                                                                 
          this.data := tmp1;                                                                        
          boolean tmp2;                                                                             
          tmp2 = true;                                                                              
          this.flag := tmp2;                                                                        
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int read() {                                                                           
        boolean tmp3;                                                                               
        tmp3 := this.flag;                                                                          
        if (tmp3 /* == this.flag */) {                                                              
          int tmp4;                                                                                 
          tmp4 := this.data;                                                                        
           return tmp4;                                                                             
        } else {                                                                                    
           return 0;                                                                                
        }                                                                                           
        // return -1;                                                                               
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Example {                                                                                 
       Tid owner isRead ? B : E                                                                     
                                                                                                    
      volatile boolean flag isRead                                                                  
       ? this.flag ? R : N                                                                          
       : tid == this.owner && !this.flag ? N : E                                                    
                                                                                                    
      volatile int data isRead                                                                      
       ? this.flag ? R : E                                                                          
       : tid == this.owner && !this.flag ? B : E                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
      requires tid == this.owner;                                                                   
      requires !this.flag;                                                                          
                                                                                                    
      public void init() {                                                                          
        assume this.owner == Tid.null;                                                              
        assume this.flag == false;                                                                  
        assume this.data == 0;                                                                      
        {                                                                                           
          int tmp1;                                                                                 
          tmp1 = 3;                                                                                 
          this.data := tmp1;                                                                        
          boolean tmp2;                                                                             
          tmp2 = true;                                                                              
          this.flag := tmp2;                                                                        
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int read() {                                                                           
        boolean tmp3;                                                                               
        tmp3 := this.flag;                                                                          
        if (tmp3 /* == this.flag */) {                                                              
          int tmp4;                                                                                 
          tmp4 := this.data;                                                                        
          {                                                                                         
             return tmp4;                                                                           
          }                                                                                         
        } else {                                                                                    
          {                                                                                         
             return 0;                                                                              
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Example {                                                                                 
       Tid owner isRead ? B : E                                                                     
                                                                                                    
      volatile boolean flag isRead                                                                  
       ? this.flag ? R : N                                                                          
       : tid == this.owner && !this.flag ? N : E                                                    
                                                                                                    
      volatile int data isRead                                                                      
       ? this.flag ? R : E                                                                          
       : tid == this.owner && !this.flag ? B : E                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
      requires tid == this.owner;                                                                   
      requires !this.flag;                                                                          
                                                                                                    
      public void init() {                                                                          
        assume this.owner == Tid.null;                                                              
        assume this.flag == false;                                                                  
        assume this.data == 0;                                                                      
        {                                                                                           
          int tmp1;                                                                                 
          tmp1 = 3;                                                                                 
          this.data := tmp1;                                                                        
          boolean tmp2;                                                                             
          tmp2 = true;                                                                              
          this.flag := tmp2;                                                                        
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int read() {                                                                           
        boolean tmp3;                                                                               
        tmp3 := this.flag;                                                                          
        if (tmp3 /* == this.flag */) {                                                              
          int tmp4;                                                                                 
          tmp4 := this.data;                                                                        
          {                                                                                         
             return tmp4;                                                                           
          }                                                                                         
        } else {                                                                                    
          {                                                                                         
             return 0;                                                                              
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Example {                                                                                 
       Tid owner isRead ? B : E                                                                     
                                                                                                    
      volatile boolean flag isRead                                                                  
       ? this.flag ? R : N                                                                          
       : tid == this.owner && !this.flag ? N : E                                                    
                                                                                                    
      volatile int data isRead                                                                      
       ? this.flag ? R : E                                                                          
       : tid == this.owner && !this.flag ? B : E                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
      requires tid == this.owner;                                                                   
      requires !this.flag;                                                                          
                                                                                                    
      public void init() {                                                                          
        assume this.owner == Tid.null;                                                              
        assume this.flag == false;                                                                  
        assume this.data == 0;                                                                      
        {                                                                                           
          int tmp1;                                                                                 
          tmp1 = 3;                                                                                 
          this.data := tmp1;                                                                        
          boolean tmp2;                                                                             
          tmp2 = true;                                                                              
          this.flag := tmp2;                                                                        
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int read() {                                                                           
        boolean tmp3;                                                                               
        tmp3 := this.flag;                                                                          
        if (tmp3 /* == this.flag */) {                                                              
          int tmp4;                                                                                 
          tmp4 := this.data;                                                                        
          {                                                                                         
             return tmp4;                                                                           
          }                                                                                         
        } else {                                                                                    
          {                                                                                         
             return 0;                                                                              
          }                                                                                         
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
                                                                                                    
                                                                                                    
/*** Class Decl Example ***/                                                                        
                                                                                                    
type Example;                                                                                       
const unique Example.null: Example;                                                                 
var Example._state: [Example]State;                                                                 
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Example.owner: [Example]Tid;                                                                    
                                                                                                    
function {:inline} ReadEval.Example.owner(tid: Tid,this : Example,Example._state: [Example]State,Example.owner: [Example]Tid,Example.flag: [Example]bool,Example.data: [Example]int,Example._lock: [Example]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Example.owner(tid: Tid,this : Example,newValue: Tid,Example._state: [Example]State,Example.owner: [Example]Tid,Example.flag: [Example]bool,Example.data: [Example]int,Example._lock: [Example]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Example.flag: [Example]bool;                                                                    
                                                                                                    
function {:inline} ReadEval.Example.flag(tid: Tid,this : Example,Example._state: [Example]State,Example.owner: [Example]Tid,Example.flag: [Example]bool,Example.data: [Example]int,Example._lock: [Example]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := false;                                                                            
 if (isRead) then                                                                                   
  if (Example.flag[this]) then                                                                      
   moverPath(_R, 3)                                                                                 
  else                                                                                              
   moverPath(_N, 1)                                                                                 
 else                                                                                               
  if (((tid==Example.owner[this])&&!(Example.flag[this]))) then                                     
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Example.flag(tid: Tid,this : Example,newValue: bool,Example._state: [Example]State,Example.owner: [Example]Tid,Example.flag: [Example]bool,Example.data: [Example]int,Example._lock: [Example]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if (Example.flag[this]) then                                                                      
   moverPath(_R, 3)                                                                                 
  else                                                                                              
   moverPath(_N, 1)                                                                                 
 else                                                                                               
  if (((tid==Example.owner[this])&&!(Example.flag[this]))) then                                     
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Example.data: [Example]int;                                                                     
                                                                                                    
function {:inline} ReadEval.Example.data(tid: Tid,this : Example,Example._state: [Example]State,Example.owner: [Example]Tid,Example.flag: [Example]bool,Example.data: [Example]int,Example._lock: [Example]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isRead) then                                                                                   
  if (Example.flag[this]) then                                                                      
   moverPath(_R, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (((tid==Example.owner[this])&&!(Example.flag[this]))) then                                     
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Example.data(tid: Tid,this : Example,newValue: int,Example._state: [Example]State,Example.owner: [Example]Tid,Example.flag: [Example]bool,Example.data: [Example]int,Example._lock: [Example]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if (Example.flag[this]) then                                                                      
   moverPath(_R, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (((tid==Example.owner[this])&&!(Example.flag[this]))) then                                     
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Example._lock: [Example]Tid;                                                                    
                                                                                                    
function {:inline} ReadEval.Example._lock(tid: Tid,this : Example,Example._state: [Example]State,Example.owner: [Example]Tid,Example.flag: [Example]bool,Example.data: [Example]int,Example._lock: [Example]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Example._state[this], tid)) then                                                       
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Example._lock[this]==tid)) then                                                             
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Example._lock[this]==Tid.null)&&(newValue==tid))) then                                     
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Example._lock[this]==tid)&&(newValue==Tid.null))) then                                    
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Example._lock(tid: Tid,this : Example,newValue: Tid,Example._state: [Example]State,Example.owner: [Example]Tid,Example.flag: [Example]bool,Example.data: [Example]int,Example._lock: [Example]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Example._state[this], tid)) then                                                       
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Example._lock[this]==tid)) then                                                             
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Example._lock[this]==Tid.null)&&(newValue==tid))) then                                     
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Example._lock[this]==tid)&&(newValue==Tid.null))) then                                    
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Example.init(tid:Tid, this : Example)                                                    
modifies Example._state;                                                                            
modifies Example.owner;                                                                             
modifies Example.flag;                                                                              
modifies Example.data;                                                                              
modifies Example._lock;                                                                             
                                                                                                    
requires ValidTid(tid);                                                                                    // (12.3): Bad tid
requires isLocal(Example._state[this], tid);                                                        
requires (forall _x : Example :: this != _x ==> !isLocal(Example._state[_x], tid));                 
                                                                                                    
requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock);  
requires (tid==Example.owner[this]);                                                                
                                                                                                    
requires !(Example.flag[this]);                                                                     
                                                                                                    
                                                                                                    
ensures StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock);   
{                                                                                                   
 var tmp14190145: int;                                                                              
 var this4190156: Example;                                                                          
 var mover4190145: Mover;                                                                           
 var $pc4190145: Phase;                                                                             
 var Example.flag4190145: [Example]bool;                                                            
 var tid4190156: Tid;                                                                               
 var Example.owner4190155: [Example]Tid;                                                            
 var Example.flag4190156: [Example]bool;                                                            
 var mover4190155: Mover;                                                                           
 var path4190155: int;                                                                              
 var tmp24190156: bool;                                                                             
 var tmp2: bool;                                                                                    
 var tid4190145: Tid;                                                                               
 var moverPath4190155: MoverPath;                                                                   
 var $pc4190156: Phase;                                                                             
 var path4190145: int;                                                                              
 var this4190155: Example;                                                                          
 var Example.data4190156: [Example]int;                                                             
 var Example.owner4190145: [Example]Tid;                                                            
 var tid4190155: Tid;                                                                               
 var $recorded.state4190145: int;                                                                   
 var Example.data4190155: [Example]int;                                                             
 var tmp24190155: bool;                                                                             
 var Example._state4190155: [Example]State;                                                         
 var tmp14190156: int;                                                                              
 var tmp1: int;                                                                                     
 var Example._state4190156: [Example]State;                                                         
 var Example._lock4190156: [Example]Tid;                                                            
 var Example.data4190145: [Example]int;                                                             
 var this4190145: Example;                                                                          
 var tmp14190155: int;                                                                              
 var $recorded.state4190155: int;                                                                   
 var Example._lock4190155: [Example]Tid;                                                            
 var Example.owner4190156: [Example]Tid;                                                            
 var Example._lock4190145: [Example]Tid;                                                            
 var Example._state4190145: [Example]State;                                                         
 var $pc4190155: Phase;                                                                             
 var $recorded.state4190156: int;                                                                   
 var moverPath4190145: MoverPath;                                                                   
 var Example.flag4190155: [Example]bool;                                                            
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
 assert true && leq(m#moverPath(ReadEval.Example.owner(tid: Tid,this: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock)),_R);       // (12.16): Can only have right-mover memory accesses in requires clause
 assert true && leq(m#moverPath(ReadEval.Example.flag(tid: Tid,this: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock)),_R);       // (13.12): Can only have right-mover memory accesses in requires clause
                                                                                                    
                                                                                                    
 // 12.3: assume this.owner == Tid.null;                                                            
                                                                                                    
 assume (Example.owner[this]==Tid.null);                                                            
                                                                                                    
 // 12.3: assume this.flag == false;                                                                
                                                                                                    
 assume (Example.flag[this]==false);                                                                
                                                                                                    
 // 12.3: assume this.data == 0;                                                                    
                                                                                                    
 assume (Example.data[this]==0);                                                                    
                                                                                                    
 // 15.6: int tmp1;                                                                                 
                                                                                                    
                                                                                                    
 // 15.6: tmp1 = 3;                                                                                 
                                                                                                    
 tmp1 := 3;                                                                                         
                                                                                                    
                                                                                                    
 // 15.6: this.data := tmp1;                                                                        
                                                                                                    
                                                                                                    
 moverPath4190145 := WriteEval.Example.data(tid: Tid,this: Example,tmp1: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 mover4190145 := m#moverPath(moverPath4190145);                                                     
 path4190145 := p#moverPath(moverPath4190145);                                                      
 assume Example._state4190145 == Example._state && Example.owner4190145 == Example.owner && Example.flag4190145 == Example.flag && Example.data4190145 == Example.data && Example._lock4190145 == Example._lock && tmp14190145 == tmp1 && this4190145 == this && tid4190145 == tid && $pc4190145 == $pc;
 assume $recorded.state4190145 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (15.6): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover4190145);                                                              
 assert $pc != PhaseError;                                                                                 // (15.6): Reduction failure
 Example.data[this] := tmp1;                                                                        
                                                                                                    
 // 16.6: boolean tmp2;                                                                             
                                                                                                    
                                                                                                    
 // 16.6: tmp2 = true;                                                                              
                                                                                                    
 tmp2 := true;                                                                                      
                                                                                                    
                                                                                                    
 // 16.6: this.flag := tmp2;                                                                        
                                                                                                    
                                                                                                    
 moverPath4190155 := WriteEval.Example.flag(tid: Tid,this: Example,tmp2: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 mover4190155 := m#moverPath(moverPath4190155);                                                     
 path4190155 := p#moverPath(moverPath4190155);                                                      
 assume Example._state4190155 == Example._state && Example.owner4190155 == Example.owner && Example.flag4190155 == Example.flag && Example.data4190155 == Example.data && Example._lock4190155 == Example._lock && tmp24190155 == tmp2 && tmp14190155 == tmp1 && this4190155 == this && tid4190155 == tid && $pc4190155 == $pc;
 assume $recorded.state4190155 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (16.6): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover4190155);                                                              
 assert $pc != PhaseError;                                                                                 // (16.6): Reduction failure
 Example.flag[this] := tmp2;                                                                        
                                                                                                    
 // 14.20: // return;                                                                               
                                                                                                    
 assume Example._state4190156 == Example._state && Example.owner4190156 == Example.owner && Example.flag4190156 == Example.flag && Example.data4190156 == Example.data && Example._lock4190156 == Example._lock && tmp24190156 == tmp2 && tmp14190156 == tmp1 && this4190156 == this && tid4190156 == tid;
 assume $recorded.state4190156 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Example.read(tid:Tid, this : Example)                                                    
returns ($result : int)                                                                             
modifies Example._state;                                                                            
modifies Example.owner;                                                                             
modifies Example.flag;                                                                              
modifies Example.data;                                                                              
modifies Example._lock;                                                                             
                                                                                                    
requires ValidTid(tid);                                                                                    // (19.3): Bad tid
requires isShared(Example._state[this]);                                                                   // (19.3): this is not global
                                                                                                    
requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock);  
                                                                                                    
ensures StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock);   
{                                                                                                   
 var tmp34190179: bool;                                                                             
 var $pc4190172: Phase;                                                                             
 var this4190174: Example;                                                                          
 var Example._lock4190174: [Example]Tid;                                                            
 var Example._state4190179: [Example]State;                                                         
 var Example.data4190166: [Example]int;                                                             
 var $recorded.state4190166: int;                                                                   
 var Example._state4190172: [Example]State;                                                         
 var $pc4190185: Phase;                                                                             
 var Example.data4190172: [Example]int;                                                             
 var tmp34190185: bool;                                                                             
 var tid4190185: Tid;                                                                               
 var mover4190172: Mover;                                                                           
 var tmp34190166: bool;                                                                             
 var $result4190185: int;                                                                           
 var path4190166: int;                                                                              
 var tid4190172: Tid;                                                                               
 var Example._state4190166: [Example]State;                                                         
 var Example.data4190179: [Example]int;                                                             
 var Example._lock4190185: [Example]Tid;                                                            
 var $pc4190174: Phase;                                                                             
 var $recorded.state4190179: int;                                                                   
 var Example.flag4190172: [Example]bool;                                                            
 var Example.data4190174: [Example]int;                                                             
 var $result4190174: int;                                                                           
 var Example.owner4190185: [Example]Tid;                                                            
 var $pc4190179: Phase;                                                                             
 var Example._lock4190172: [Example]Tid;                                                            
 var Example._state4190174: [Example]State;                                                         
 var $result4190179: int;                                                                           
 var $result4190172: int;                                                                           
 var Example._lock4190166: [Example]Tid;                                                            
 var Example.owner4190172: [Example]Tid;                                                            
 var this4190166: Example;                                                                          
 var moverPath4190166: MoverPath;                                                                   
 var tmp34190172: bool;                                                                             
 var Example.data4190185: [Example]int;                                                             
 var Example._state4190185: [Example]State;                                                         
 var tid4190179: Tid;                                                                               
 var $recorded.state4190172: int;                                                                   
 var this4190172: Example;                                                                          
 var path4190172: int;                                                                              
 var mover4190166: Mover;                                                                           
 var Example.flag4190166: [Example]bool;                                                            
 var Example.flag4190179: [Example]bool;                                                            
 var tid4190174: Tid;                                                                               
 var Example.owner4190166: [Example]Tid;                                                            
 var tmp34190174: bool;                                                                             
 var moverPath4190172: MoverPath;                                                                   
 var Example._lock4190179: [Example]Tid;                                                            
 var Example.owner4190179: [Example]Tid;                                                            
 var tmp44190172: int;                                                                              
 var $pc4190166: Phase;                                                                             
 var this4190179: Example;                                                                          
 var $recorded.state4190174: int;                                                                   
 var Example.flag4190174: [Example]bool;                                                            
 var tmp3: bool;                                                                                    
 var tid4190166: Tid;                                                                               
 var this4190185: Example;                                                                          
 var Example.flag4190185: [Example]bool;                                                            
 var $result4190166: int;                                                                           
 var Example.owner4190174: [Example]Tid;                                                            
 var tmp4: int;                                                                                     
 var tmp44190174: int;                                                                              
 var $recorded.state4190185: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 20.5: boolean tmp3;                                                                             
                                                                                                    
                                                                                                    
 // 20.5: tmp3 := this.flag;                                                                        
                                                                                                    
                                                                                                    
 moverPath4190166 := ReadEval.Example.flag(tid: Tid,this: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 mover4190166 := m#moverPath(moverPath4190166);                                                     
 path4190166 := p#moverPath(moverPath4190166);                                                      
 assume Example._state4190166 == Example._state && Example.owner4190166 == Example.owner && Example.flag4190166 == Example.flag && Example.data4190166 == Example.data && Example._lock4190166 == Example._lock && tmp34190166 == tmp3 && $result4190166 == $result && this4190166 == this && tid4190166 == tid && $pc4190166 == $pc;
 assume $recorded.state4190166 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Example.null;                                                                      
 } else {                                                                                           
  assert this != Example.null;                                                                             // (20.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4190166);                                                              
 assert $pc != PhaseError;                                                                                 // (20.5): Reduction failure
 tmp3 := Example.flag[this];                                                                        
 if (tmp3 /* lowered Example.flag[this] */) {                                                       
                                                                                                    
  // 21.7: int tmp4;                                                                                
                                                                                                    
                                                                                                    
  // 21.7: tmp4 := this.data;                                                                       
                                                                                                    
                                                                                                    
  moverPath4190172 := ReadEval.Example.data(tid: Tid,this: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
  mover4190172 := m#moverPath(moverPath4190172);                                                    
  path4190172 := p#moverPath(moverPath4190172);                                                     
  assume Example._state4190172 == Example._state && Example.owner4190172 == Example.owner && Example.flag4190172 == Example.flag && Example.data4190172 == Example.data && Example._lock4190172 == Example._lock && tmp44190172 == tmp4 && tmp34190172 == tmp3 && $result4190172 == $result && this4190172 == this && tid4190172 == tid && $pc4190172 == $pc;
  assume $recorded.state4190172 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != Example.null;                                                                     
  } else {                                                                                          
   assert this != Example.null;                                                                            // (21.7): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover4190172);                                                             
  assert $pc != PhaseError;                                                                                // (21.7): Reduction failure
  tmp4 := Example.data[this];                                                                       
                                                                                                    
  // 21.7:  return tmp4;                                                                            
                                                                                                    
  assume Example._state4190174 == Example._state && Example.owner4190174 == Example.owner && Example.flag4190174 == Example.flag && Example.data4190174 == Example.data && Example._lock4190174 == Example._lock && tmp44190174 == tmp4 && tmp34190174 == tmp3 && $result4190174 == $result && this4190174 == this && tid4190174 == tid;
  assume $recorded.state4190174 == 1;                                                               
  $result := tmp4;                                                                                  
  return;                                                                                           
 } else {                                                                                           
                                                                                                    
  // 23.7:  return 0;                                                                               
                                                                                                    
  assume Example._state4190179 == Example._state && Example.owner4190179 == Example.owner && Example.flag4190179 == Example.flag && Example.data4190179 == Example.data && Example._lock4190179 == Example._lock && tmp34190179 == tmp3 && $result4190179 == $result && this4190179 == this && tid4190179 == tid;
  assume $recorded.state4190179 == 1;                                                               
  $result := 0;                                                                                     
  return;                                                                                           
 }                                                                                                  
                                                                                                    
 // 19.21: // return -1;                                                                            
                                                                                                    
 assume Example._state4190185 == Example._state && Example.owner4190185 == Example.owner && Example.flag4190185 == Example.flag && Example.data4190185 == Example.data && Example._lock4190185 == Example._lock && tmp34190185 == tmp3 && $result4190185 == $result && this4190185 == this && tid4190185 == tid;
 assume $recorded.state4190185 == 1;                                                                
 $result := -1;                                                                                     
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Example._state: [Example]State,Example.owner: [Example]Tid,Example.flag: [Example]bool,Example.data: [Example]int,Example._lock: [Example]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Example  :: _i == Example.null <==> isNull(Example._state[_i])) &&                    
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Example.owner(t: Tid, u: Tid, v: Tid, w: Tid, x: Example)    
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.owner;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example.owner[x] := v;                                                                             
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example.owner(u: Tid,x: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.3): Example.owner failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Example.owner(t: Tid, u: Tid, v: Tid, w: Tid, x: Example)     
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.owner;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example.owner[x] := v;                                                                             
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Example.owner(u: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.3): Example.owner failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Example.owner(t: Tid, u: Tid, v: Tid, w: Tid, x: Example)     
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.owner;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Tid;                                                                              
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume w == Example.owner[x];                                                                      
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Example.owner[x] := havocValue;                                                                    
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example.owner(u: Tid,x: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.3): Example.owner failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Example.owner(t: Tid, u: Tid, v: Tid, w: Tid, x: Example)      
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.owner;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Tid;                                                                              
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume w == Example.owner[x];                                                                      
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Example.owner(u: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.3): Example.owner failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Example.owner(t: Tid, u: Tid, v: Tid, w: Tid, x: Example)          
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.owner;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example.owner(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Example.owner(u: Tid,x: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.3): Example.owner failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Example.owner(t: Tid, u: Tid, v: Tid, w: Tid, x: Example)           
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.owner;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Tid;                                                                              
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
 assume w == Example.owner[x];                                                                      
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example.owner(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Example.owner[x] := havocValue;                                                                    
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Example.owner(u: Tid,x: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.3): Example.owner failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Example.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example)   
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.flag;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example.flag[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example.flag(u: Tid,x: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (7.2): Example.flag failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Example.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example)    
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.flag;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example.flag[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Example.flag(u: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (7.2): Example.flag failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Example.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example)    
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.flag;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume w == Example.flag[x];                                                                       
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Example.flag[x] := havocValue;                                                                     
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example.flag(u: Tid,x: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (7.2): Example.flag failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Example.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example)     
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.flag;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : bool;                                                                             
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume w == Example.flag[x];                                                                       
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Example.flag(u: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (7.2): Example.flag failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Example.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example)         
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.flag;                                                                             
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example.flag(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Example.flag(u: Tid,x: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.2): Example.flag failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Example.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example)          
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.flag;                                                                             
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
 assume w == Example.flag[x];                                                                       
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example.flag(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Example.flag[x] := havocValue;                                                                     
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Example.flag(u: Tid,x: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.2): Example.flag failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Example.data(t: Tid, u: Tid, v: int, w: int, x: Example)     
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.data;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example.data[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example.data(u: Tid,x: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (9.2): Example.data failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Example.data(t: Tid, u: Tid, v: int, w: int, x: Example)      
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.data;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example.data[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Example.data(u: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (9.2): Example.data failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Example.data(t: Tid, u: Tid, v: int, w: int, x: Example)      
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.data;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume w == Example.data[x];                                                                       
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Example.data[x] := havocValue;                                                                     
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example.data(u: Tid,x: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (9.2): Example.data failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Example.data(t: Tid, u: Tid, v: int, w: int, x: Example)       
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.data;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume w == Example.data[x];                                                                       
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Example.data(u: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (9.2): Example.data failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Example.data(t: Tid, u: Tid, v: int, w: int, x: Example)           
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.data;                                                                             
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example.data(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Example.data(u: Tid,x: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (9.2): Example.data failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Example.data(t: Tid, u: Tid, v: int, w: int, x: Example)            
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[x], u);                                                       
 modifies Example.data;                                                                             
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
 assume w == Example.data[x];                                                                       
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example.data(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Example.data[x] := havocValue;                                                                     
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Example.data(u: Tid,x: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (9.2): Example.data failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example.owner.Example.owner(t: Tid, u: Tid, v: Tid, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.owner[x] := v;                                                                             
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.owner (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.owner (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.owner (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example.owner.Example.owner(t: Tid, u: Tid, v: Tid, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.owner;                                                                            
                                                                                                    
 {                                                                                                  
 var tmpV : Tid;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var w_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var w0_mid: Tid;                                                                                   
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: Tid;                                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example.owner[x];                                                                          
 Example.owner[x] := v;                                                                             
                                                                                                    
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example.owner[x] := tmpV;                                                                          
 Example.owner[y] := w;                                                                             
 _writeByTPost := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.owner (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example.owner.Example.owner(t: Tid, u: Tid, v: Tid, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.owner;                                                                            
                                                                                                    
 {                                                                                                  
 var tmpV : Tid;                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var w_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var w0_mid: Tid;                                                                                   
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: Tid;                                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example.owner[x];                                                                          
 Example.owner[x] := v;                                                                             
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example.owner[x] := tmpV;                                                                          
 Example.owner[y] := w;                                                                             
 _writeByTPost := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.owner (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.owner (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example.owner.Example.owner(t: Tid, u: Tid, v: Tid, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example.owner(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.owner[y] := w;                                                                             
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example.owner(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.3): Example.owner is not Read-Write Stable with respect to Example.owner (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.3): Example.owner is not Read-Write Stable with respect to Example.owner (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.3): Example.owner is not Read-Write Stable with respect to Example.owner (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example.owner.Example.owner(t: Tid, u: Tid, v: Tid, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example.owner(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.owner[x] := v;                                                                             
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example.owner(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.3): Example.owner is not Write-Read Stable with respect to Example.owner (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.3): Example.owner is not Write-Read Stable with respect to Example.owner (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.3): Example.owner is not Write-Read Stable with respect to Example.owner (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example.owner.Example.flag(t: Tid, u: Tid, v: Tid, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.owner[x] := v;                                                                             
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.owner (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.owner (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.owner (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example.owner.Example.flag(t: Tid, u: Tid, v: Tid, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.flag;                                                                             
                                                                                                    
 {                                                                                                  
 var tmpV : Tid;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var w0_mid: bool;                                                                                  
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: Tid;                                                                                    
 var w_mid: bool;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example.owner[x];                                                                          
 Example.owner[x] := v;                                                                             
                                                                                                    
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example.owner[x] := tmpV;                                                                          
 Example.flag[y] := w;                                                                              
 _writeByTPost := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.flag (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example.owner.Example.flag(t: Tid, u: Tid, v: Tid, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.flag;                                                                             
                                                                                                    
 {                                                                                                  
 var tmpV : Tid;                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var w0_mid: bool;                                                                                  
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: Tid;                                                                                    
 var w_mid: bool;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example.owner[x];                                                                          
 Example.owner[x] := v;                                                                             
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example.owner[x] := tmpV;                                                                          
 Example.flag[y] := w;                                                                              
 _writeByTPost := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.flag (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.flag (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example.owner.Example.flag(t: Tid, u: Tid, v: Tid, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example.owner(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.flag[y] := w;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example.owner(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.3): Example.owner is not Read-Write Stable with respect to Example.flag (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.3): Example.owner is not Read-Write Stable with respect to Example.flag (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.3): Example.owner is not Read-Write Stable with respect to Example.flag (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example.owner.Example.flag(t: Tid, u: Tid, v: Tid, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example.flag(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.owner[x] := v;                                                                             
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example.flag(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.2): Example.flag is not Write-Read Stable with respect to Example.owner (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.2): Example.flag is not Write-Read Stable with respect to Example.owner (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.2): Example.flag is not Write-Read Stable with respect to Example.owner (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example.owner.Example.data(t: Tid, u: Tid, v: Tid, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.owner[x] := v;                                                                             
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.owner (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (9.2): Example.data is not Write-Write Stable with respect to Example.owner (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.owner (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example.owner.Example.data(t: Tid, u: Tid, v: Tid, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.data;                                                                             
                                                                                                    
 {                                                                                                  
 var tmpV : Tid;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var w_mid: int;                                                                                    
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: Tid;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example.owner[x];                                                                          
 Example.owner[x] := v;                                                                             
                                                                                                    
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example.owner[x] := tmpV;                                                                          
 Example.data[y] := w;                                                                              
 _writeByTPost := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.data (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example.owner.Example.data(t: Tid, u: Tid, v: Tid, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.data;                                                                             
                                                                                                    
 {                                                                                                  
 var tmpV : Tid;                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var w_mid: int;                                                                                    
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: Tid;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example.owner[x];                                                                          
 Example.owner[x] := v;                                                                             
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example.owner[x] := tmpV;                                                                          
 Example.data[y] := w;                                                                              
 _writeByTPost := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.data (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.data (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example.owner.Example.data(t: Tid, u: Tid, v: Tid, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example.owner(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.data[y] := w;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example.owner(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.3): Example.owner is not Read-Write Stable with respect to Example.data (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.3): Example.owner is not Read-Write Stable with respect to Example.data (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.3): Example.owner is not Read-Write Stable with respect to Example.data (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example.owner.Example.data(t: Tid, u: Tid, v: Tid, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.owner;                                                                            
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example.data(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example.owner(t: Tid,x: Example,v: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.owner[x] := v;                                                                             
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example.data(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.2): Example.data is not Write-Read Stable with respect to Example.owner (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.2): Example.data is not Write-Read Stable with respect to Example.owner (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (9.2): Example.data is not Write-Read Stable with respect to Example.owner (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example.flag.Example.owner(t: Tid, u: Tid, v: bool, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.flag[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.flag (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.flag (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.flag (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example.flag.Example.owner(t: Tid, u: Tid, v: bool, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var w_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var w0_mid: Tid;                                                                                   
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var y_mid: Example;                                                                                
 var v_mid: bool;                                                                                   
 var Example._state_mid: [Example]State;                                                            
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example.flag[x];                                                                           
 Example.flag[x] := v;                                                                              
                                                                                                    
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example.flag[x] := tmpV;                                                                           
 Example.owner[y] := w;                                                                             
 _writeByTPost := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.owner (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example.flag.Example.owner(t: Tid, u: Tid, v: bool, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var w_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var w0_mid: Tid;                                                                                   
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var y_mid: Example;                                                                                
 var v_mid: bool;                                                                                   
 var Example._state_mid: [Example]State;                                                            
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example.flag[x];                                                                           
 Example.flag[x] := v;                                                                              
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example.flag[x] := tmpV;                                                                           
 Example.owner[y] := w;                                                                             
 _writeByTPost := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.owner (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.owner (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example.flag.Example.owner(t: Tid, u: Tid, v: bool, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example.flag(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.owner[y] := w;                                                                             
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example.flag(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Example.flag is not Read-Write Stable with respect to Example.owner (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Example.flag is not Read-Write Stable with respect to Example.owner (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Example.flag is not Read-Write Stable with respect to Example.owner (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example.flag.Example.owner(t: Tid, u: Tid, v: bool, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example.owner(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.flag[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example.owner(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.3): Example.owner is not Write-Read Stable with respect to Example.flag (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.3): Example.owner is not Write-Read Stable with respect to Example.flag (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.3): Example.owner is not Write-Read Stable with respect to Example.flag (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example.flag.Example.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.flag[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.flag (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.flag (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.flag (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example.flag.Example.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var w0_mid: bool;                                                                                  
 var y_mid: Example;                                                                                
 var v_mid: bool;                                                                                   
 var Example._state_mid: [Example]State;                                                            
 var w_mid: bool;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example.flag[x];                                                                           
 Example.flag[x] := v;                                                                              
                                                                                                    
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example.flag[x] := tmpV;                                                                           
 Example.flag[y] := w;                                                                              
 _writeByTPost := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.flag (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example.flag.Example.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var w0_mid: bool;                                                                                  
 var y_mid: Example;                                                                                
 var v_mid: bool;                                                                                   
 var Example._state_mid: [Example]State;                                                            
 var w_mid: bool;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example.flag[x];                                                                           
 Example.flag[x] := v;                                                                              
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example.flag[x] := tmpV;                                                                           
 Example.flag[y] := w;                                                                              
 _writeByTPost := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.flag (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.flag (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example.flag.Example.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example.flag(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.flag[y] := w;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example.flag(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Example.flag is not Read-Write Stable with respect to Example.flag (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Example.flag is not Read-Write Stable with respect to Example.flag (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Example.flag is not Read-Write Stable with respect to Example.flag (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example.flag.Example.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example.flag(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.flag[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example.flag(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.2): Example.flag is not Write-Read Stable with respect to Example.flag (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.2): Example.flag is not Write-Read Stable with respect to Example.flag (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.2): Example.flag is not Write-Read Stable with respect to Example.flag (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example.flag.Example.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.flag[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.flag (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (9.2): Example.data is not Write-Write Stable with respect to Example.flag (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.flag (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example.flag.Example.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var w_mid: int;                                                                                    
 var y_mid: Example;                                                                                
 var v_mid: bool;                                                                                   
 var Example._state_mid: [Example]State;                                                            
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example.flag[x];                                                                           
 Example.flag[x] := v;                                                                              
                                                                                                    
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example.flag[x] := tmpV;                                                                           
 Example.data[y] := w;                                                                              
 _writeByTPost := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.data (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example.flag.Example.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var w_mid: int;                                                                                    
 var y_mid: Example;                                                                                
 var v_mid: bool;                                                                                   
 var Example._state_mid: [Example]State;                                                            
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example.flag[x];                                                                           
 Example.flag[x] := v;                                                                              
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example.flag[x] := tmpV;                                                                           
 Example.data[y] := w;                                                                              
 _writeByTPost := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.data (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.data (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example.flag.Example.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example.flag(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.data[y] := w;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example.flag(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Example.flag is not Read-Write Stable with respect to Example.data (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Example.flag is not Read-Write Stable with respect to Example.data (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.2): Example.flag is not Read-Write Stable with respect to Example.data (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example.flag.Example.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.flag;                                                                             
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example.data(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example.flag(t: Tid,x: Example,v: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.flag[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example.data(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.2): Example.data is not Write-Read Stable with respect to Example.flag (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.2): Example.data is not Write-Read Stable with respect to Example.flag (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (9.2): Example.data is not Write-Read Stable with respect to Example.flag (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example.data.Example.owner(t: Tid, u: Tid, v: int, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.data[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.data (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.data (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.3): Example.owner is not Write-Write Stable with respect to Example.data (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example.data.Example.owner(t: Tid, u: Tid, v: int, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var w_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var w0_mid: Tid;                                                                                   
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example.data[x];                                                                           
 Example.data[x] := v;                                                                              
                                                                                                    
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example.data[x] := tmpV;                                                                           
 Example.owner[y] := w;                                                                             
 _writeByTPost := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.owner (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example.data.Example.owner(t: Tid, u: Tid, v: int, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var w_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var w0_mid: Tid;                                                                                   
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example.data[x];                                                                           
 Example.data[x] := v;                                                                              
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example.data[x] := tmpV;                                                                           
 Example.owner[y] := w;                                                                             
 _writeByTPost := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.owner (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.owner (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example.data.Example.owner(t: Tid, u: Tid, v: int, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example.data(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example.owner(u: Tid,y: Example,w: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.owner[y] := w;                                                                             
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example.data(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.2): Example.data is not Read-Write Stable with respect to Example.owner (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.2): Example.data is not Read-Write Stable with respect to Example.owner (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.2): Example.data is not Read-Write Stable with respect to Example.owner (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example.data.Example.owner(t: Tid, u: Tid, v: int, w: Tid, w0: Tid, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.owner;                                                                            
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var w_post: Tid;                                                                                   
 var x_post: Example;                                                                               
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example.owner(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.data[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example.owner(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.3): Example.owner is not Write-Read Stable with respect to Example.data (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.3): Example.owner is not Write-Read Stable with respect to Example.data (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.3): Example.owner is not Write-Read Stable with respect to Example.data (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example.data.Example.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.data[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.data (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.data (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.2): Example.flag is not Write-Write Stable with respect to Example.data (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example.data.Example.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var w0_mid: bool;                                                                                  
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: int;                                                                                    
 var w_mid: bool;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example.data[x];                                                                           
 Example.data[x] := v;                                                                              
                                                                                                    
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example.data[x] := tmpV;                                                                           
 Example.flag[y] := w;                                                                              
 _writeByTPost := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.flag (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example.data.Example.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var w0_mid: bool;                                                                                  
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: int;                                                                                    
 var w_mid: bool;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example.data[x];                                                                           
 Example.data[x] := v;                                                                              
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example.data[x] := tmpV;                                                                           
 Example.flag[y] := w;                                                                              
 _writeByTPost := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.flag (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.flag (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example.data.Example.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example.data(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example.flag(u: Tid,y: Example,w: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.flag[y] := w;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example.data(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.2): Example.data is not Read-Write Stable with respect to Example.flag (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.2): Example.data is not Read-Write Stable with respect to Example.flag (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.2): Example.data is not Read-Write Stable with respect to Example.flag (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example.data.Example.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.flag;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w0_pre: bool;                                                                                  
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example.flag(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.data[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example.flag(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.2): Example.flag is not Write-Read Stable with respect to Example.data (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.2): Example.flag is not Write-Read Stable with respect to Example.data (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.2): Example.flag is not Write-Read Stable with respect to Example.data (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example.data.Example.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.data[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.data (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (9.2): Example.data is not Write-Write Stable with respect to Example.data (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.data (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example.data.Example.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var w_mid: int;                                                                                    
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example.data[x];                                                                           
 Example.data[x] := v;                                                                              
                                                                                                    
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example.data[x] := tmpV;                                                                           
 Example.data[y] := w;                                                                              
 _writeByTPost := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.data (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example.data.Example.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Example;                                                                                
 var u_mid: Tid;                                                                                    
 var Example.flag_mid: [Example]bool;                                                               
 var $recorded.state_mid: int;                                                                      
 var Example.owner_mid: [Example]Tid;                                                               
 var Example.data_mid: [Example]int;                                                                
 var Example._lock_mid: [Example]Tid;                                                               
 var w_mid: int;                                                                                    
 var y_mid: Example;                                                                                
 var Example._state_mid: [Example]State;                                                            
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example.data[x];                                                                           
 Example.data[x] := v;                                                                              
 assume Example._state_mid == Example._state && Example.owner_mid == Example.owner && Example.flag_mid == Example.flag && Example.data_mid == Example.data && Example._lock_mid == Example._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example.data[x] := tmpV;                                                                           
 Example.data[y] := w;                                                                              
 _writeByTPost := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.data (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.2): Example.data is not Write-Write Stable with respect to Example.data (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example.data.Example.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example.data(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example.data(u: Tid,y: Example,w: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.data[y] := w;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example.data(t: Tid,x: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.2): Example.data is not Read-Write Stable with respect to Example.data (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.2): Example.data is not Read-Write Stable with respect to Example.data (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.2): Example.data is not Read-Write Stable with respect to Example.data (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example.data.Example.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example, y: Example)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example._state[x], t);                                                       
 requires isAccessible(Example._state[y], u);                                                       
 modifies Example.data;                                                                             
 modifies Example.data;                                                                             
                                                                                                    
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
 var Example._state_pre: [Example]State;                                                            
 var v_pre: int;                                                                                    
 var x_pre: Example;                                                                                
 var Example.data_pre: [Example]int;                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example._lock_pre: [Example]Tid;                                                               
 var Example.flag_pre: [Example]bool;                                                               
 var w_pre: int;                                                                                    
 var y_pre: Example;                                                                                
 var $pc_pre: Phase;                                                                                
 var Example.owner_pre: [Example]Tid;                                                               
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example.data_post: [Example]int;                                                               
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_post: Example;                                                                               
 var $pc_post: Phase;                                                                               
 var Example.owner_post: [Example]Tid;                                                              
 var Example._lock_post: [Example]Tid;                                                              
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example.flag_post: [Example]bool;                                                              
 var x_post: Example;                                                                               
 var u_post: Tid;                                                                                   
 var Example._state_post: [Example]State;                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example.data(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example.data(t: Tid,x: Example,v: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example.data[x] := v;                                                                              
 assume Example._state_post == Example._state && Example.owner_post == Example.owner && Example.flag_post == Example.flag && Example.data_post == Example.data && Example._lock_post == Example._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example.data(u: Tid,y: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.2): Example.data is not Write-Read Stable with respect to Example.data (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.2): Example.data is not Write-Read Stable with respect to Example.data (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (9.2): Example.data is not Write-Read Stable with respect to Example.data (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock);  
requires ValidTid(tid);                                                                             
modifies Example._state;                                                                            
modifies Example.owner;                                                                             
modifies Example.flag;                                                                              
modifies Example.data;                                                                              
modifies Example._lock;                                                                             
ensures StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock);   
ensures Y(tid , old(Example._state), old(Example.owner), old(Example.flag), old(Example.data), old(Example._lock) , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
                                                                                                    
// Example.owner:                                                                                   
                                                                                                    
function {:inline} Y_Example.owner(tid : Tid, this: Example, newValue: Tid , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid): bool
{                                                                                                   
 ((isAccessible(Example._state[this], tid) && leq(m#moverPath(ReadEval.Example.owner(tid: Tid,this: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock)), _R)) ==> (Example.owner[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Example.owner(tid : Tid, this: Example, newValue: Tid , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Example.owner.Subsumes.W(tid : Tid, u : Tid, this: Example, newValue: Tid , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Example.owner_yield: [Example]Tid;                                                              
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example._state_yield: [Example]State;                                                           
var u_yield: Tid;                                                                                   
var Example.flag_yield: [Example]bool;                                                              
var this_yield: Example;                                                                            
var Example.data_yield: [Example]int;                                                               
var $recorded.state_yield: int;                                                                     
var Example._lock_yield: [Example]Tid;                                                              
                                                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
 assume isAccessible(Example._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.Example.owner(u: Tid,this: Example,newValue: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock)));
                                                                                                    
assume Example._state_yield == Example._state && Example.owner_yield == Example.owner && Example.flag_yield == Example.flag && Example.data_yield == Example.data && Example._lock_yield == Example._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example.owner(tid, this, newValue , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example.owner.Reflexive(tid : Tid, this: Example , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example.owner_yield: [Example]Tid;                                                              
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example._state_yield: [Example]State;                                                           
var Example.flag_yield: [Example]bool;                                                              
var this_yield: Example;                                                                            
var Example.data_yield: [Example]int;                                                               
var $recorded.state_yield: int;                                                                     
var Example._lock_yield: [Example]Tid;                                                              
                                                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
assume Example._state_yield == Example._state && Example.owner_yield == Example.owner && Example.flag_yield == Example.flag && Example.data_yield == Example.data && Example._lock_yield == Example._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example.owner(tid, this, Example.owner[this] , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example.owner.Transitive(tid : Tid, this: Example, newValue : Tid , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid , Example._state_p: [Example]State, Example.owner_p: [Example]Tid, Example.flag_p: [Example]bool, Example.data_p: [Example]int, Example._lock_p: [Example]Tid)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires StateInvariant(Example._state_p, Example.owner_p, Example.flag_p, Example.data_p, Example._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example._state_pre: [Example]State;                                                             
var Example.data_pre: [Example]int;                                                                 
var $recorded.state_pre: int;                                                                       
var Example._lock_pre: [Example]Tid;                                                                
var Example.flag_pre: [Example]bool;                                                                
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Example;                                                                              
var Example.owner_pre: [Example]Tid;                                                                
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Example.data_post: [Example]int;                                                                
var this_post: Example;                                                                             
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var Example.owner_post: [Example]Tid;                                                               
var Example._lock_post: [Example]Tid;                                                               
var Example.flag_post: [Example]bool;                                                               
var newValue_post: Tid;                                                                             
var Example._state_post: [Example]State;                                                            
                                                                                                    
assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
 assume Y(tid , Example._state, Example.owner, Example.flag, Example.data, Example._lock , Example._state_p, Example.owner_p, Example.flag_p, Example.data_p, Example._lock_p);
 assume Y_Example.owner(tid, this, newValue , Example._state_p, Example.owner_p, Example.flag_p, Example.data_p, Example._lock_p);
assume Example._state_post == Example._state_p && Example.owner_post == Example.owner_p && Example.flag_post == Example.flag_p && Example.data_post == Example.data_p && Example._lock_post == Example._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Example.owner(tid, this, newValue , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
}                                                                                                   
// Example.flag:                                                                                    
                                                                                                    
function {:inline} Y_Example.flag(tid : Tid, this: Example, newValue: bool , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid): bool
{                                                                                                   
 ((isAccessible(Example._state[this], tid) && leq(m#moverPath(ReadEval.Example.flag(tid: Tid,this: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock)), _R)) ==> (Example.flag[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Example.flag(tid : Tid, this: Example, newValue: bool , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Example.flag.Subsumes.W(tid : Tid, u : Tid, this: Example, newValue: bool , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: bool;                                                                           
var Example.owner_yield: [Example]Tid;                                                              
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example._state_yield: [Example]State;                                                           
var u_yield: Tid;                                                                                   
var Example.flag_yield: [Example]bool;                                                              
var this_yield: Example;                                                                            
var Example.data_yield: [Example]int;                                                               
var $recorded.state_yield: int;                                                                     
var Example._lock_yield: [Example]Tid;                                                              
                                                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
 assume isAccessible(Example._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.Example.flag(u: Tid,this: Example,newValue: bool,Example._state,Example.owner,Example.flag,Example.data,Example._lock)));
                                                                                                    
assume Example._state_yield == Example._state && Example.owner_yield == Example.owner && Example.flag_yield == Example.flag && Example.data_yield == Example.data && Example._lock_yield == Example._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example.flag(tid, this, newValue , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example.flag.Reflexive(tid : Tid, this: Example , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example.owner_yield: [Example]Tid;                                                              
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example._state_yield: [Example]State;                                                           
var Example.flag_yield: [Example]bool;                                                              
var this_yield: Example;                                                                            
var Example.data_yield: [Example]int;                                                               
var $recorded.state_yield: int;                                                                     
var Example._lock_yield: [Example]Tid;                                                              
                                                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
assume Example._state_yield == Example._state && Example.owner_yield == Example.owner && Example.flag_yield == Example.flag && Example.data_yield == Example.data && Example._lock_yield == Example._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example.flag(tid, this, Example.flag[this] , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example.flag.Transitive(tid : Tid, this: Example, newValue : bool , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid , Example._state_p: [Example]State, Example.owner_p: [Example]Tid, Example.flag_p: [Example]bool, Example.data_p: [Example]int, Example._lock_p: [Example]Tid)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires StateInvariant(Example._state_p, Example.owner_p, Example.flag_p, Example.data_p, Example._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example._state_pre: [Example]State;                                                             
var newValue_pre: bool;                                                                             
var Example.data_pre: [Example]int;                                                                 
var $recorded.state_pre: int;                                                                       
var Example._lock_pre: [Example]Tid;                                                                
var Example.flag_pre: [Example]bool;                                                                
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Example;                                                                              
var Example.owner_pre: [Example]Tid;                                                                
                                                                                                    
var $recorded.state_post: int;                                                                      
var Example.data_post: [Example]int;                                                                
var this_post: Example;                                                                             
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var Example.owner_post: [Example]Tid;                                                               
var Example._lock_post: [Example]Tid;                                                               
var newValue_post: bool;                                                                            
var Example.flag_post: [Example]bool;                                                               
var Example._state_post: [Example]State;                                                            
                                                                                                    
assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
 assume Y(tid , Example._state, Example.owner, Example.flag, Example.data, Example._lock , Example._state_p, Example.owner_p, Example.flag_p, Example.data_p, Example._lock_p);
 assume Y_Example.flag(tid, this, newValue , Example._state_p, Example.owner_p, Example.flag_p, Example.data_p, Example._lock_p);
assume Example._state_post == Example._state_p && Example.owner_post == Example.owner_p && Example.flag_post == Example.flag_p && Example.data_post == Example.data_p && Example._lock_post == Example._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Example.flag(tid, this, newValue , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
}                                                                                                   
// Example.data:                                                                                    
                                                                                                    
function {:inline} Y_Example.data(tid : Tid, this: Example, newValue: int , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid): bool
{                                                                                                   
 ((isAccessible(Example._state[this], tid) && leq(m#moverPath(ReadEval.Example.data(tid: Tid,this: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock)), _R)) ==> (Example.data[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Example.data(tid : Tid, this: Example, newValue: int , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Example.data.Subsumes.W(tid : Tid, u : Tid, this: Example, newValue: int , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Example.owner_yield: [Example]Tid;                                                              
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var Example._state_yield: [Example]State;                                                           
var u_yield: Tid;                                                                                   
var Example.flag_yield: [Example]bool;                                                              
var this_yield: Example;                                                                            
var Example.data_yield: [Example]int;                                                               
var $recorded.state_yield: int;                                                                     
var Example._lock_yield: [Example]Tid;                                                              
                                                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
 assume isAccessible(Example._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.Example.data(u: Tid,this: Example,newValue: int,Example._state,Example.owner,Example.flag,Example.data,Example._lock)));
                                                                                                    
assume Example._state_yield == Example._state && Example.owner_yield == Example.owner && Example.flag_yield == Example.flag && Example.data_yield == Example.data && Example._lock_yield == Example._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example.data(tid, this, newValue , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example.data.Reflexive(tid : Tid, this: Example , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example.owner_yield: [Example]Tid;                                                              
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example._state_yield: [Example]State;                                                           
var Example.flag_yield: [Example]bool;                                                              
var this_yield: Example;                                                                            
var Example.data_yield: [Example]int;                                                               
var $recorded.state_yield: int;                                                                     
var Example._lock_yield: [Example]Tid;                                                              
                                                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
assume Example._state_yield == Example._state && Example.owner_yield == Example.owner && Example.flag_yield == Example.flag && Example.data_yield == Example.data && Example._lock_yield == Example._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example.data(tid, this, Example.data[this] , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example.data.Transitive(tid : Tid, this: Example, newValue : int , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid , Example._state_p: [Example]State, Example.owner_p: [Example]Tid, Example.flag_p: [Example]bool, Example.data_p: [Example]int, Example._lock_p: [Example]Tid)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires StateInvariant(Example._state_p, Example.owner_p, Example.flag_p, Example.data_p, Example._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example._state_pre: [Example]State;                                                             
var Example.data_pre: [Example]int;                                                                 
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Example._lock_pre: [Example]Tid;                                                                
var Example.flag_pre: [Example]bool;                                                                
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Example;                                                                              
var Example.owner_pre: [Example]Tid;                                                                
                                                                                                    
var $recorded.state_post: int;                                                                      
var Example.data_post: [Example]int;                                                                
var newValue_post: int;                                                                             
var this_post: Example;                                                                             
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var Example.owner_post: [Example]Tid;                                                               
var Example._lock_post: [Example]Tid;                                                               
var Example.flag_post: [Example]bool;                                                               
var Example._state_post: [Example]State;                                                            
                                                                                                    
assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
 assume Y(tid , Example._state, Example.owner, Example.flag, Example.data, Example._lock , Example._state_p, Example.owner_p, Example.flag_p, Example.data_p, Example._lock_p);
 assume Y_Example.data(tid, this, newValue , Example._state_p, Example.owner_p, Example.flag_p, Example.data_p, Example._lock_p);
assume Example._state_post == Example._state_p && Example.owner_post == Example.owner_p && Example.flag_post == Example.flag_p && Example.data_post == Example.data_p && Example._lock_post == Example._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Example.data(tid, this, newValue , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
}                                                                                                   
// Example._lock:                                                                                   
                                                                                                    
function {:inline} Y_Example._lock(tid : Tid, this: Example, newValue: Tid , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid): bool
{                                                                                                   
 ((isAccessible(Example._state[this], tid) && leq(m#moverPath(ReadEval.Example._lock(tid: Tid,this: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock)), _R)) ==> (Example._lock[this] == newValue))
 &&(((Example._lock[this]==tid)==(newValue==tid)))                                                  
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Example._lock(tid : Tid, this: Example, newValue: Tid , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Example._lock.Subsumes.W(tid : Tid, u : Tid, this: Example, newValue: Tid , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Example.owner_yield: [Example]Tid;                                                              
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example._state_yield: [Example]State;                                                           
var u_yield: Tid;                                                                                   
var Example.flag_yield: [Example]bool;                                                              
var this_yield: Example;                                                                            
var Example.data_yield: [Example]int;                                                               
var $recorded.state_yield: int;                                                                     
var Example._lock_yield: [Example]Tid;                                                              
                                                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
 assume isAccessible(Example._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.Example._lock(u: Tid,this: Example,newValue: Tid,Example._state,Example.owner,Example.flag,Example.data,Example._lock)));
 assume leq(m#moverPath(ReadEval.Example._lock(tid: Tid,this: Example,Example._state,Example.owner,Example.flag,Example.data,Example._lock)), _N);
assume Example._state_yield == Example._state && Example.owner_yield == Example.owner && Example.flag_yield == Example.flag && Example.data_yield == Example.data && Example._lock_yield == Example._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example._lock(tid, this, newValue , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example._lock.Reflexive(tid : Tid, this: Example , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example.owner_yield: [Example]Tid;                                                              
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example._state_yield: [Example]State;                                                           
var Example.flag_yield: [Example]bool;                                                              
var this_yield: Example;                                                                            
var Example.data_yield: [Example]int;                                                               
var $recorded.state_yield: int;                                                                     
var Example._lock_yield: [Example]Tid;                                                              
                                                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
assume Example._state_yield == Example._state && Example.owner_yield == Example.owner && Example.flag_yield == Example.flag && Example.data_yield == Example.data && Example._lock_yield == Example._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example._lock(tid, this, Example._lock[this] , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example._lock.Transitive(tid : Tid, this: Example, newValue : Tid , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid , Example._state_p: [Example]State, Example.owner_p: [Example]Tid, Example.flag_p: [Example]bool, Example.data_p: [Example]int, Example._lock_p: [Example]Tid)
 requires StateInvariant(Example._state, Example.owner, Example.flag, Example.data, Example._lock); 
 requires StateInvariant(Example._state_p, Example.owner_p, Example.flag_p, Example.data_p, Example._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example._state_pre: [Example]State;                                                             
var Example.data_pre: [Example]int;                                                                 
var $recorded.state_pre: int;                                                                       
var Example._lock_pre: [Example]Tid;                                                                
var Example.flag_pre: [Example]bool;                                                                
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Example;                                                                              
var Example.owner_pre: [Example]Tid;                                                                
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Example.data_post: [Example]int;                                                                
var this_post: Example;                                                                             
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var Example.owner_post: [Example]Tid;                                                               
var Example._lock_post: [Example]Tid;                                                               
var Example.flag_post: [Example]bool;                                                               
var newValue_post: Tid;                                                                             
var Example._state_post: [Example]State;                                                            
                                                                                                    
assume Example._state_pre == Example._state && Example.owner_pre == Example.owner && Example.flag_pre == Example.flag && Example.data_pre == Example.data && Example._lock_pre == Example._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Example._state[this], tid);                                                    
 assume Y(tid , Example._state, Example.owner, Example.flag, Example.data, Example._lock , Example._state_p, Example.owner_p, Example.flag_p, Example.data_p, Example._lock_p);
 assume Y_Example._lock(tid, this, newValue , Example._state_p, Example.owner_p, Example.flag_p, Example.data_p, Example._lock_p);
assume Example._state_post == Example._state_p && Example.owner_post == Example.owner_p && Example.flag_post == Example.flag_p && Example.data_post == Example.data_p && Example._lock_post == Example._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Example._lock(tid, this, newValue , Example._state, Example.owner, Example.flag, Example.data, Example._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Example._state: [Example]State, Example.owner: [Example]Tid, Example.flag: [Example]bool, Example.data: [Example]int, Example._lock: [Example]Tid , Example._state_p: [Example]State, Example.owner_p: [Example]Tid, Example.flag_p: [Example]bool, Example.data_p: [Example]int, Example._lock_p: [Example]Tid): bool
{                                                                                                   
 (forall this: Example :: Y_Example.owner(tid : Tid, this, Example.owner_p[this] , Example._state, Example.owner, Example.flag, Example.data, Example._lock))
 && (forall this: Example :: Y_Example.flag(tid : Tid, this, Example.flag_p[this] , Example._state, Example.owner, Example.flag, Example.data, Example._lock))
 && (forall this: Example :: Y_Example.data(tid : Tid, this, Example.data_p[this] , Example._state, Example.owner, Example.flag, Example.data, Example._lock))
 && (forall this: Example :: Y_Example._lock(tid : Tid, this, Example._lock_p[this] , Example._state, Example.owner, Example.flag, Example.data, Example._lock))
 && (forall _i : Example :: isShared(Example._state[_i]) ==> isShared(Example._state_p[_i]))        
 && (forall _i : Example :: isLocal(Example._state[_i], tid) <==> isLocal(Example._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 598.1-734.2: (Method:12.3)
// 607.1-607.24: (12.3): Bad tid
// 663.1-663.154: (12.16): Can only have right-mover memory accesses in requires clause
// 664.1-664.153: (13.12): Can only have right-mover memory accesses in requires clause
// 666.2-669.41: (class anchor.sink.Assume:12.3)
// 670.2-673.37: (class anchor.sink.Assume:12.3)
// 674.2-677.33: (class anchor.sink.Assume:12.3)
// 678.2-680.2: (class anchor.sink.VarDeclStmt:15.6)
// 681.2-684.12: (class anchor.sink.Assign:15.6)
// 686.2-702.29: (class anchor.sink.Write:15.6)
// 698.1-698.31: (15.6): Cannot have potential null deference in left-mover part.
// 701.1-701.27: (15.6): Reduction failure
// 703.2-705.2: (class anchor.sink.VarDeclStmt:16.6)
// 706.2-709.15: (class anchor.sink.Assign:16.6)
// 711.2-727.29: (class anchor.sink.Write:16.6)
// 723.1-723.31: (16.6): Cannot have potential null deference in left-mover part.
// 726.1-726.27: (16.6): Reduction failure
// 728.2-733.9: (class anchor.sink.Return:14.20)
// 735.1-888.2: (Method:19.3)
// 745.1-745.24: (19.3): Bad tid
// 746.1-746.41: (19.3): this is not global
// 822.2-824.2: (class anchor.sink.VarDeclStmt:20.5)
// 825.2-842.29: (class anchor.sink.Read:20.5)
// 837.1-837.31: (20.5): Cannot have potential null deference in left-mover part.
// 841.1-841.27: (20.5): Reduction failure
// 844.3-846.3: (class anchor.sink.VarDeclStmt:21.7)
// 847.3-864.30: (class anchor.sink.Read:21.7)
// 859.1-859.32: (21.7): Cannot have potential null deference in left-mover part.
// 863.1-863.28: (21.7): Reduction failure
// 865.3-871.10: (class anchor.sink.Return:21.7)
// 873.3-879.10: (class anchor.sink.Return:23.7)
// 881.2-887.9: (class anchor.sink.Return:19.21)
// 966.1-966.34: (5.3): Example.owner failed Write-Write Right-Mover Check
// 1027.1-1027.30: (5.3): Example.owner failed Write-Read Right-Mover Check
// 1092.1-1092.34: (5.3): Example.owner failed Write-Write Left-Mover Check
// 1154.1-1154.30: (5.3): Example.owner failed Write-Read Left-Mover Check
// 1213.1-1213.34: (5.3): Example.owner failed Read-Write Right-Mover Check
// 1275.1-1275.34: (5.3): Example.owner failed Read-Write Left-Mover Check
// 1336.1-1336.34: (7.2): Example.flag failed Write-Write Right-Mover Check
// 1397.1-1397.30: (7.2): Example.flag failed Write-Read Right-Mover Check
// 1462.1-1462.34: (7.2): Example.flag failed Write-Write Left-Mover Check
// 1524.1-1524.30: (7.2): Example.flag failed Write-Read Left-Mover Check
// 1583.1-1583.34: (7.2): Example.flag failed Read-Write Right-Mover Check
// 1645.1-1645.34: (7.2): Example.flag failed Read-Write Left-Mover Check
// 1706.1-1706.34: (9.2): Example.data failed Write-Write Right-Mover Check
// 1767.1-1767.30: (9.2): Example.data failed Write-Read Right-Mover Check
// 1832.1-1832.34: (9.2): Example.data failed Write-Write Left-Mover Check
// 1894.1-1894.30: (9.2): Example.data failed Write-Read Left-Mover Check
// 1953.1-1953.34: (9.2): Example.data failed Read-Write Right-Mover Check
// 2015.1-2015.34: (9.2): Example.data failed Read-Write Left-Mover Check
// 2088.1-2088.140: (5.3): Example.owner is not Write-Write Stable with respect to Example.owner (case A.1)
// 2089.1-2089.101: (5.3): Example.owner is not Write-Write Stable with respect to Example.owner (case A.2)
// 2090.1-2090.158: (5.3): Example.owner is not Write-Write Stable with respect to Example.owner (case A.3)
// 2189.1-2189.140: (5.3): Example.owner is not Write-Write Stable with respect to Example.owner (case C)
// 2293.1-2293.144: (5.3): Example.owner is not Write-Write Stable with respect to Example.owner (case D)
// 2294.1-2294.144: (5.3): Example.owner is not Write-Write Stable with respect to Example.owner (case R)
// 2367.1-2367.136: (5.3): Example.owner is not Read-Write Stable with respect to Example.owner (case F)
// 2368.1-2368.136: (5.3): Example.owner is not Read-Write Stable with respect to Example.owner (case H)
// 2369.1-2369.146: (5.3): Example.owner is not Read-Write Stable with respect to Example.owner (case I)
// 2441.1-2441.136: (5.3): Example.owner is not Write-Read Stable with respect to Example.owner (case J)
// 2442.1-2442.136: (5.3): Example.owner is not Write-Read Stable with respect to Example.owner (case K)
// 2443.1-2443.99: (5.3): Example.owner is not Write-Read Stable with respect to Example.owner (case L)
// 2517.1-2517.140: (7.2): Example.flag is not Write-Write Stable with respect to Example.owner (case A.1)
// 2518.1-2518.101: (7.2): Example.flag is not Write-Write Stable with respect to Example.owner (case A.2)
// 2519.1-2519.158: (7.2): Example.flag is not Write-Write Stable with respect to Example.owner (case A.3)
// 2618.1-2618.140: (5.3): Example.owner is not Write-Write Stable with respect to Example.flag (case C)
// 2722.1-2722.144: (5.3): Example.owner is not Write-Write Stable with respect to Example.flag (case D)
// 2723.1-2723.144: (5.3): Example.owner is not Write-Write Stable with respect to Example.flag (case R)
// 2796.1-2796.136: (5.3): Example.owner is not Read-Write Stable with respect to Example.flag (case F)
// 2797.1-2797.136: (5.3): Example.owner is not Read-Write Stable with respect to Example.flag (case H)
// 2798.1-2798.146: (5.3): Example.owner is not Read-Write Stable with respect to Example.flag (case I)
// 2870.1-2870.136: (7.2): Example.flag is not Write-Read Stable with respect to Example.owner (case J)
// 2871.1-2871.136: (7.2): Example.flag is not Write-Read Stable with respect to Example.owner (case K)
// 2872.1-2872.99: (7.2): Example.flag is not Write-Read Stable with respect to Example.owner (case L)
// 2946.1-2946.140: (9.2): Example.data is not Write-Write Stable with respect to Example.owner (case A.1)
// 2947.1-2947.101: (9.2): Example.data is not Write-Write Stable with respect to Example.owner (case A.2)
// 2948.1-2948.158: (9.2): Example.data is not Write-Write Stable with respect to Example.owner (case A.3)
// 3047.1-3047.140: (5.3): Example.owner is not Write-Write Stable with respect to Example.data (case C)
// 3151.1-3151.144: (5.3): Example.owner is not Write-Write Stable with respect to Example.data (case D)
// 3152.1-3152.144: (5.3): Example.owner is not Write-Write Stable with respect to Example.data (case R)
// 3225.1-3225.136: (5.3): Example.owner is not Read-Write Stable with respect to Example.data (case F)
// 3226.1-3226.136: (5.3): Example.owner is not Read-Write Stable with respect to Example.data (case H)
// 3227.1-3227.146: (5.3): Example.owner is not Read-Write Stable with respect to Example.data (case I)
// 3299.1-3299.136: (9.2): Example.data is not Write-Read Stable with respect to Example.owner (case J)
// 3300.1-3300.136: (9.2): Example.data is not Write-Read Stable with respect to Example.owner (case K)
// 3301.1-3301.99: (9.2): Example.data is not Write-Read Stable with respect to Example.owner (case L)
// 3375.1-3375.140: (5.3): Example.owner is not Write-Write Stable with respect to Example.flag (case A.1)
// 3376.1-3376.101: (5.3): Example.owner is not Write-Write Stable with respect to Example.flag (case A.2)
// 3377.1-3377.158: (5.3): Example.owner is not Write-Write Stable with respect to Example.flag (case A.3)
// 3476.1-3476.140: (7.2): Example.flag is not Write-Write Stable with respect to Example.owner (case C)
// 3580.1-3580.144: (7.2): Example.flag is not Write-Write Stable with respect to Example.owner (case D)
// 3581.1-3581.144: (7.2): Example.flag is not Write-Write Stable with respect to Example.owner (case R)
// 3654.1-3654.136: (7.2): Example.flag is not Read-Write Stable with respect to Example.owner (case F)
// 3655.1-3655.136: (7.2): Example.flag is not Read-Write Stable with respect to Example.owner (case H)
// 3656.1-3656.146: (7.2): Example.flag is not Read-Write Stable with respect to Example.owner (case I)
// 3728.1-3728.136: (5.3): Example.owner is not Write-Read Stable with respect to Example.flag (case J)
// 3729.1-3729.136: (5.3): Example.owner is not Write-Read Stable with respect to Example.flag (case K)
// 3730.1-3730.99: (5.3): Example.owner is not Write-Read Stable with respect to Example.flag (case L)
// 3804.1-3804.140: (7.2): Example.flag is not Write-Write Stable with respect to Example.flag (case A.1)
// 3805.1-3805.101: (7.2): Example.flag is not Write-Write Stable with respect to Example.flag (case A.2)
// 3806.1-3806.158: (7.2): Example.flag is not Write-Write Stable with respect to Example.flag (case A.3)
// 3905.1-3905.140: (7.2): Example.flag is not Write-Write Stable with respect to Example.flag (case C)
// 4009.1-4009.144: (7.2): Example.flag is not Write-Write Stable with respect to Example.flag (case D)
// 4010.1-4010.144: (7.2): Example.flag is not Write-Write Stable with respect to Example.flag (case R)
// 4083.1-4083.136: (7.2): Example.flag is not Read-Write Stable with respect to Example.flag (case F)
// 4084.1-4084.136: (7.2): Example.flag is not Read-Write Stable with respect to Example.flag (case H)
// 4085.1-4085.146: (7.2): Example.flag is not Read-Write Stable with respect to Example.flag (case I)
// 4157.1-4157.136: (7.2): Example.flag is not Write-Read Stable with respect to Example.flag (case J)
// 4158.1-4158.136: (7.2): Example.flag is not Write-Read Stable with respect to Example.flag (case K)
// 4159.1-4159.99: (7.2): Example.flag is not Write-Read Stable with respect to Example.flag (case L)
// 4233.1-4233.140: (9.2): Example.data is not Write-Write Stable with respect to Example.flag (case A.1)
// 4234.1-4234.101: (9.2): Example.data is not Write-Write Stable with respect to Example.flag (case A.2)
// 4235.1-4235.158: (9.2): Example.data is not Write-Write Stable with respect to Example.flag (case A.3)
// 4334.1-4334.140: (7.2): Example.flag is not Write-Write Stable with respect to Example.data (case C)
// 4438.1-4438.144: (7.2): Example.flag is not Write-Write Stable with respect to Example.data (case D)
// 4439.1-4439.144: (7.2): Example.flag is not Write-Write Stable with respect to Example.data (case R)
// 4512.1-4512.136: (7.2): Example.flag is not Read-Write Stable with respect to Example.data (case F)
// 4513.1-4513.136: (7.2): Example.flag is not Read-Write Stable with respect to Example.data (case H)
// 4514.1-4514.146: (7.2): Example.flag is not Read-Write Stable with respect to Example.data (case I)
// 4586.1-4586.136: (9.2): Example.data is not Write-Read Stable with respect to Example.flag (case J)
// 4587.1-4587.136: (9.2): Example.data is not Write-Read Stable with respect to Example.flag (case K)
// 4588.1-4588.99: (9.2): Example.data is not Write-Read Stable with respect to Example.flag (case L)
// 4662.1-4662.140: (5.3): Example.owner is not Write-Write Stable with respect to Example.data (case A.1)
// 4663.1-4663.101: (5.3): Example.owner is not Write-Write Stable with respect to Example.data (case A.2)
// 4664.1-4664.158: (5.3): Example.owner is not Write-Write Stable with respect to Example.data (case A.3)
// 4763.1-4763.140: (9.2): Example.data is not Write-Write Stable with respect to Example.owner (case C)
// 4867.1-4867.144: (9.2): Example.data is not Write-Write Stable with respect to Example.owner (case D)
// 4868.1-4868.144: (9.2): Example.data is not Write-Write Stable with respect to Example.owner (case R)
// 4941.1-4941.136: (9.2): Example.data is not Read-Write Stable with respect to Example.owner (case F)
// 4942.1-4942.136: (9.2): Example.data is not Read-Write Stable with respect to Example.owner (case H)
// 4943.1-4943.146: (9.2): Example.data is not Read-Write Stable with respect to Example.owner (case I)
// 5015.1-5015.136: (5.3): Example.owner is not Write-Read Stable with respect to Example.data (case J)
// 5016.1-5016.136: (5.3): Example.owner is not Write-Read Stable with respect to Example.data (case K)
// 5017.1-5017.99: (5.3): Example.owner is not Write-Read Stable with respect to Example.data (case L)
// 5091.1-5091.140: (7.2): Example.flag is not Write-Write Stable with respect to Example.data (case A.1)
// 5092.1-5092.101: (7.2): Example.flag is not Write-Write Stable with respect to Example.data (case A.2)
// 5093.1-5093.158: (7.2): Example.flag is not Write-Write Stable with respect to Example.data (case A.3)
// 5192.1-5192.140: (9.2): Example.data is not Write-Write Stable with respect to Example.flag (case C)
// 5296.1-5296.144: (9.2): Example.data is not Write-Write Stable with respect to Example.flag (case D)
// 5297.1-5297.144: (9.2): Example.data is not Write-Write Stable with respect to Example.flag (case R)
// 5370.1-5370.136: (9.2): Example.data is not Read-Write Stable with respect to Example.flag (case F)
// 5371.1-5371.136: (9.2): Example.data is not Read-Write Stable with respect to Example.flag (case H)
// 5372.1-5372.146: (9.2): Example.data is not Read-Write Stable with respect to Example.flag (case I)
// 5444.1-5444.136: (7.2): Example.flag is not Write-Read Stable with respect to Example.data (case J)
// 5445.1-5445.136: (7.2): Example.flag is not Write-Read Stable with respect to Example.data (case K)
// 5446.1-5446.99: (7.2): Example.flag is not Write-Read Stable with respect to Example.data (case L)
// 5520.1-5520.140: (9.2): Example.data is not Write-Write Stable with respect to Example.data (case A.1)
// 5521.1-5521.101: (9.2): Example.data is not Write-Write Stable with respect to Example.data (case A.2)
// 5522.1-5522.158: (9.2): Example.data is not Write-Write Stable with respect to Example.data (case A.3)
// 5621.1-5621.140: (9.2): Example.data is not Write-Write Stable with respect to Example.data (case C)
// 5725.1-5725.144: (9.2): Example.data is not Write-Write Stable with respect to Example.data (case D)
// 5726.1-5726.144: (9.2): Example.data is not Write-Write Stable with respect to Example.data (case R)
// 5799.1-5799.136: (9.2): Example.data is not Read-Write Stable with respect to Example.data (case F)
// 5800.1-5800.136: (9.2): Example.data is not Read-Write Stable with respect to Example.data (case H)
// 5801.1-5801.146: (9.2): Example.data is not Read-Write Stable with respect to Example.data (case I)
// 5873.1-5873.136: (9.2): Example.data is not Write-Read Stable with respect to Example.data (case J)
// 5874.1-5874.136: (9.2): Example.data is not Write-Read Stable with respect to Example.data (case K)
// 5875.1-5875.99: (9.2): Example.data is not Write-Read Stable with respect to Example.data (case L)
// 5908.1-5929.2: (5.3): yields_as clause for Example.owner is not valid
// 5934.1-5950.2: (5.3): yields_as clause for Example.owner is not reflexive
// 5956.1-5988.2: (5.3): yields_as clause for Example.owner is not transitive
// 6007.1-6028.2: (7.2): yields_as clause for Example.flag is not valid
// 6033.1-6049.2: (7.2): yields_as clause for Example.flag is not reflexive
// 6055.1-6087.2: (7.2): yields_as clause for Example.flag is not transitive
// 6106.1-6127.2: (9.2): yields_as clause for Example.data is not valid
// 6132.1-6148.2: (9.2): yields_as clause for Example.data is not reflexive
// 6154.1-6186.2: (9.2): yields_as clause for Example.data is not transitive
// 6206.1-6227.2: (7.32): yields_as clause for Example._lock is not valid
// 6232.1-6248.2: (7.32): yields_as clause for Example._lock is not reflexive
// 6254.1-6286.2: (7.32): yields_as clause for Example._lock is not transitive
