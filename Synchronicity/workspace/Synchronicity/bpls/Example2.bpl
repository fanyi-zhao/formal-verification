                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/Example2.anchor:                         
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Example2 {                                                                                
      volatile int data isRead                                                                      
       ? this.flag ? B : E                                                                          
       : tid == 0 && !this.flag ? B : E                                                             
                                                                                                    
      volatile boolean flag isRead                                                                  
       ? this.flag || tid == 0 ? R : N                                                              
       : tid == 0 && !this.flag ? N : E                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.data == 0;                                                                      
        assume this.flag == false;                                                                  
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void worker() {                                                                        
        boolean tmp1;                                                                               
        tmp1 = tid == 0;                                                                            
        if (tmp1 /* == tid == 0 */) {                                                               
          boolean tmp2;                                                                             
          boolean tmp3;                                                                             
          tmp3 := this.flag;                                                                        
          tmp2 = !tmp3;                                                                             
          if (tmp2 /* == !this.flag */) {                                                           
            int tmp4;                                                                               
            tmp4 = 2;                                                                               
            this.data := tmp4;                                                                      
            boolean tmp5;                                                                           
            tmp5 = true;                                                                            
            this.flag := tmp5;                                                                      
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        } else {                                                                                    
          while (true)   {                                                                          
            boolean tmp6;                                                                           
            boolean tmp7;                                                                           
            tmp7 := this.flag;                                                                      
            tmp6 = !tmp7;                                                                           
            if (!tmp6) break; else {                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              yield;                                                                                
            }                                                                                       
          }                                                                                         
          int y;                                                                                    
          y := this.data;                                                                           
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Example2 {                                                                                
      volatile int data isRead                                                                      
       ? this.flag ? B : E                                                                          
       : tid == 0 && !this.flag ? B : E                                                             
                                                                                                    
      volatile boolean flag isRead                                                                  
       ? this.flag || tid == 0 ? R : N                                                              
       : tid == 0 && !this.flag ? N : E                                                             
                                                                                                    
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
        assume this.data == 0;                                                                      
        assume this.flag == false;                                                                  
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void worker() {                                                                        
        boolean tmp1;                                                                               
        tmp1 = tid == 0;                                                                            
        if (tmp1 /* == tid == 0 */) {                                                               
          boolean tmp2;                                                                             
          boolean tmp3;                                                                             
          tmp3 := this.flag;                                                                        
          tmp2 = !tmp3;                                                                             
          if (tmp2 /* == !this.flag */) {                                                           
            int tmp4;                                                                               
            tmp4 = 2;                                                                               
            this.data := tmp4;                                                                      
            boolean tmp5;                                                                           
            tmp5 = true;                                                                            
            this.flag := tmp5;                                                                      
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        } else {                                                                                    
          while (true)   {                                                                          
            boolean tmp6;                                                                           
            boolean tmp7;                                                                           
            tmp7 := this.flag;                                                                      
            tmp6 = !tmp7;                                                                           
            if (!tmp6) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              yield;                                                                                
            }                                                                                       
          }                                                                                         
          int y;                                                                                    
          y := this.data;                                                                           
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Example2 {                                                                                
      volatile int data isRead                                                                      
       ? this.flag ? B : E                                                                          
       : tid == 0 && !this.flag ? B : E                                                             
                                                                                                    
      volatile boolean flag isRead                                                                  
       ? this.flag || tid == 0 ? R : N                                                              
       : tid == 0 && !this.flag ? N : E                                                             
                                                                                                    
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
        assume this.data == 0;                                                                      
        assume this.flag == false;                                                                  
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void worker() {                                                                        
        boolean tmp1;                                                                               
        tmp1 = tid == 0;                                                                            
        if (tmp1 /* == tid == 0 */) {                                                               
          boolean tmp2;                                                                             
          boolean tmp3;                                                                             
          tmp3 := this.flag;                                                                        
          tmp2 = !tmp3;                                                                             
          if (tmp2 /* == !this.flag */) {                                                           
            int tmp4;                                                                               
            tmp4 = 2;                                                                               
            this.data := tmp4;                                                                      
            boolean tmp5;                                                                           
            tmp5 = true;                                                                            
            this.flag := tmp5;                                                                      
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        } else {                                                                                    
          while (true)   {                                                                          
            boolean tmp6;                                                                           
            boolean tmp7;                                                                           
            tmp7 := this.flag;                                                                      
            tmp6 = !tmp7;                                                                           
            if (!tmp6) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              yield;                                                                                
            }                                                                                       
          }                                                                                         
          int y;                                                                                    
          y := this.data;                                                                           
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Example2 {                                                                                
      volatile int data isRead                                                                      
       ? this.flag ? B : E                                                                          
       : tid == 0 && !this.flag ? B : E                                                             
                                                                                                    
      volatile boolean flag isRead                                                                  
       ? this.flag || tid == 0 ? R : N                                                              
       : tid == 0 && !this.flag ? N : E                                                             
                                                                                                    
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
        assume this.data == 0;                                                                      
        assume this.flag == false;                                                                  
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void worker() {                                                                        
        boolean tmp1;                                                                               
        tmp1 = tid == 0;                                                                            
        if (tmp1 /* == tid == 0 */) {                                                               
          boolean tmp2;                                                                             
          boolean tmp3;                                                                             
          tmp3 := this.flag;                                                                        
          tmp2 = !tmp3;                                                                             
          if (tmp2 /* == !this.flag */) {                                                           
            int tmp4;                                                                               
            tmp4 = 2;                                                                               
            this.data := tmp4;                                                                      
            boolean tmp5;                                                                           
            tmp5 = true;                                                                            
            this.flag := tmp5;                                                                      
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        } else {                                                                                    
          while (true)   {                                                                          
            boolean tmp6;                                                                           
            boolean tmp7;                                                                           
            tmp7 := this.flag;                                                                      
            tmp6 = !tmp7;                                                                           
            if (!tmp6) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              yield;                                                                                
            }                                                                                       
          }                                                                                         
          int y;                                                                                    
          y := this.data;                                                                           
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
                                                                                                    
                                                                                                    
/*** Class Decl Example2 ***/                                                                       
                                                                                                    
type Example2;                                                                                      
const unique Example2.null: Example2;                                                               
var Example2._state: [Example2]State;                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Example2.data: [Example2]int;                                                                   
                                                                                                    
function {:inline} ReadEval.Example2.data(tid: Tid,this : Example2,Example2._state: [Example2]State,Example2.data: [Example2]int,Example2.flag: [Example2]bool,Example2._lock: [Example2]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isRead) then                                                                                   
  if (Example2.flag[this]) then                                                                     
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (((tid==0)&&!(Example2.flag[this]))) then                                                      
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Example2.data(tid: Tid,this : Example2,newValue: int,Example2._state: [Example2]State,Example2.data: [Example2]int,Example2.flag: [Example2]bool,Example2._lock: [Example2]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if (Example2.flag[this]) then                                                                     
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (((tid==0)&&!(Example2.flag[this]))) then                                                      
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Example2.flag: [Example2]bool;                                                                  
                                                                                                    
function {:inline} ReadEval.Example2.flag(tid: Tid,this : Example2,Example2._state: [Example2]State,Example2.data: [Example2]int,Example2.flag: [Example2]bool,Example2._lock: [Example2]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := false;                                                                            
 if (isRead) then                                                                                   
  if ((Example2.flag[this]||(tid==0))) then                                                         
   moverPath(_R, 3)                                                                                 
  else                                                                                              
   moverPath(_N, 1)                                                                                 
 else                                                                                               
  if (((tid==0)&&!(Example2.flag[this]))) then                                                      
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Example2.flag(tid: Tid,this : Example2,newValue: bool,Example2._state: [Example2]State,Example2.data: [Example2]int,Example2.flag: [Example2]bool,Example2._lock: [Example2]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if ((Example2.flag[this]||(tid==0))) then                                                         
   moverPath(_R, 3)                                                                                 
  else                                                                                              
   moverPath(_N, 1)                                                                                 
 else                                                                                               
  if (((tid==0)&&!(Example2.flag[this]))) then                                                      
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Example2._lock: [Example2]Tid;                                                                  
                                                                                                    
function {:inline} ReadEval.Example2._lock(tid: Tid,this : Example2,Example2._state: [Example2]State,Example2.data: [Example2]int,Example2.flag: [Example2]bool,Example2._lock: [Example2]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Example2._state[this], tid)) then                                                      
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Example2._lock[this]==tid)) then                                                            
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Example2._lock[this]==Tid.null)&&(newValue==tid))) then                                    
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Example2._lock[this]==tid)&&(newValue==Tid.null))) then                                   
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Example2._lock(tid: Tid,this : Example2,newValue: Tid,Example2._state: [Example2]State,Example2.data: [Example2]int,Example2.flag: [Example2]bool,Example2._lock: [Example2]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Example2._state[this], tid)) then                                                      
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Example2._lock[this]==tid)) then                                                            
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Example2._lock[this]==Tid.null)&&(newValue==tid))) then                                    
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Example2._lock[this]==tid)&&(newValue==Tid.null))) then                                   
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Example2.worker(tid:Tid, this : Example2)                                                
modifies Example2._state;                                                                           
modifies Example2.data;                                                                             
modifies Example2.flag;                                                                             
modifies Example2._lock;                                                                            
                                                                                                    
requires ValidTid(tid);                                                                                    // (8.5): Bad tid
requires isShared(Example2._state[this]);                                                                  // (8.5): this is not global
                                                                                                    
requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);             
                                                                                                    
ensures StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);              
{                                                                                                   
 var moverPath17020: MoverPath;                                                                     
 var $recorded.state17030: int;                                                                     
 var $recorded.state17020: int;                                                                     
 var $pc17062: Phase;                                                                               
 var Example2._state17056: [Example2]State;                                                         
 var tmp217020: bool;                                                                               
 var moverPath17005: MoverPath;                                                                     
 var Example2.data17053_post: [Example2]int;                                                        
 var Example2._lock17056_bottom: [Example2]Tid;                                                     
 var mover17030: Mover;                                                                             
 var this17043: Example2;                                                                           
 var Example2._state17056_bottom: [Example2]State;                                                  
 var path17030: int;                                                                                
 var this17053_post: Example2;                                                                      
 var tid17062: Tid;                                                                                 
 var $pc17065: Phase;                                                                               
 var this17053: Example2;                                                                           
 var phase17056: Phase;                                                                             
 var mover17020: Mover;                                                                             
 var tmp5: bool;                                                                                    
 var tmp717043: bool;                                                                               
 var tmp417030: int;                                                                                
 var $recorded.state17056_bottom: int;                                                              
 var tid17005: Tid;                                                                                 
 var tmp317005: bool;                                                                               
 var this17065: Example2;                                                                           
 var tid17020: Tid;                                                                                 
 var tid17065: Tid;                                                                                 
 var Example2._state17053: [Example2]State;                                                         
 var Example2._state17020: [Example2]State;                                                         
 var Example2._state17043: [Example2]State;                                                         
 var Example2._lock17030: [Example2]Tid;                                                            
 var $pc17020: Phase;                                                                               
 var this17056: Example2;                                                                           
 var tmp1: bool;                                                                                    
 var Example2.flag17056: [Example2]bool;                                                            
 var tmp617053_post: bool;                                                                          
 var tmp117056: bool;                                                                               
 var tmp2: bool;                                                                                    
 var $recorded.state17005: int;                                                                     
 var $recorded.state17053: int;                                                                     
 var tid17056_bottom: Tid;                                                                          
 var Example2._lock17043: [Example2]Tid;                                                            
 var Example2._lock17053: [Example2]Tid;                                                            
 var $recorded.state17062: int;                                                                     
 var tid17053: Tid;                                                                                 
 var this17020: Example2;                                                                           
 var tmp417020: int;                                                                                
 var this17005: Example2;                                                                           
 var path17043: int;                                                                                
 var Example2.flag17056_bottom: [Example2]bool;                                                     
 var Example2.data17020: [Example2]int;                                                             
 var $pc17056_bottom: Phase;                                                                        
 var tmp117065: bool;                                                                               
 var tmp117020: bool;                                                                               
 var Example2._state17065: [Example2]State;                                                         
 var $pc17053_post: Phase;                                                                          
 var $recorded.state17065: int;                                                                     
 var y17062: int;                                                                                   
 var Example2._state17005: [Example2]State;                                                         
 var path17005: int;                                                                                
 var Example2._lock17053_post: [Example2]Tid;                                                       
 var mover17005: Mover;                                                                             
 var moverPath17030: MoverPath;                                                                     
 var Example2.data17005: [Example2]int;                                                             
 var Example2._lock17056: [Example2]Tid;                                                            
 var mover17062: Mover;                                                                             
 var Example2.flag17030: [Example2]bool;                                                            
 var $pc17056: Phase;                                                                               
 var Example2.flag17065: [Example2]bool;                                                            
 var Example2._lock17020: [Example2]Tid;                                                            
 var $recorded.state17056: int;                                                                     
 var tmp317020: bool;                                                                               
 var $recorded.state17043: int;                                                                     
 var tmp117062: bool;                                                                               
 var y: int;                                                                                        
 var $pc17030: Phase;                                                                               
 var Example2.flag17053_post: [Example2]bool;                                                       
 var tmp7: bool;                                                                                    
 var tid17053_post: Tid;                                                                            
 var Example2.flag17053: [Example2]bool;                                                            
 var tid17043: Tid;                                                                                 
 var Example2._state17053_post: [Example2]State;                                                    
 var tmp117030: bool;                                                                               
 var tmp317030: bool;                                                                               
 var tmp717053: bool;                                                                               
 var tmp217005: bool;                                                                               
 var Example2.flag17043: [Example2]bool;                                                            
 var path17062: int;                                                                                
 var Example2.data17030: [Example2]int;                                                             
 var Example2._lock17005: [Example2]Tid;                                                            
 var moverPath17043: MoverPath;                                                                     
 var Example2.flag17062: [Example2]bool;                                                            
 var $recorded.state17053_post: int;                                                                
 var tmp717053_post: bool;                                                                          
 var Example2._lock17065: [Example2]Tid;                                                            
 var tmp117056_bottom: bool;                                                                        
 var Example2._lock17062: [Example2]Tid;                                                            
 var tmp3: bool;                                                                                    
 var tmp6: bool;                                                                                    
 var tid17030: Tid;                                                                                 
 var this17030: Example2;                                                                           
 var Example2.data17065: [Example2]int;                                                             
 var $pc17043: Phase;                                                                               
 var tmp117053: bool;                                                                               
 var Example2._state17030: [Example2]State;                                                         
 var mover17043: Mover;                                                                             
 var Example2.data17056_bottom: [Example2]int;                                                      
 var $pc17005: Phase;                                                                               
 var tmp517030: bool;                                                                               
 var tmp617053: bool;                                                                               
 var tmp217030: bool;                                                                               
 var Example2.flag17020: [Example2]bool;                                                            
 var tmp617043: bool;                                                                               
 var tmp117005: bool;                                                                               
 var tid17056: Tid;                                                                                 
 var $pc17053: Phase;                                                                               
 var Example2._state17062: [Example2]State;                                                         
 var path17020: int;                                                                                
 var moverPath17062: MoverPath;                                                                     
 var this17062: Example2;                                                                           
 var Example2.flag17005: [Example2]bool;                                                            
 var Example2.data17043: [Example2]int;                                                             
 var tmp4: int;                                                                                     
 var tmp117053_post: bool;                                                                          
 var Example2.data17062: [Example2]int;                                                             
 var this17056_bottom: Example2;                                                                    
 var Example2.data17056: [Example2]int;                                                             
 var tmp117043: bool;                                                                               
 var Example2.data17053: [Example2]int;                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 9.9: boolean tmp1;                                                                              
                                                                                                    
                                                                                                    
 // 9.9: tmp1 = tid == 0;                                                                           
                                                                                                    
 tmp1 := (tid==0);                                                                                  
 if (tmp1 /* lowered (tid==0) */) {                                                                 
                                                                                                    
  // 10.13: boolean tmp2;                                                                           
                                                                                                    
                                                                                                    
  // 10.13: boolean tmp3;                                                                           
                                                                                                    
                                                                                                    
  // 10.13: tmp3 := this.flag;                                                                      
                                                                                                    
                                                                                                    
  moverPath17005 := ReadEval.Example2.flag(tid: Tid,this: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
  mover17005 := m#moverPath(moverPath17005);                                                        
  path17005 := p#moverPath(moverPath17005);                                                         
  assume Example2._state17005 == Example2._state && Example2.data17005 == Example2.data && Example2.flag17005 == Example2.flag && Example2._lock17005 == Example2._lock && tmp317005 == tmp3 && tmp217005 == tmp2 && tmp117005 == tmp1 && this17005 == this && tid17005 == tid && $pc17005 == $pc;
  assume $recorded.state17005 == 1;                                                                 
  if ($pc == PreCommit) {                                                                           
   assume this != Example2.null;                                                                    
  } else {                                                                                          
   assert this != Example2.null;                                                                           // (10.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover17005);                                                               
  assert $pc != PhaseError;                                                                                // (10.13): Reduction failure
  tmp3 := Example2.flag[this];                                                                      
                                                                                                    
  // 10.13: tmp2 = !tmp3;                                                                           
                                                                                                    
  tmp2 := !(tmp3);                                                                                  
  if (tmp2 /* lowered !(Example2.flag[this]) */) {                                                  
                                                                                                    
   // 11.17: int tmp4;                                                                              
                                                                                                    
                                                                                                    
   // 11.17: tmp4 = 2;                                                                              
                                                                                                    
   tmp4 := 2;                                                                                       
                                                                                                    
                                                                                                    
   // 11.17: this.data := tmp4;                                                                     
                                                                                                    
                                                                                                    
   moverPath17020 := WriteEval.Example2.data(tid: Tid,this: Example2,tmp4: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
   mover17020 := m#moverPath(moverPath17020);                                                       
   path17020 := p#moverPath(moverPath17020);                                                        
   assume Example2._state17020 == Example2._state && Example2.data17020 == Example2.data && Example2.flag17020 == Example2.flag && Example2._lock17020 == Example2._lock && tmp417020 == tmp4 && tmp317020 == tmp3 && tmp217020 == tmp2 && tmp117020 == tmp1 && this17020 == this && tid17020 == tid && $pc17020 == $pc;
   assume $recorded.state17020 == 1;                                                                
   if ($pc == PreCommit) {                                                                          
    assume this != Example2.null;                                                                   
   } else {                                                                                         
    assert this != Example2.null;                                                                          // (11.17): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover17020);                                                              
   assert $pc != PhaseError;                                                                               // (11.17): Reduction failure
   Example2.data[this] := tmp4;                                                                     
                                                                                                    
   // 12.17: boolean tmp5;                                                                          
                                                                                                    
                                                                                                    
   // 12.17: tmp5 = true;                                                                           
                                                                                                    
   tmp5 := true;                                                                                    
                                                                                                    
                                                                                                    
   // 12.17: this.flag := tmp5;                                                                     
                                                                                                    
                                                                                                    
   moverPath17030 := WriteEval.Example2.flag(tid: Tid,this: Example2,tmp5: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
   mover17030 := m#moverPath(moverPath17030);                                                       
   path17030 := p#moverPath(moverPath17030);                                                        
   assume Example2._state17030 == Example2._state && Example2.data17030 == Example2.data && Example2.flag17030 == Example2.flag && Example2._lock17030 == Example2._lock && tmp517030 == tmp5 && tmp417030 == tmp4 && tmp317030 == tmp3 && tmp217030 == tmp2 && tmp117030 == tmp1 && this17030 == this && tid17030 == tid && $pc17030 == $pc;
   assume $recorded.state17030 == 1;                                                                
   if ($pc == PreCommit) {                                                                          
    assume this != Example2.null;                                                                   
   } else {                                                                                         
    assert this != Example2.null;                                                                          // (12.17): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover17030);                                                              
   assert $pc != PhaseError;                                                                               // (12.17): Reduction failure
   Example2.flag[this] := tmp5;                                                                     
  } else {                                                                                          
  }                                                                                                 
 } else {                                                                                           
  assume Example2._state17056 == Example2._state && Example2.data17056 == Example2.data && Example2.flag17056 == Example2.flag && Example2._lock17056 == Example2._lock && tmp117056 == tmp1 && this17056 == this && tid17056 == tid;
  assume $recorded.state17056 == 1;                                                                 
                                                                                                    
  // 15.13: while (true)   {                                                                        
                                                                                                    
  phase17056 := $pc;                                                                                
  while (true)                                                                                      
                                                                                                    
   invariant ValidTid(tid);                                                                                // (8.5): Bad tid
   invariant isShared(Example2._state[this]);                                                              // (8.5): this is not global
                                                                                                    
   invariant StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);         
   invariant (forall _this : Example2 :: Invariant.Y_Example2.data(tid : Tid, _this, Example2.data[_this] ,Example2._state17056,Example2.data17056,Example2.flag17056,Example2._lock17056));       // (15.13): Loop does not preserve yields_as annotation for field data
   invariant (forall _this : Example2 :: Invariant.Y_Example2.flag(tid : Tid, _this, Example2.flag[_this] ,Example2._state17056,Example2.data17056,Example2.flag17056,Example2._lock17056));       // (15.13): Loop does not preserve yields_as annotation for field flag
   invariant phase17056 == $pc;                                                                            // (15.13): Phase must be invariant at loop head
   invariant $pc == PreCommit;                                                                             // (15.13): Potentially infinite loop cannot be in post-commit phase.
  {                                                                                                 
                                                                                                    
   // 15.20: boolean tmp6;                                                                          
                                                                                                    
                                                                                                    
   // 15.21: boolean tmp7;                                                                          
                                                                                                    
                                                                                                    
   // 15.21: tmp7 := this.flag;                                                                     
                                                                                                    
                                                                                                    
   moverPath17043 := ReadEval.Example2.flag(tid: Tid,this: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
   mover17043 := m#moverPath(moverPath17043);                                                       
   path17043 := p#moverPath(moverPath17043);                                                        
   assume Example2._state17043 == Example2._state && Example2.data17043 == Example2.data && Example2.flag17043 == Example2.flag && Example2._lock17043 == Example2._lock && tmp717043 == tmp7 && tmp617043 == tmp6 && tmp117043 == tmp1 && this17043 == this && tid17043 == tid && $pc17043 == $pc;
   assume $recorded.state17043 == 1;                                                                
   if ($pc == PreCommit) {                                                                          
    assume this != Example2.null;                                                                   
   } else {                                                                                         
    assert this != Example2.null;                                                                          // (15.21): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, mover17043);                                                              
   assert $pc != PhaseError;                                                                               // (15.21): Reduction failure
   tmp7 := Example2.flag[this];                                                                     
                                                                                                    
   // 15.20: tmp6 = !tmp7;                                                                          
                                                                                                    
   tmp6 := !(tmp7);                                                                                 
   if (!(tmp6)) {                                                                                   
                                                                                                    
    // 15.13: break;                                                                                
                                                                                                    
    break;                                                                                          
   } else {                                                                                         
   }                                                                                                
                                                                                                    
   // 15.34: yield;                                                                                 
                                                                                                    
   assume Example2._state17053 == Example2._state && Example2.data17053 == Example2.data && Example2.flag17053 == Example2.flag && Example2._lock17053 == Example2._lock && tmp717053 == tmp7 && tmp617053 == tmp6 && tmp117053 == tmp1 && this17053 == this && tid17053 == tid;
   assume $recorded.state17053 == 1;                                                                
   call Yield(tid);                                                                                 
   $pc := PreCommit;                                                                                
   assume Example2._state17053_post == Example2._state && Example2.data17053_post == Example2.data && Example2.flag17053_post == Example2.flag && Example2._lock17053_post == Example2._lock && tmp717053_post == tmp7 && tmp617053_post == tmp6 && tmp117053_post == tmp1 && this17053_post == this && tid17053_post == tid;
   assume $recorded.state17053_post == 1;                                                           
   assume Example2._state17056_bottom == Example2._state && Example2.data17056_bottom == Example2.data && Example2.flag17056_bottom == Example2.flag && Example2._lock17056_bottom == Example2._lock && tmp117056_bottom == tmp1 && this17056_bottom == this && tid17056_bottom == tid;
   assume $recorded.state17056_bottom == 1;                                                         
   assert phase17056 == $pc;                                                                               // (15.13): Phase must be invariant at loop head
  }                                                                                                 
                                                                                                    
  // 16.13: int y;                                                                                  
                                                                                                    
                                                                                                    
  // 16.13: y := this.data;                                                                         
                                                                                                    
                                                                                                    
  moverPath17062 := ReadEval.Example2.data(tid: Tid,this: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
  mover17062 := m#moverPath(moverPath17062);                                                        
  path17062 := p#moverPath(moverPath17062);                                                         
  assume Example2._state17062 == Example2._state && Example2.data17062 == Example2.data && Example2.flag17062 == Example2.flag && Example2._lock17062 == Example2._lock && y17062 == y && tmp117062 == tmp1 && this17062 == this && tid17062 == tid && $pc17062 == $pc;
  assume $recorded.state17062 == 1;                                                                 
  if ($pc == PreCommit) {                                                                           
   assume this != Example2.null;                                                                    
  } else {                                                                                          
   assert this != Example2.null;                                                                           // (16.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover17062);                                                               
  assert $pc != PhaseError;                                                                                // (16.13): Reduction failure
  y := Example2.data[this];                                                                         
 }                                                                                                  
                                                                                                    
 // 8.26: // return;                                                                                
                                                                                                    
 assume Example2._state17065 == Example2._state && Example2.data17065 == Example2.data && Example2.flag17065 == Example2.flag && Example2._lock17065 == Example2._lock && tmp117065 == tmp1 && this17065 == this && tid17065 == tid;
 assume $recorded.state17065 == 1;                                                                  
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Example2._state: [Example2]State,Example2.data: [Example2]int,Example2.flag: [Example2]bool,Example2._lock: [Example2]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Example2  :: _i == Example2.null <==> isNull(Example2._state[_i])) &&                 
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Example2.data(t: Tid, u: Tid, v: int, w: int, x: Example2)   
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[x], u);                                                      
 modifies Example2.data;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example2.data[x] := v;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example2.data(u: Tid,x: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.5): Example2.data failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Example2.data(t: Tid, u: Tid, v: int, w: int, x: Example2)    
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[x], u);                                                      
 modifies Example2.data;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example2.data[x] := v;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Example2.data(u: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (2.5): Example2.data failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Example2.data(t: Tid, u: Tid, v: int, w: int, x: Example2)    
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[x], u);                                                      
 modifies Example2.data;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Example2.data[x];                                                                      
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Example2.data[x] := havocValue;                                                                    
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example2.data(u: Tid,x: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.5): Example2.data failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Example2.data(t: Tid, u: Tid, v: int, w: int, x: Example2)     
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[x], u);                                                      
 modifies Example2.data;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Example2.data[x];                                                                      
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Example2.data(u: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (2.5): Example2.data failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Example2.data(t: Tid, u: Tid, v: int, w: int, x: Example2)         
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[x], u);                                                      
 modifies Example2.data;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example2.data(t: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Example2.data(u: Tid,x: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): Example2.data failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Example2.data(t: Tid, u: Tid, v: int, w: int, x: Example2)          
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[x], u);                                                      
 modifies Example2.data;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Example2.data[x];                                                                      
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example2.data(t: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Example2.data[x] := havocValue;                                                                    
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Example2.data(u: Tid,x: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): Example2.data failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Example2.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example2) 
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[x], u);                                                      
 modifies Example2.flag;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example2.flag[x] := v;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example2.flag(u: Tid,x: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Example2.flag failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Example2.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example2)  
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[x], u);                                                      
 modifies Example2.flag;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example2.flag[x] := v;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Example2.flag(u: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): Example2.flag failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Example2.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example2)  
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[x], u);                                                      
 modifies Example2.flag;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Example2.flag[x];                                                                      
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Example2.flag[x] := havocValue;                                                                    
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example2.flag(u: Tid,x: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Example2.flag failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Example2.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example2)   
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[x], u);                                                      
 modifies Example2.flag;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : bool;                                                                             
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Example2.flag[x];                                                                      
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Example2.flag(u: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Example2.flag failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Example2.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example2)       
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[x], u);                                                      
 modifies Example2.flag;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example2.flag(t: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Example2.flag(u: Tid,x: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Example2.flag failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Example2.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example2)        
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[x], u);                                                      
 modifies Example2.flag;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Example2.flag[x];                                                                      
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example2.flag(t: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Example2.flag[x] := havocValue;                                                                    
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Example2.flag(u: Tid,x: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Example2.flag failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example2.data.Example2.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.data;                                                                            
 modifies Example2.data;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Example2;                                                                               
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example2.data(u: Tid,y: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example2.data[x] := v;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example2.data(u: Tid,y: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): Example2.data is not Write-Write Stable with respect to Example2.data (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): Example2.data is not Write-Write Stable with respect to Example2.data (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): Example2.data is not Write-Write Stable with respect to Example2.data (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example2.data.Example2.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.data;                                                                            
 modifies Example2.data;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Example2;                                                                               
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Example2.data_mid: [Example2]int;                                                              
 var u_mid: Tid;                                                                                    
 var Example2._state_mid: [Example2]State;                                                          
 var $recorded.state_mid: int;                                                                      
 var Example2.flag_mid: [Example2]bool;                                                             
 var w_mid: int;                                                                                    
 var x_mid: Example2;                                                                               
 var y_mid: Example2;                                                                               
 var v_mid: int;                                                                                    
 var Example2._lock_mid: [Example2]Tid;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example2.data[x];                                                                          
 Example2.data[x] := v;                                                                             
                                                                                                    
 assume Example2._state_mid == Example2._state && Example2.data_mid == Example2.data && Example2.flag_mid == Example2.flag && Example2._lock_mid == Example2._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example2.data(u: Tid,y: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example2.data[x] := tmpV;                                                                          
 Example2.data[y] := w;                                                                             
 _writeByTPost := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Example2.data is not Write-Write Stable with respect to Example2.data (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example2.data.Example2.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.data;                                                                            
 modifies Example2.data;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Example2;                                                                               
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Example2.data_mid: [Example2]int;                                                              
 var u_mid: Tid;                                                                                    
 var Example2._state_mid: [Example2]State;                                                          
 var $recorded.state_mid: int;                                                                      
 var Example2.flag_mid: [Example2]bool;                                                             
 var w_mid: int;                                                                                    
 var x_mid: Example2;                                                                               
 var y_mid: Example2;                                                                               
 var v_mid: int;                                                                                    
 var Example2._lock_mid: [Example2]Tid;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example2.data(u: Tid,y: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example2.data[x];                                                                          
 Example2.data[x] := v;                                                                             
 assume Example2._state_mid == Example2._state && Example2.data_mid == Example2.data && Example2.flag_mid == Example2.flag && Example2._lock_mid == Example2._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example2.data(u: Tid,y: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example2.data[x] := tmpV;                                                                          
 Example2.data[y] := w;                                                                             
 _writeByTPost := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Example2.data is not Write-Write Stable with respect to Example2.data (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Example2.data is not Write-Write Stable with respect to Example2.data (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example2.data.Example2.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.data;                                                                            
 modifies Example2.data;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Example2;                                                                               
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example2.data(t: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example2.data(u: Tid,y: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example2.data[y] := w;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example2.data(t: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Example2.data is not Read-Write Stable with respect to Example2.data (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Example2.data is not Read-Write Stable with respect to Example2.data (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Example2.data is not Read-Write Stable with respect to Example2.data (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example2.data.Example2.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.data;                                                                            
 modifies Example2.data;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Example2;                                                                               
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example2.data(u: Tid,y: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example2.data[x] := v;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example2.data(u: Tid,y: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Example2.data is not Write-Read Stable with respect to Example2.data (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Example2.data is not Write-Read Stable with respect to Example2.data (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): Example2.data is not Write-Read Stable with respect to Example2.data (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example2.data.Example2.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.data;                                                                            
 modifies Example2.flag;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Example2;                                                                               
 var Example2._state_pre: [Example2]State;                                                          
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example2.flag(u: Tid,y: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example2.data[x] := v;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example2.flag(u: Tid,y: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Example2.flag is not Write-Write Stable with respect to Example2.data (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Example2.flag is not Write-Write Stable with respect to Example2.data (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Example2.flag is not Write-Write Stable with respect to Example2.data (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example2.data.Example2.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.data;                                                                            
 modifies Example2.flag;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Example2;                                                                               
 var Example2._state_pre: [Example2]State;                                                          
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Example2.data_mid: [Example2]int;                                                              
 var u_mid: Tid;                                                                                    
 var Example2._state_mid: [Example2]State;                                                          
 var $recorded.state_mid: int;                                                                      
 var Example2.flag_mid: [Example2]bool;                                                             
 var x_mid: Example2;                                                                               
 var w0_mid: bool;                                                                                  
 var y_mid: Example2;                                                                               
 var v_mid: int;                                                                                    
 var w_mid: bool;                                                                                   
 var Example2._lock_mid: [Example2]Tid;                                                             
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example2.data[x];                                                                          
 Example2.data[x] := v;                                                                             
                                                                                                    
 assume Example2._state_mid == Example2._state && Example2.data_mid == Example2.data && Example2.flag_mid == Example2.flag && Example2._lock_mid == Example2._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example2.flag(u: Tid,y: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example2.data[x] := tmpV;                                                                          
 Example2.flag[y] := w;                                                                             
 _writeByTPost := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Example2.data is not Write-Write Stable with respect to Example2.flag (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example2.data.Example2.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.data;                                                                            
 modifies Example2.flag;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Example2;                                                                               
 var Example2._state_pre: [Example2]State;                                                          
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Example2.data_mid: [Example2]int;                                                              
 var u_mid: Tid;                                                                                    
 var Example2._state_mid: [Example2]State;                                                          
 var $recorded.state_mid: int;                                                                      
 var Example2.flag_mid: [Example2]bool;                                                             
 var x_mid: Example2;                                                                               
 var w0_mid: bool;                                                                                  
 var y_mid: Example2;                                                                               
 var v_mid: int;                                                                                    
 var w_mid: bool;                                                                                   
 var Example2._lock_mid: [Example2]Tid;                                                             
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example2.flag(u: Tid,y: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example2.data[x];                                                                          
 Example2.data[x] := v;                                                                             
 assume Example2._state_mid == Example2._state && Example2.data_mid == Example2.data && Example2.flag_mid == Example2.flag && Example2._lock_mid == Example2._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example2.flag(u: Tid,y: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example2.data[x] := tmpV;                                                                          
 Example2.flag[y] := w;                                                                             
 _writeByTPost := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Example2.data is not Write-Write Stable with respect to Example2.flag (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Example2.data is not Write-Write Stable with respect to Example2.flag (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example2.data.Example2.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.data;                                                                            
 modifies Example2.flag;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Example2;                                                                               
 var Example2._state_pre: [Example2]State;                                                          
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example2.data(t: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example2.flag(u: Tid,y: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example2.flag[y] := w;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example2.data(t: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Example2.data is not Read-Write Stable with respect to Example2.flag (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Example2.data is not Read-Write Stable with respect to Example2.flag (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Example2.data is not Read-Write Stable with respect to Example2.flag (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example2.data.Example2.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.data;                                                                            
 modifies Example2.flag;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var v_pre: int;                                                                                    
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Example2;                                                                               
 var Example2._state_pre: [Example2]State;                                                          
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: int;                                                                                   
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example2.flag(u: Tid,y: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example2.data(t: Tid,x: Example2,v: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example2.data[x] := v;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example2.flag(u: Tid,y: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Example2.flag is not Write-Read Stable with respect to Example2.data (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Example2.flag is not Write-Read Stable with respect to Example2.data (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Example2.flag is not Write-Read Stable with respect to Example2.data (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example2.flag.Example2.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.flag;                                                                            
 modifies Example2.data;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Example2;                                                                               
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example2.data(u: Tid,y: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example2.flag[x] := v;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example2.data(u: Tid,y: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): Example2.data is not Write-Write Stable with respect to Example2.flag (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): Example2.data is not Write-Write Stable with respect to Example2.flag (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): Example2.data is not Write-Write Stable with respect to Example2.flag (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example2.flag.Example2.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.flag;                                                                            
 modifies Example2.data;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Example2;                                                                               
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Example2.data_mid: [Example2]int;                                                              
 var u_mid: Tid;                                                                                    
 var Example2._state_mid: [Example2]State;                                                          
 var $recorded.state_mid: int;                                                                      
 var Example2.flag_mid: [Example2]bool;                                                             
 var w_mid: int;                                                                                    
 var x_mid: Example2;                                                                               
 var v_mid: bool;                                                                                   
 var y_mid: Example2;                                                                               
 var Example2._lock_mid: [Example2]Tid;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example2.flag[x];                                                                          
 Example2.flag[x] := v;                                                                             
                                                                                                    
 assume Example2._state_mid == Example2._state && Example2.data_mid == Example2.data && Example2.flag_mid == Example2.flag && Example2._lock_mid == Example2._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example2.data(u: Tid,y: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example2.flag[x] := tmpV;                                                                          
 Example2.data[y] := w;                                                                             
 _writeByTPost := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Example2.flag is not Write-Write Stable with respect to Example2.data (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example2.flag.Example2.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.flag;                                                                            
 modifies Example2.data;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Example2;                                                                               
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Example2.data_mid: [Example2]int;                                                              
 var u_mid: Tid;                                                                                    
 var Example2._state_mid: [Example2]State;                                                          
 var $recorded.state_mid: int;                                                                      
 var Example2.flag_mid: [Example2]bool;                                                             
 var w_mid: int;                                                                                    
 var x_mid: Example2;                                                                               
 var v_mid: bool;                                                                                   
 var y_mid: Example2;                                                                               
 var Example2._lock_mid: [Example2]Tid;                                                             
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example2.data(u: Tid,y: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example2.flag[x];                                                                          
 Example2.flag[x] := v;                                                                             
 assume Example2._state_mid == Example2._state && Example2.data_mid == Example2.data && Example2.flag_mid == Example2.flag && Example2._lock_mid == Example2._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example2.data(u: Tid,y: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example2.flag[x] := tmpV;                                                                          
 Example2.data[y] := w;                                                                             
 _writeByTPost := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Example2.flag is not Write-Write Stable with respect to Example2.data (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Example2.flag is not Write-Write Stable with respect to Example2.data (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example2.flag.Example2.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.flag;                                                                            
 modifies Example2.data;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Example2;                                                                               
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example2.flag(t: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example2.data(u: Tid,y: Example2,w: int,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example2.data[y] := w;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example2.flag(t: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Example2.flag is not Read-Write Stable with respect to Example2.data (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Example2.flag is not Read-Write Stable with respect to Example2.data (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Example2.flag is not Read-Write Stable with respect to Example2.data (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example2.flag.Example2.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.flag;                                                                            
 modifies Example2.data;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Example2;                                                                               
 var w_pre: int;                                                                                    
 var Example2._state_pre: [Example2]State;                                                          
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example2.data(u: Tid,y: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example2.flag[x] := v;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example2.data(u: Tid,y: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Example2.data is not Write-Read Stable with respect to Example2.flag (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Example2.data is not Write-Read Stable with respect to Example2.flag (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): Example2.data is not Write-Read Stable with respect to Example2.flag (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example2.flag.Example2.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.flag;                                                                            
 modifies Example2.flag;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Example2;                                                                               
 var Example2._state_pre: [Example2]State;                                                          
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example2.flag(u: Tid,y: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example2.flag[x] := v;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example2.flag(u: Tid,y: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Example2.flag is not Write-Write Stable with respect to Example2.flag (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Example2.flag is not Write-Write Stable with respect to Example2.flag (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Example2.flag is not Write-Write Stable with respect to Example2.flag (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example2.flag.Example2.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.flag;                                                                            
 modifies Example2.flag;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Example2;                                                                               
 var Example2._state_pre: [Example2]State;                                                          
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Example2.data_mid: [Example2]int;                                                              
 var u_mid: Tid;                                                                                    
 var Example2._state_mid: [Example2]State;                                                          
 var $recorded.state_mid: int;                                                                      
 var Example2.flag_mid: [Example2]bool;                                                             
 var x_mid: Example2;                                                                               
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var y_mid: Example2;                                                                               
 var w_mid: bool;                                                                                   
 var Example2._lock_mid: [Example2]Tid;                                                             
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example2.flag[x];                                                                          
 Example2.flag[x] := v;                                                                             
                                                                                                    
 assume Example2._state_mid == Example2._state && Example2.data_mid == Example2.data && Example2.flag_mid == Example2.flag && Example2._lock_mid == Example2._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example2.flag(u: Tid,y: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example2.flag[x] := tmpV;                                                                          
 Example2.flag[y] := w;                                                                             
 _writeByTPost := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Example2.flag is not Write-Write Stable with respect to Example2.flag (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example2.flag.Example2.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.flag;                                                                            
 modifies Example2.flag;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Example2;                                                                               
 var Example2._state_pre: [Example2]State;                                                          
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Example2.data_mid: [Example2]int;                                                              
 var u_mid: Tid;                                                                                    
 var Example2._state_mid: [Example2]State;                                                          
 var $recorded.state_mid: int;                                                                      
 var Example2.flag_mid: [Example2]bool;                                                             
 var x_mid: Example2;                                                                               
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var y_mid: Example2;                                                                               
 var w_mid: bool;                                                                                   
 var Example2._lock_mid: [Example2]Tid;                                                             
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example2.flag(u: Tid,y: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example2.flag[x];                                                                          
 Example2.flag[x] := v;                                                                             
 assume Example2._state_mid == Example2._state && Example2.data_mid == Example2.data && Example2.flag_mid == Example2.flag && Example2._lock_mid == Example2._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example2.flag(u: Tid,y: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example2.flag[x] := tmpV;                                                                          
 Example2.flag[y] := w;                                                                             
 _writeByTPost := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Example2.flag is not Write-Write Stable with respect to Example2.flag (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Example2.flag is not Write-Write Stable with respect to Example2.flag (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example2.flag.Example2.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.flag;                                                                            
 modifies Example2.flag;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Example2;                                                                               
 var Example2._state_pre: [Example2]State;                                                          
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example2.flag(t: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example2.flag(u: Tid,y: Example2,w: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example2.flag[y] := w;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example2.flag(t: Tid,x: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Example2.flag is not Read-Write Stable with respect to Example2.flag (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Example2.flag is not Read-Write Stable with respect to Example2.flag (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Example2.flag is not Read-Write Stable with respect to Example2.flag (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example2.flag.Example2.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example2, y: Example2)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example2._state[x], t);                                                      
 requires isAccessible(Example2._state[y], u);                                                      
 modifies Example2.flag;                                                                            
 modifies Example2.flag;                                                                            
                                                                                                    
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
 var Example2.data_pre: [Example2]int;                                                              
 var Example2._lock_pre: [Example2]Tid;                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Example2;                                                                               
 var Example2._state_pre: [Example2]State;                                                          
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example2.flag_pre: [Example2]bool;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: Example2;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example2._lock_post: [Example2]Tid;                                                            
 var t_post: Tid;                                                                                   
 var Example2.data_post: [Example2]int;                                                             
 var $pc_post: Phase;                                                                               
 var x_post: Example2;                                                                              
 var y_post: Example2;                                                                              
 var Example2._state_post: [Example2]State;                                                         
 var v_post: bool;                                                                                  
 var Example2.flag_post: [Example2]bool;                                                            
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example2.flag(u: Tid,y: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example2.flag(t: Tid,x: Example2,v: bool,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example2.flag[x] := v;                                                                             
 assume Example2._state_post == Example2._state && Example2.data_post == Example2.data && Example2.flag_post == Example2.flag && Example2._lock_post == Example2._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example2.flag(u: Tid,y: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Example2.flag is not Write-Read Stable with respect to Example2.flag (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Example2.flag is not Write-Read Stable with respect to Example2.flag (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Example2.flag is not Write-Read Stable with respect to Example2.flag (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);             
requires ValidTid(tid);                                                                             
modifies Example2._state;                                                                           
modifies Example2.data;                                                                             
modifies Example2.flag;                                                                             
modifies Example2._lock;                                                                            
ensures StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);              
ensures Y(tid , old(Example2._state), old(Example2.data), old(Example2.flag), old(Example2._lock) , Example2._state, Example2.data, Example2.flag, Example2._lock);
                                                                                                    
// Example2.data:                                                                                   
                                                                                                    
function {:inline} Y_Example2.data(tid : Tid, this: Example2, newValue: int , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid): bool
{                                                                                                   
 ((isAccessible(Example2._state[this], tid) && leq(m#moverPath(ReadEval.Example2.data(tid: Tid,this: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock)), _R)) ==> (Example2.data[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Example2.data(tid : Tid, this: Example2, newValue: int , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Example2.data.Subsumes.W(tid : Tid, u : Tid, this: Example2, newValue: int , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: Example2;                                                                           
var Example2.flag_yield: [Example2]bool;                                                            
var Example2._state_yield: [Example2]State;                                                         
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var Example2.data_yield: [Example2]int;                                                             
var Example2._lock_yield: [Example2]Tid;                                                            
var u_yield: Tid;                                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Example2._state[this], tid);                                                   
 assume isAccessible(Example2._state[this], u);                                                     
 assume !isError(m#moverPath(WriteEval.Example2.data(u: Tid,this: Example2,newValue: int,Example2._state,Example2.data,Example2.flag,Example2._lock)));
                                                                                                    
assume Example2._state_yield == Example2._state && Example2.data_yield == Example2.data && Example2.flag_yield == Example2.flag && Example2._lock_yield == Example2._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example2.data(tid, this, newValue , Example2._state, Example2.data, Example2.flag, Example2._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example2.data.Reflexive(tid : Tid, this: Example2 , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: Example2;                                                                           
var Example2.flag_yield: [Example2]bool;                                                            
var Example2._state_yield: [Example2]State;                                                         
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example2.data_yield: [Example2]int;                                                             
var Example2._lock_yield: [Example2]Tid;                                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Example2._state[this], tid);                                                   
assume Example2._state_yield == Example2._state && Example2.data_yield == Example2.data && Example2.flag_yield == Example2.flag && Example2._lock_yield == Example2._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example2.data(tid, this, Example2.data[this] , Example2._state, Example2.data, Example2.flag, Example2._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example2.data.Transitive(tid : Tid, this: Example2, newValue : int , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid , Example2._state_p: [Example2]State, Example2.data_p: [Example2]int, Example2.flag_p: [Example2]bool, Example2._lock_p: [Example2]Tid)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires StateInvariant(Example2._state_p, Example2.data_p, Example2.flag_p, Example2._lock_p);    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example2.data_pre: [Example2]int;                                                               
var Example2._lock_pre: [Example2]Tid;                                                              
var this_pre: Example2;                                                                             
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Example2._state_pre: [Example2]State;                                                           
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Example2.flag_pre: [Example2]bool;                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Example2._lock_post: [Example2]Tid;                                                             
var Example2.data_post: [Example2]int;                                                              
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Example2._state_post: [Example2]State;                                                          
var tid_post: Tid;                                                                                  
var this_post: Example2;                                                                            
var Example2.flag_post: [Example2]bool;                                                             
                                                                                                    
assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Example2._state[this], tid);                                                   
 assume Y(tid , Example2._state, Example2.data, Example2.flag, Example2._lock , Example2._state_p, Example2.data_p, Example2.flag_p, Example2._lock_p);
 assume Y_Example2.data(tid, this, newValue , Example2._state_p, Example2.data_p, Example2.flag_p, Example2._lock_p);
assume Example2._state_post == Example2._state_p && Example2.data_post == Example2.data_p && Example2.flag_post == Example2.flag_p && Example2._lock_post == Example2._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Example2.data(tid, this, newValue , Example2._state, Example2.data, Example2.flag, Example2._lock);
}                                                                                                   
// Example2.flag:                                                                                   
                                                                                                    
function {:inline} Y_Example2.flag(tid : Tid, this: Example2, newValue: bool , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid): bool
{                                                                                                   
 ((isAccessible(Example2._state[this], tid) && leq(m#moverPath(ReadEval.Example2.flag(tid: Tid,this: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock)), _R)) ==> (Example2.flag[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Example2.flag(tid : Tid, this: Example2, newValue: bool , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Example2.flag.Subsumes.W(tid : Tid, u : Tid, this: Example2, newValue: bool , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: bool;                                                                           
var this_yield: Example2;                                                                           
var Example2.flag_yield: [Example2]bool;                                                            
var Example2._state_yield: [Example2]State;                                                         
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example2.data_yield: [Example2]int;                                                             
var Example2._lock_yield: [Example2]Tid;                                                            
var u_yield: Tid;                                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Example2._state[this], tid);                                                   
 assume isAccessible(Example2._state[this], u);                                                     
 assume !isError(m#moverPath(WriteEval.Example2.flag(u: Tid,this: Example2,newValue: bool,Example2._state,Example2.data,Example2.flag,Example2._lock)));
                                                                                                    
assume Example2._state_yield == Example2._state && Example2.data_yield == Example2.data && Example2.flag_yield == Example2.flag && Example2._lock_yield == Example2._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example2.flag(tid, this, newValue , Example2._state, Example2.data, Example2.flag, Example2._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example2.flag.Reflexive(tid : Tid, this: Example2 , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: Example2;                                                                           
var Example2.flag_yield: [Example2]bool;                                                            
var Example2._state_yield: [Example2]State;                                                         
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example2.data_yield: [Example2]int;                                                             
var Example2._lock_yield: [Example2]Tid;                                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Example2._state[this], tid);                                                   
assume Example2._state_yield == Example2._state && Example2.data_yield == Example2.data && Example2.flag_yield == Example2.flag && Example2._lock_yield == Example2._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example2.flag(tid, this, Example2.flag[this] , Example2._state, Example2.data, Example2.flag, Example2._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example2.flag.Transitive(tid : Tid, this: Example2, newValue : bool , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid , Example2._state_p: [Example2]State, Example2.data_p: [Example2]int, Example2.flag_p: [Example2]bool, Example2._lock_p: [Example2]Tid)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires StateInvariant(Example2._state_p, Example2.data_p, Example2.flag_p, Example2._lock_p);    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example2.data_pre: [Example2]int;                                                               
var Example2._lock_pre: [Example2]Tid;                                                              
var this_pre: Example2;                                                                             
var newValue_pre: bool;                                                                             
var $recorded.state_pre: int;                                                                       
var Example2._state_pre: [Example2]State;                                                           
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Example2.flag_pre: [Example2]bool;                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Example2._lock_post: [Example2]Tid;                                                             
var Example2.data_post: [Example2]int;                                                              
var $pc_post: Phase;                                                                                
var Example2._state_post: [Example2]State;                                                          
var tid_post: Tid;                                                                                  
var this_post: Example2;                                                                            
var newValue_post: bool;                                                                            
var Example2.flag_post: [Example2]bool;                                                             
                                                                                                    
assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Example2._state[this], tid);                                                   
 assume Y(tid , Example2._state, Example2.data, Example2.flag, Example2._lock , Example2._state_p, Example2.data_p, Example2.flag_p, Example2._lock_p);
 assume Y_Example2.flag(tid, this, newValue , Example2._state_p, Example2.data_p, Example2.flag_p, Example2._lock_p);
assume Example2._state_post == Example2._state_p && Example2.data_post == Example2.data_p && Example2.flag_post == Example2.flag_p && Example2._lock_post == Example2._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Example2.flag(tid, this, newValue , Example2._state, Example2.data, Example2.flag, Example2._lock);
}                                                                                                   
// Example2._lock:                                                                                  
                                                                                                    
function {:inline} Y_Example2._lock(tid : Tid, this: Example2, newValue: Tid , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid): bool
{                                                                                                   
 ((isAccessible(Example2._state[this], tid) && leq(m#moverPath(ReadEval.Example2._lock(tid: Tid,this: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock)), _R)) ==> (Example2._lock[this] == newValue))
 &&(((Example2._lock[this]==tid)==(newValue==tid)))                                                 
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Example2._lock(tid : Tid, this: Example2, newValue: Tid , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Example2._lock.Subsumes.W(tid : Tid, u : Tid, this: Example2, newValue: Tid , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: Example2;                                                                           
var newValue_yield: Tid;                                                                            
var Example2.flag_yield: [Example2]bool;                                                            
var Example2._state_yield: [Example2]State;                                                         
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example2.data_yield: [Example2]int;                                                             
var Example2._lock_yield: [Example2]Tid;                                                            
var u_yield: Tid;                                                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Example2._state[this], tid);                                                   
 assume isAccessible(Example2._state[this], u);                                                     
 assume !isError(m#moverPath(WriteEval.Example2._lock(u: Tid,this: Example2,newValue: Tid,Example2._state,Example2.data,Example2.flag,Example2._lock)));
 assume leq(m#moverPath(ReadEval.Example2._lock(tid: Tid,this: Example2,Example2._state,Example2.data,Example2.flag,Example2._lock)), _N);
assume Example2._state_yield == Example2._state && Example2.data_yield == Example2.data && Example2.flag_yield == Example2.flag && Example2._lock_yield == Example2._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example2._lock(tid, this, newValue , Example2._state, Example2.data, Example2.flag, Example2._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example2._lock.Reflexive(tid : Tid, this: Example2 , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: Example2;                                                                           
var Example2.flag_yield: [Example2]bool;                                                            
var Example2._state_yield: [Example2]State;                                                         
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Example2.data_yield: [Example2]int;                                                             
var Example2._lock_yield: [Example2]Tid;                                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Example2._state[this], tid);                                                   
assume Example2._state_yield == Example2._state && Example2.data_yield == Example2.data && Example2.flag_yield == Example2.flag && Example2._lock_yield == Example2._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example2._lock(tid, this, Example2._lock[this] , Example2._state, Example2.data, Example2.flag, Example2._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example2._lock.Transitive(tid : Tid, this: Example2, newValue : Tid , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid , Example2._state_p: [Example2]State, Example2.data_p: [Example2]int, Example2.flag_p: [Example2]bool, Example2._lock_p: [Example2]Tid)
 requires StateInvariant(Example2._state, Example2.data, Example2.flag, Example2._lock);            
 requires StateInvariant(Example2._state_p, Example2.data_p, Example2.flag_p, Example2._lock_p);    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example2.data_pre: [Example2]int;                                                               
var Example2._lock_pre: [Example2]Tid;                                                              
var this_pre: Example2;                                                                             
var $recorded.state_pre: int;                                                                       
var Example2._state_pre: [Example2]State;                                                           
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Example2.flag_pre: [Example2]bool;                                                              
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Example2._lock_post: [Example2]Tid;                                                             
var Example2.data_post: [Example2]int;                                                              
var $pc_post: Phase;                                                                                
var Example2._state_post: [Example2]State;                                                          
var tid_post: Tid;                                                                                  
var this_post: Example2;                                                                            
var newValue_post: Tid;                                                                             
var Example2.flag_post: [Example2]bool;                                                             
                                                                                                    
assume Example2._state_pre == Example2._state && Example2.data_pre == Example2.data && Example2.flag_pre == Example2.flag && Example2._lock_pre == Example2._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Example2._state[this], tid);                                                   
 assume Y(tid , Example2._state, Example2.data, Example2.flag, Example2._lock , Example2._state_p, Example2.data_p, Example2.flag_p, Example2._lock_p);
 assume Y_Example2._lock(tid, this, newValue , Example2._state_p, Example2.data_p, Example2.flag_p, Example2._lock_p);
assume Example2._state_post == Example2._state_p && Example2.data_post == Example2.data_p && Example2.flag_post == Example2.flag_p && Example2._lock_post == Example2._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Example2._lock(tid, this, newValue , Example2._state, Example2.data, Example2.flag, Example2._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Example2._state: [Example2]State, Example2.data: [Example2]int, Example2.flag: [Example2]bool, Example2._lock: [Example2]Tid , Example2._state_p: [Example2]State, Example2.data_p: [Example2]int, Example2.flag_p: [Example2]bool, Example2._lock_p: [Example2]Tid): bool
{                                                                                                   
 (forall this: Example2 :: Y_Example2.data(tid : Tid, this, Example2.data_p[this] , Example2._state, Example2.data, Example2.flag, Example2._lock))
 && (forall this: Example2 :: Y_Example2.flag(tid : Tid, this, Example2.flag_p[this] , Example2._state, Example2.data, Example2.flag, Example2._lock))
 && (forall this: Example2 :: Y_Example2._lock(tid : Tid, this, Example2._lock_p[this] , Example2._state, Example2.data, Example2.flag, Example2._lock))
 && (forall _i : Example2 :: isShared(Example2._state[_i]) ==> isShared(Example2._state_p[_i]))     
 && (forall _i : Example2 :: isLocal(Example2._state[_i], tid) <==> isLocal(Example2._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 622.1-955.2: (Method:8.5)
// 630.1-630.24: (8.5): Bad tid
// 631.1-631.42: (8.5): this is not global
// 772.2-774.2: (class anchor.sink.VarDeclStmt:9.9)
// 775.2-778.19: (class anchor.sink.Assign:9.9)
// 780.3-782.3: (class anchor.sink.VarDeclStmt:10.13)
// 783.3-785.3: (class anchor.sink.VarDeclStmt:10.13)
// 786.3-803.31: (class anchor.sink.Read:10.13)
// 798.1-798.33: (10.13): Cannot have potential null deference in left-mover part.
// 802.1-802.28: (10.13): Reduction failure
// 804.3-807.19: (class anchor.sink.Assign:10.13)
// 809.4-811.4: (class anchor.sink.VarDeclStmt:11.17)
// 812.4-815.14: (class anchor.sink.Assign:11.17)
// 817.4-833.32: (class anchor.sink.Write:11.17)
// 829.1-829.34: (11.17): Cannot have potential null deference in left-mover part.
// 832.1-832.29: (11.17): Reduction failure
// 834.4-836.4: (class anchor.sink.VarDeclStmt:12.17)
// 837.4-840.17: (class anchor.sink.Assign:12.17)
// 842.4-858.32: (class anchor.sink.Write:12.17)
// 854.1-854.34: (12.17): Cannot have potential null deference in left-mover part.
// 857.1-857.29: (12.17): Reduction failure
// 864.3-868.15: (class anchor.sink.While:15.13)
// 870.1-870.28: (8.5): Bad tid
// 871.1-871.46: (8.5): this is not global
// 874.1-874.189: (15.13): Loop does not preserve yields_as annotation for field data
// 875.1-875.189: (15.13): Loop does not preserve yields_as annotation for field flag
// 876.1-876.32: (15.13): Phase must be invariant at loop head
// 877.1-877.31: (15.13): Potentially infinite loop cannot be in post-commit phase.
// 879.4-881.4: (class anchor.sink.VarDeclStmt:15.20)
// 882.4-884.4: (class anchor.sink.VarDeclStmt:15.21)
// 885.4-902.32: (class anchor.sink.Read:15.21)
// 897.1-897.34: (15.21): Cannot have potential null deference in left-mover part.
// 901.1-901.29: (15.21): Reduction failure
// 903.4-906.20: (class anchor.sink.Assign:15.20)
// 908.5-911.11: (class anchor.sink.Break:15.13)
// 914.4-922.42: (class anchor.sink.Yield:15.34)
// 925.1-925.29: (15.13): Phase must be invariant at loop head
// 927.3-929.3: (class anchor.sink.VarDeclStmt:16.13)
// 930.3-947.28: (class anchor.sink.Read:16.13)
// 942.1-942.33: (16.13): Cannot have potential null deference in left-mover part.
// 946.1-946.28: (16.13): Reduction failure
// 949.2-954.9: (class anchor.sink.Return:8.26)
// 1031.1-1031.34: (2.5): Example2.data failed Write-Write Right-Mover Check
// 1090.1-1090.30: (2.5): Example2.data failed Write-Read Right-Mover Check
// 1153.1-1153.34: (2.5): Example2.data failed Write-Write Left-Mover Check
// 1213.1-1213.30: (2.5): Example2.data failed Write-Read Left-Mover Check
// 1270.1-1270.34: (2.5): Example2.data failed Read-Write Right-Mover Check
// 1330.1-1330.34: (2.5): Example2.data failed Read-Write Left-Mover Check
// 1389.1-1389.34: (4.5): Example2.flag failed Write-Write Right-Mover Check
// 1448.1-1448.30: (4.5): Example2.flag failed Write-Read Right-Mover Check
// 1511.1-1511.34: (4.5): Example2.flag failed Write-Write Left-Mover Check
// 1571.1-1571.30: (4.5): Example2.flag failed Write-Read Left-Mover Check
// 1628.1-1628.34: (4.5): Example2.flag failed Read-Write Right-Mover Check
// 1688.1-1688.34: (4.5): Example2.flag failed Read-Write Left-Mover Check
// 1759.1-1759.140: (2.5): Example2.data is not Write-Write Stable with respect to Example2.data (case A.1)
// 1760.1-1760.101: (2.5): Example2.data is not Write-Write Stable with respect to Example2.data (case A.2)
// 1761.1-1761.158: (2.5): Example2.data is not Write-Write Stable with respect to Example2.data (case A.3)
// 1857.1-1857.140: (2.5): Example2.data is not Write-Write Stable with respect to Example2.data (case C)
// 1958.1-1958.144: (2.5): Example2.data is not Write-Write Stable with respect to Example2.data (case D)
// 1959.1-1959.144: (2.5): Example2.data is not Write-Write Stable with respect to Example2.data (case R)
// 2030.1-2030.136: (2.5): Example2.data is not Read-Write Stable with respect to Example2.data (case F)
// 2031.1-2031.136: (2.5): Example2.data is not Read-Write Stable with respect to Example2.data (case H)
// 2032.1-2032.146: (2.5): Example2.data is not Read-Write Stable with respect to Example2.data (case I)
// 2102.1-2102.136: (2.5): Example2.data is not Write-Read Stable with respect to Example2.data (case J)
// 2103.1-2103.136: (2.5): Example2.data is not Write-Read Stable with respect to Example2.data (case K)
// 2104.1-2104.99: (2.5): Example2.data is not Write-Read Stable with respect to Example2.data (case L)
// 2176.1-2176.140: (4.5): Example2.flag is not Write-Write Stable with respect to Example2.data (case A.1)
// 2177.1-2177.101: (4.5): Example2.flag is not Write-Write Stable with respect to Example2.data (case A.2)
// 2178.1-2178.158: (4.5): Example2.flag is not Write-Write Stable with respect to Example2.data (case A.3)
// 2274.1-2274.140: (2.5): Example2.data is not Write-Write Stable with respect to Example2.flag (case C)
// 2375.1-2375.144: (2.5): Example2.data is not Write-Write Stable with respect to Example2.flag (case D)
// 2376.1-2376.144: (2.5): Example2.data is not Write-Write Stable with respect to Example2.flag (case R)
// 2447.1-2447.136: (2.5): Example2.data is not Read-Write Stable with respect to Example2.flag (case F)
// 2448.1-2448.136: (2.5): Example2.data is not Read-Write Stable with respect to Example2.flag (case H)
// 2449.1-2449.146: (2.5): Example2.data is not Read-Write Stable with respect to Example2.flag (case I)
// 2519.1-2519.136: (4.5): Example2.flag is not Write-Read Stable with respect to Example2.data (case J)
// 2520.1-2520.136: (4.5): Example2.flag is not Write-Read Stable with respect to Example2.data (case K)
// 2521.1-2521.99: (4.5): Example2.flag is not Write-Read Stable with respect to Example2.data (case L)
// 2593.1-2593.140: (2.5): Example2.data is not Write-Write Stable with respect to Example2.flag (case A.1)
// 2594.1-2594.101: (2.5): Example2.data is not Write-Write Stable with respect to Example2.flag (case A.2)
// 2595.1-2595.158: (2.5): Example2.data is not Write-Write Stable with respect to Example2.flag (case A.3)
// 2691.1-2691.140: (4.5): Example2.flag is not Write-Write Stable with respect to Example2.data (case C)
// 2792.1-2792.144: (4.5): Example2.flag is not Write-Write Stable with respect to Example2.data (case D)
// 2793.1-2793.144: (4.5): Example2.flag is not Write-Write Stable with respect to Example2.data (case R)
// 2864.1-2864.136: (4.5): Example2.flag is not Read-Write Stable with respect to Example2.data (case F)
// 2865.1-2865.136: (4.5): Example2.flag is not Read-Write Stable with respect to Example2.data (case H)
// 2866.1-2866.146: (4.5): Example2.flag is not Read-Write Stable with respect to Example2.data (case I)
// 2936.1-2936.136: (2.5): Example2.data is not Write-Read Stable with respect to Example2.flag (case J)
// 2937.1-2937.136: (2.5): Example2.data is not Write-Read Stable with respect to Example2.flag (case K)
// 2938.1-2938.99: (2.5): Example2.data is not Write-Read Stable with respect to Example2.flag (case L)
// 3010.1-3010.140: (4.5): Example2.flag is not Write-Write Stable with respect to Example2.flag (case A.1)
// 3011.1-3011.101: (4.5): Example2.flag is not Write-Write Stable with respect to Example2.flag (case A.2)
// 3012.1-3012.158: (4.5): Example2.flag is not Write-Write Stable with respect to Example2.flag (case A.3)
// 3108.1-3108.140: (4.5): Example2.flag is not Write-Write Stable with respect to Example2.flag (case C)
// 3209.1-3209.144: (4.5): Example2.flag is not Write-Write Stable with respect to Example2.flag (case D)
// 3210.1-3210.144: (4.5): Example2.flag is not Write-Write Stable with respect to Example2.flag (case R)
// 3281.1-3281.136: (4.5): Example2.flag is not Read-Write Stable with respect to Example2.flag (case F)
// 3282.1-3282.136: (4.5): Example2.flag is not Read-Write Stable with respect to Example2.flag (case H)
// 3283.1-3283.146: (4.5): Example2.flag is not Read-Write Stable with respect to Example2.flag (case I)
// 3353.1-3353.136: (4.5): Example2.flag is not Write-Read Stable with respect to Example2.flag (case J)
// 3354.1-3354.136: (4.5): Example2.flag is not Write-Read Stable with respect to Example2.flag (case K)
// 3355.1-3355.99: (4.5): Example2.flag is not Write-Read Stable with respect to Example2.flag (case L)
// 3387.1-3407.2: (2.5): yields_as clause for Example2.data is not valid
// 3412.1-3427.2: (2.5): yields_as clause for Example2.data is not reflexive
// 3433.1-3463.2: (2.5): yields_as clause for Example2.data is not transitive
// 3482.1-3502.2: (4.5): yields_as clause for Example2.flag is not valid
// 3507.1-3522.2: (4.5): yields_as clause for Example2.flag is not reflexive
// 3528.1-3558.2: (4.5): yields_as clause for Example2.flag is not transitive
// 3578.1-3598.2: (7.32): yields_as clause for Example2._lock is not valid
// 3603.1-3618.2: (7.32): yields_as clause for Example2._lock is not reflexive
// 3624.1-3654.2: (7.32): yields_as clause for Example2._lock is not transitive
