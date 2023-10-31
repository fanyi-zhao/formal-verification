                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/sec2-error.anchor:                      
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Example3 {                                                                                
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void work() {                                                                          
        boolean tmp1;                                                                               
        tmp1 = tid == 0;                                                                            
        if (tmp1 /* == tid == 0 */) {                                                               
          boolean tmp2;                                                                             
          boolean tmp3;                                                                             
          tmp3 := this.flag;                                                                        
          tmp2 = !tmp3;                                                                             
          if (tmp2 /* == !this.flag */) {                                                           
            boolean tmp4;                                                                           
            tmp4 = true;                                                                            
            this.flag := tmp4;                                                                      
            int tmp5;                                                                               
            tmp5 = 2;                                                                               
            this.data := tmp5;                                                                      
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        } else {                                                                                    
          while (true)   {                                                                          
            boolean tmp6;                                                                           
            tmp6 = true;                                                                            
            if (!tmp6) break; else {                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              boolean tmp7;                                                                         
              tmp7 := this.flag;                                                                    
              if (tmp7 /* == this.flag */) {                                                        
                break;                                                                              
              } else {                                                                              
                                                                                                    
              }                                                                                     
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
                                                                                                    
                                                                                                    
                                                                                                    
    class Example3 {                                                                                
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void work() {                                                                          
        boolean tmp1;                                                                               
        tmp1 = tid == 0;                                                                            
        if (tmp1 /* == tid == 0 */) {                                                               
          boolean tmp2;                                                                             
          boolean tmp3;                                                                             
          tmp3 := this.flag;                                                                        
          tmp2 = !tmp3;                                                                             
          if (tmp2 /* == !this.flag */) {                                                           
            boolean tmp4;                                                                           
            tmp4 = true;                                                                            
            this.flag := tmp4;                                                                      
            int tmp5;                                                                               
            tmp5 = 2;                                                                               
            this.data := tmp5;                                                                      
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        } else {                                                                                    
          while (true)   {                                                                          
            boolean tmp6;                                                                           
            tmp6 = true;                                                                            
            if (!tmp6) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              boolean tmp7;                                                                         
              tmp7 := this.flag;                                                                    
              if (tmp7 /* == this.flag */) {                                                        
                {                                                                                   
                  break;                                                                            
                }                                                                                   
              } else {                                                                              
                                                                                                    
              }                                                                                     
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
                                                                                                    
                                                                                                    
                                                                                                    
    class Example3 {                                                                                
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void work() {                                                                          
        boolean tmp1;                                                                               
        tmp1 = tid == 0;                                                                            
        if (tmp1 /* == tid == 0 */) {                                                               
          boolean tmp2;                                                                             
          boolean tmp3;                                                                             
          tmp3 := this.flag;                                                                        
          tmp2 = !tmp3;                                                                             
          if (tmp2 /* == !this.flag */) {                                                           
            boolean tmp4;                                                                           
            tmp4 = true;                                                                            
            this.flag := tmp4;                                                                      
            int tmp5;                                                                               
            tmp5 = 2;                                                                               
            this.data := tmp5;                                                                      
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        } else {                                                                                    
          while (true)   {                                                                          
            boolean tmp6;                                                                           
            tmp6 = true;                                                                            
            if (!tmp6) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              boolean tmp7;                                                                         
              tmp7 := this.flag;                                                                    
              if (tmp7 /* == this.flag */) {                                                        
                {                                                                                   
                  break;                                                                            
                }                                                                                   
              } else {                                                                              
                                                                                                    
              }                                                                                     
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
                                                                                                    
                                                                                                    
                                                                                                    
    class Example3 {                                                                                
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void work() {                                                                          
        boolean tmp1;                                                                               
        tmp1 = tid == 0;                                                                            
        if (tmp1 /* == tid == 0 */) {                                                               
          boolean tmp2;                                                                             
          boolean tmp3;                                                                             
          tmp3 := this.flag;                                                                        
          tmp2 = !tmp3;                                                                             
          if (tmp2 /* == !this.flag */) {                                                           
            boolean tmp4;                                                                           
            tmp4 = true;                                                                            
            this.flag := tmp4;                                                                      
            int tmp5;                                                                               
            tmp5 = 2;                                                                               
            this.data := tmp5;                                                                      
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        } else {                                                                                    
          while (true)   {                                                                          
            boolean tmp6;                                                                           
            tmp6 = true;                                                                            
            if (!tmp6) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              boolean tmp7;                                                                         
              tmp7 := this.flag;                                                                    
              if (tmp7 /* == this.flag */) {                                                        
                {                                                                                   
                  break;                                                                            
                }                                                                                   
              } else {                                                                              
                                                                                                    
              }                                                                                     
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
                                                                                                    
                                                                                                    
/*** Class Decl Example3 ***/                                                                       
                                                                                                    
type Example3;                                                                                      
const unique Example3.null: Example3;                                                               
var Example3._state: [Example3]State;                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Example3.data: [Example3]int;                                                                   
                                                                                                    
function {:inline} ReadEval.Example3.data(tid: Tid,this : Example3,Example3._state: [Example3]State,Example3.data: [Example3]int,Example3.flag: [Example3]bool,Example3._lock: [Example3]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isRead) then                                                                                   
  if (Example3.flag[this]) then                                                                     
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (((tid==0)&&!(Example3.flag[this]))) then                                                      
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Example3.data(tid: Tid,this : Example3,newValue: int,Example3._state: [Example3]State,Example3.data: [Example3]int,Example3.flag: [Example3]bool,Example3._lock: [Example3]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if (Example3.flag[this]) then                                                                     
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (((tid==0)&&!(Example3.flag[this]))) then                                                      
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Example3.flag: [Example3]bool;                                                                  
                                                                                                    
function {:inline} ReadEval.Example3.flag(tid: Tid,this : Example3,Example3._state: [Example3]State,Example3.data: [Example3]int,Example3.flag: [Example3]bool,Example3._lock: [Example3]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := false;                                                                            
 if (isRead) then                                                                                   
  if ((Example3.flag[this]||(tid==0))) then                                                         
   moverPath(_R, 3)                                                                                 
  else                                                                                              
   moverPath(_N, 1)                                                                                 
 else                                                                                               
  if (((tid==0)&&!(Example3.flag[this]))) then                                                      
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Example3.flag(tid: Tid,this : Example3,newValue: bool,Example3._state: [Example3]State,Example3.data: [Example3]int,Example3.flag: [Example3]bool,Example3._lock: [Example3]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  if ((Example3.flag[this]||(tid==0))) then                                                         
   moverPath(_R, 3)                                                                                 
  else                                                                                              
   moverPath(_N, 1)                                                                                 
 else                                                                                               
  if (((tid==0)&&!(Example3.flag[this]))) then                                                      
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Example3._lock: [Example3]Tid;                                                                  
                                                                                                    
function {:inline} ReadEval.Example3._lock(tid: Tid,this : Example3,Example3._state: [Example3]State,Example3.data: [Example3]int,Example3.flag: [Example3]bool,Example3._lock: [Example3]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Example3._state[this], tid)) then                                                      
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Example3._lock[this]==tid)) then                                                            
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Example3._lock[this]==Tid.null)&&(newValue==tid))) then                                    
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Example3._lock[this]==tid)&&(newValue==Tid.null))) then                                   
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Example3._lock(tid: Tid,this : Example3,newValue: Tid,Example3._state: [Example3]State,Example3.data: [Example3]int,Example3.flag: [Example3]bool,Example3._lock: [Example3]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Example3._state[this], tid)) then                                                      
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Example3._lock[this]==tid)) then                                                            
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Example3._lock[this]==Tid.null)&&(newValue==tid))) then                                    
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Example3._lock[this]==tid)&&(newValue==Tid.null))) then                                   
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Example3.work(tid:Tid, this : Example3)                                                  
modifies Example3._state;                                                                           
modifies Example3.data;                                                                             
modifies Example3.flag;                                                                             
modifies Example3._lock;                                                                            
                                                                                                    
requires ValidTid(tid);                                                                                    // (8.3): Bad tid
requires isShared(Example3._state[this]);                                                                  // (8.3): this is not global
                                                                                                    
requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);             
                                                                                                    
ensures StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);              
{                                                                                                   
 var moverPath3735088: MoverPath;                                                                   
 var tmp13735091: bool;                                                                             
 var tmp73735079_post: bool;                                                                        
 var this3735082: Example3;                                                                         
 var mover3735088: Mover;                                                                           
 var this3735079_post: Example3;                                                                    
 var Example3._lock3735042: [Example3]Tid;                                                          
 var tmp73735073: bool;                                                                             
 var tid3735082_bottom: Tid;                                                                        
 var Example3.flag3735073: [Example3]bool;                                                          
 var this3735073: Example3;                                                                         
 var Example3._state3735088: [Example3]State;                                                       
 var path3735027: int;                                                                              
 var Example3.flag3735091: [Example3]bool;                                                          
 var tmp5: int;                                                                                     
 var this3735052: Example3;                                                                         
 var Example3.data3735088: [Example3]int;                                                           
 var Example3._state3735082: [Example3]State;                                                       
 var Example3.flag3735079: [Example3]bool;                                                          
 var moverPath3735042: MoverPath;                                                                   
 var Example3.flag3735027: [Example3]bool;                                                          
 var Example3._state3735082_bottom: [Example3]State;                                                
 var Example3.flag3735079_post: [Example3]bool;                                                     
 var moverPath3735073: MoverPath;                                                                   
 var Example3._state3735079: [Example3]State;                                                       
 var tmp63735079_post: bool;                                                                        
 var Example3.data3735027: [Example3]int;                                                           
 var tmp1: bool;                                                                                    
 var Example3.data3735079_post: [Example3]int;                                                      
 var mover3735027: Mover;                                                                           
 var tid3735042: Tid;                                                                               
 var tmp13735027: bool;                                                                             
 var Example3._lock3735082_bottom: [Example3]Tid;                                                   
 var tmp63735073: bool;                                                                             
 var $recorded.state3735082_bottom: int;                                                            
 var $pc3735042: Phase;                                                                             
 var $pc3735073: Phase;                                                                             
 var tmp2: bool;                                                                                    
 var tmp53735052: int;                                                                              
 var tmp43735052: bool;                                                                             
 var tmp23735042: bool;                                                                             
 var $pc3735091: Phase;                                                                             
 var $pc3735088: Phase;                                                                             
 var Example3.flag3735082_bottom: [Example3]bool;                                                   
 var $pc3735082: Phase;                                                                             
 var Example3._state3735079_post: [Example3]State;                                                  
 var $pc3735052: Phase;                                                                             
 var tmp13735079_post: bool;                                                                        
 var tid3735073: Tid;                                                                               
 var $recorded.state3735042: int;                                                                   
 var Example3._state3735091: [Example3]State;                                                       
 var tid3735088: Tid;                                                                               
 var tid3735082: Tid;                                                                               
 var y3735088: int;                                                                                 
 var tid3735027: Tid;                                                                               
 var Example3._lock3735027: [Example3]Tid;                                                          
 var path3735052: int;                                                                              
 var tid3735079_post: Tid;                                                                          
 var tmp13735079: bool;                                                                             
 var Example3._lock3735079: [Example3]Tid;                                                          
 var Example3.data3735091: [Example3]int;                                                           
 var path3735042: int;                                                                              
 var tmp33735027: bool;                                                                             
 var tmp23735052: bool;                                                                             
 var $recorded.state3735052: int;                                                                   
 var this3735042: Example3;                                                                         
 var Example3.data3735079: [Example3]int;                                                           
 var Example3.data3735073: [Example3]int;                                                           
 var Example3._lock3735091: [Example3]Tid;                                                          
 var this3735079: Example3;                                                                         
 var Example3.data3735082: [Example3]int;                                                           
 var Example3._state3735052: [Example3]State;                                                       
 var $recorded.state3735073: int;                                                                   
 var $recorded.state3735079: int;                                                                   
 var Example3._lock3735052: [Example3]Tid;                                                          
 var path3735088: int;                                                                              
 var Example3._lock3735082: [Example3]Tid;                                                          
 var y: int;                                                                                        
 var Example3._state3735073: [Example3]State;                                                       
 var tid3735052: Tid;                                                                               
 var path3735073: int;                                                                              
 var Example3.data3735082_bottom: [Example3]int;                                                    
 var tmp23735027: bool;                                                                             
 var Example3.flag3735042: [Example3]bool;                                                          
 var $recorded.state3735088: int;                                                                   
 var tmp7: bool;                                                                                    
 var moverPath3735027: MoverPath;                                                                   
 var tmp13735073: bool;                                                                             
 var tid3735091: Tid;                                                                               
 var tmp13735042: bool;                                                                             
 var this3735091: Example3;                                                                         
 var this3735027: Example3;                                                                         
 var $pc3735079_post: Phase;                                                                        
 var Example3._state3735042: [Example3]State;                                                       
 var Example3.flag3735052: [Example3]bool;                                                          
 var Example3.data3735042: [Example3]int;                                                           
 var mover3735052: Mover;                                                                           
 var tmp63735079: bool;                                                                             
 var $recorded.state3735091: int;                                                                   
 var Example3._lock3735088: [Example3]Tid;                                                          
 var tmp33735042: bool;                                                                             
 var tmp13735082: bool;                                                                             
 var tmp3: bool;                                                                                    
 var tmp13735082_bottom: bool;                                                                      
 var tmp6: bool;                                                                                    
 var $recorded.state3735027: int;                                                                   
 var this3735082_bottom: Example3;                                                                  
 var tmp4: bool;                                                                                    
 var mover3735042: Mover;                                                                           
 var phase3735082: Phase;                                                                           
 var tid3735079: Tid;                                                                               
 var moverPath3735052: MoverPath;                                                                   
 var tmp13735052: bool;                                                                             
 var tmp43735042: bool;                                                                             
 var Example3._lock3735073: [Example3]Tid;                                                          
 var Example3.flag3735082: [Example3]bool;                                                          
 var this3735088: Example3;                                                                         
 var Example3._lock3735079_post: [Example3]Tid;                                                     
 var $recorded.state3735082: int;                                                                   
 var mover3735073: Mover;                                                                           
 var Example3.flag3735088: [Example3]bool;                                                          
 var tmp73735079: bool;                                                                             
 var $recorded.state3735079_post: int;                                                              
 var Example3.data3735052: [Example3]int;                                                           
 var $pc3735082_bottom: Phase;                                                                      
 var Example3._state3735027: [Example3]State;                                                       
 var tmp33735052: bool;                                                                             
 var $pc3735027: Phase;                                                                             
 var tmp13735088: bool;                                                                             
 var $pc3735079: Phase;                                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 9.5: boolean tmp1;                                                                              
                                                                                                    
                                                                                                    
 // 9.5: tmp1 = tid == 0;                                                                           
                                                                                                    
 tmp1 := (tid==0);                                                                                  
 if (tmp1 /* lowered (tid==0) */) {                                                                 
                                                                                                    
  // 10.7: boolean tmp2;                                                                            
                                                                                                    
                                                                                                    
  // 10.7: boolean tmp3;                                                                            
                                                                                                    
                                                                                                    
  // 10.7: tmp3 := this.flag;                                                                       
                                                                                                    
                                                                                                    
  moverPath3735027 := ReadEval.Example3.flag(tid: Tid,this: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
  mover3735027 := m#moverPath(moverPath3735027);                                                    
  path3735027 := p#moverPath(moverPath3735027);                                                     
  assume Example3._state3735027 == Example3._state && Example3.data3735027 == Example3.data && Example3.flag3735027 == Example3.flag && Example3._lock3735027 == Example3._lock && tmp33735027 == tmp3 && tmp23735027 == tmp2 && tmp13735027 == tmp1 && this3735027 == this && tid3735027 == tid && $pc3735027 == $pc;
  assume $recorded.state3735027 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != Example3.null;                                                                    
  } else {                                                                                          
   assert this != Example3.null;                                                                           // (10.7): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover3735027);                                                             
  assert $pc != PhaseError;                                                                                // (10.7): Reduction failure
  tmp3 := Example3.flag[this];                                                                      
                                                                                                    
  // 10.7: tmp2 = !tmp3;                                                                            
                                                                                                    
  tmp2 := !(tmp3);                                                                                  
  if (tmp2 /* lowered !(Example3.flag[this]) */) {                                                  
                                                                                                    
   // 11.11: boolean tmp4;                                                                          
                                                                                                    
                                                                                                    
   // 11.11: tmp4 = true;                                                                           
                                                                                                    
   tmp4 := true;                                                                                    
                                                                                                    
                                                                                                    
   // 11.11: this.flag := tmp4;                                                                     
                                                                                                    
                                                                                                    
   moverPath3735042 := WriteEval.Example3.flag(tid: Tid,this: Example3,tmp4: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
   mover3735042 := m#moverPath(moverPath3735042);                                                   
   path3735042 := p#moverPath(moverPath3735042);                                                    
   assume Example3._state3735042 == Example3._state && Example3.data3735042 == Example3.data && Example3.flag3735042 == Example3.flag && Example3._lock3735042 == Example3._lock && tmp43735042 == tmp4 && tmp33735042 == tmp3 && tmp23735042 == tmp2 && tmp13735042 == tmp1 && this3735042 == this && tid3735042 == tid && $pc3735042 == $pc;
   assume $recorded.state3735042 == 1;                                                              
   if ($pc == PreCommit) {                                                                          
    assume this != Example3.null;                                                                   
   } else {                                                                                         
    assert this != Example3.null;                                                                          // (11.11): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover3735042);                                                            
   assert $pc != PhaseError;                                                                               // (11.11): Reduction failure
   Example3.flag[this] := tmp4;                                                                     
                                                                                                    
   // 12.11: int tmp5;                                                                              
                                                                                                    
                                                                                                    
   // 12.11: tmp5 = 2;                                                                              
                                                                                                    
   tmp5 := 2;                                                                                       
                                                                                                    
                                                                                                    
   // 12.11: this.data := tmp5;                                                                     
                                                                                                    
                                                                                                    
   moverPath3735052 := WriteEval.Example3.data(tid: Tid,this: Example3,tmp5: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
   mover3735052 := m#moverPath(moverPath3735052);                                                   
   path3735052 := p#moverPath(moverPath3735052);                                                    
   assume Example3._state3735052 == Example3._state && Example3.data3735052 == Example3.data && Example3.flag3735052 == Example3.flag && Example3._lock3735052 == Example3._lock && tmp53735052 == tmp5 && tmp43735052 == tmp4 && tmp33735052 == tmp3 && tmp23735052 == tmp2 && tmp13735052 == tmp1 && this3735052 == this && tid3735052 == tid && $pc3735052 == $pc;
   assume $recorded.state3735052 == 1;                                                              
   if ($pc == PreCommit) {                                                                          
    assume this != Example3.null;                                                                   
   } else {                                                                                         
    assert this != Example3.null;                                                                          // (12.11): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover3735052);                                                            
   assert $pc != PhaseError;                                                                               // (12.11): Reduction failure
   Example3.data[this] := tmp5;                                                                     
  } else {                                                                                          
  }                                                                                                 
 } else {                                                                                           
  assume Example3._state3735082 == Example3._state && Example3.data3735082 == Example3.data && Example3.flag3735082 == Example3.flag && Example3._lock3735082 == Example3._lock && tmp13735082 == tmp1 && this3735082 == this && tid3735082 == tid;
  assume $recorded.state3735082 == 1;                                                               
                                                                                                    
  // 15.9: while (true)   {                                                                         
                                                                                                    
  phase3735082 := $pc;                                                                              
  while (true)                                                                                      
                                                                                                    
   invariant ValidTid(tid);                                                                                // (8.3): Bad tid
   invariant isShared(Example3._state[this]);                                                              // (8.3): this is not global
                                                                                                    
   invariant StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);         
   invariant (forall _this : Example3 :: Invariant.Y_Example3.data(tid : Tid, _this, Example3.data[_this] ,Example3._state3735082,Example3.data3735082,Example3.flag3735082,Example3._lock3735082));       // (15.9): Loop does not preserve yields_as annotation for field data
   invariant (forall _this : Example3 :: Invariant.Y_Example3.flag(tid : Tid, _this, Example3.flag[_this] ,Example3._state3735082,Example3.data3735082,Example3.flag3735082,Example3._lock3735082));       // (15.9): Loop does not preserve yields_as annotation for field flag
   invariant phase3735082 == $pc;                                                                          // (15.9): Phase must be invariant at loop head
   invariant $pc == PreCommit;                                                                             // (15.9): Potentially infinite loop cannot be in post-commit phase.
  {                                                                                                 
                                                                                                    
   // 15.16: boolean tmp6;                                                                          
                                                                                                    
                                                                                                    
   // 15.16: tmp6 = true;                                                                           
                                                                                                    
   tmp6 := true;                                                                                    
   if (!(tmp6)) {                                                                                   
                                                                                                    
    // 15.9: break;                                                                                 
                                                                                                    
    break;                                                                                          
   } else {                                                                                         
   }                                                                                                
                                                                                                    
   // 16.11: boolean tmp7;                                                                          
                                                                                                    
                                                                                                    
   // 16.11: tmp7 := this.flag;                                                                     
                                                                                                    
                                                                                                    
   moverPath3735073 := ReadEval.Example3.flag(tid: Tid,this: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
   mover3735073 := m#moverPath(moverPath3735073);                                                   
   path3735073 := p#moverPath(moverPath3735073);                                                    
   assume Example3._state3735073 == Example3._state && Example3.data3735073 == Example3.data && Example3.flag3735073 == Example3.flag && Example3._lock3735073 == Example3._lock && tmp73735073 == tmp7 && tmp63735073 == tmp6 && tmp13735073 == tmp1 && this3735073 == this && tid3735073 == tid && $pc3735073 == $pc;
   assume $recorded.state3735073 == 1;                                                              
   if ($pc == PreCommit) {                                                                          
    assume this != Example3.null;                                                                   
   } else {                                                                                         
    assert this != Example3.null;                                                                          // (16.11): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, mover3735073);                                                            
   assert $pc != PhaseError;                                                                               // (16.11): Reduction failure
   tmp7 := Example3.flag[this];                                                                     
   if (tmp7 /* lowered Example3.flag[this] */) {                                                    
                                                                                                    
    // 17.13: break;                                                                                
                                                                                                    
    break;                                                                                          
   } else {                                                                                         
   }                                                                                                
                                                                                                    
   // 19.11: yield;                                                                                 
                                                                                                    
   assume Example3._state3735079 == Example3._state && Example3.data3735079 == Example3.data && Example3.flag3735079 == Example3.flag && Example3._lock3735079 == Example3._lock && tmp73735079 == tmp7 && tmp63735079 == tmp6 && tmp13735079 == tmp1 && this3735079 == this && tid3735079 == tid;
   assume $recorded.state3735079 == 1;                                                              
   call Yield(tid);                                                                                 
   $pc := PreCommit;                                                                                
   assume Example3._state3735079_post == Example3._state && Example3.data3735079_post == Example3.data && Example3.flag3735079_post == Example3.flag && Example3._lock3735079_post == Example3._lock && tmp73735079_post == tmp7 && tmp63735079_post == tmp6 && tmp13735079_post == tmp1 && this3735079_post == this && tid3735079_post == tid;
   assume $recorded.state3735079_post == 1;                                                         
   assume Example3._state3735082_bottom == Example3._state && Example3.data3735082_bottom == Example3.data && Example3.flag3735082_bottom == Example3.flag && Example3._lock3735082_bottom == Example3._lock && tmp13735082_bottom == tmp1 && this3735082_bottom == this && tid3735082_bottom == tid;
   assume $recorded.state3735082_bottom == 1;                                                       
   assert phase3735082 == $pc;                                                                             // (15.9): Phase must be invariant at loop head
  }                                                                                                 
                                                                                                    
  // 21.9: int y;                                                                                   
                                                                                                    
                                                                                                    
  // 21.9: y := this.data;                                                                          
                                                                                                    
                                                                                                    
  moverPath3735088 := ReadEval.Example3.data(tid: Tid,this: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
  mover3735088 := m#moverPath(moverPath3735088);                                                    
  path3735088 := p#moverPath(moverPath3735088);                                                     
  assume Example3._state3735088 == Example3._state && Example3.data3735088 == Example3.data && Example3.flag3735088 == Example3.flag && Example3._lock3735088 == Example3._lock && y3735088 == y && tmp13735088 == tmp1 && this3735088 == this && tid3735088 == tid && $pc3735088 == $pc;
  assume $recorded.state3735088 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != Example3.null;                                                                    
  } else {                                                                                          
   assert this != Example3.null;                                                                           // (21.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover3735088);                                                             
  assert $pc != PhaseError;                                                                                // (21.9): Reduction failure
  y := Example3.data[this];                                                                         
 }                                                                                                  
                                                                                                    
 // 8.22: // return;                                                                                
                                                                                                    
 assume Example3._state3735091 == Example3._state && Example3.data3735091 == Example3.data && Example3.flag3735091 == Example3.flag && Example3._lock3735091 == Example3._lock && tmp13735091 == tmp1 && this3735091 == this && tid3735091 == tid;
 assume $recorded.state3735091 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Example3._state: [Example3]State,Example3.data: [Example3]int,Example3.flag: [Example3]bool,Example3._lock: [Example3]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Example3  :: _i == Example3.null <==> isNull(Example3._state[_i])) &&                 
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Example3.data(t: Tid, u: Tid, v: int, w: int, x: Example3)   
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[x], u);                                                      
 modifies Example3.data;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example3.data[x] := v;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example3.data(u: Tid,x: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.3): Example3.data failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Example3.data(t: Tid, u: Tid, v: int, w: int, x: Example3)    
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[x], u);                                                      
 modifies Example3.data;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example3.data[x] := v;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Example3.data(u: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (2.3): Example3.data failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Example3.data(t: Tid, u: Tid, v: int, w: int, x: Example3)    
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[x], u);                                                      
 modifies Example3.data;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Example3.data[x];                                                                      
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Example3.data[x] := havocValue;                                                                    
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example3.data(u: Tid,x: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.3): Example3.data failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Example3.data(t: Tid, u: Tid, v: int, w: int, x: Example3)     
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[x], u);                                                      
 modifies Example3.data;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Example3.data[x];                                                                      
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Example3.data(u: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (2.3): Example3.data failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Example3.data(t: Tid, u: Tid, v: int, w: int, x: Example3)         
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[x], u);                                                      
 modifies Example3.data;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example3.data(t: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Example3.data(u: Tid,x: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.3): Example3.data failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Example3.data(t: Tid, u: Tid, v: int, w: int, x: Example3)          
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[x], u);                                                      
 modifies Example3.data;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Example3.data[x];                                                                      
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example3.data(t: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Example3.data[x] := havocValue;                                                                    
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Example3.data(u: Tid,x: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.3): Example3.data failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Example3.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example3) 
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[x], u);                                                      
 modifies Example3.flag;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var x_pre: Example3;                                                                               
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example3.flag[x] := v;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example3.flag(u: Tid,x: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): Example3.flag failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Example3.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example3)  
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[x], u);                                                      
 modifies Example3.flag;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var x_pre: Example3;                                                                               
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Example3.flag[x] := v;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Example3.flag(u: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.3): Example3.flag failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Example3.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example3)  
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[x], u);                                                      
 modifies Example3.flag;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var x_pre: Example3;                                                                               
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Example3.flag[x];                                                                      
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Example3.flag[x] := havocValue;                                                                    
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Example3.flag(u: Tid,x: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): Example3.flag failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Example3.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example3)   
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[x], u);                                                      
 modifies Example3.flag;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : bool;                                                                             
 var x_pre: Example3;                                                                               
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Example3.flag[x];                                                                      
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Example3.flag(u: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.3): Example3.flag failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Example3.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example3)       
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[x], u);                                                      
 modifies Example3.flag;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var x_pre: Example3;                                                                               
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example3.flag(t: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Example3.flag(u: Tid,x: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): Example3.flag failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Example3.flag(t: Tid, u: Tid, v: bool, w: bool, x: Example3)        
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[x], u);                                                      
 modifies Example3.flag;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var x_pre: Example3;                                                                               
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Example3.flag[x];                                                                      
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Example3.flag(t: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Example3.flag[x] := havocValue;                                                                    
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Example3.flag(u: Tid,x: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): Example3.flag failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example3.data.Example3.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.data;                                                                            
 modifies Example3.data;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example3.data(u: Tid,y: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example3.data[x] := v;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example3.data(u: Tid,y: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.3): Example3.data is not Write-Write Stable with respect to Example3.data (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.3): Example3.data is not Write-Write Stable with respect to Example3.data (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.3): Example3.data is not Write-Write Stable with respect to Example3.data (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example3.data.Example3.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.data;                                                                            
 modifies Example3.data;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var Example3._lock_mid: [Example3]Tid;                                                             
 var t_mid: Tid;                                                                                    
 var x_mid: Example3;                                                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Example3.flag_mid: [Example3]bool;                                                             
 var v_mid: int;                                                                                    
 var y_mid: Example3;                                                                               
 var Example3._state_mid: [Example3]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Example3.data_mid: [Example3]int;                                                              
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example3.data[x];                                                                          
 Example3.data[x] := v;                                                                             
                                                                                                    
 assume Example3._state_mid == Example3._state && Example3.data_mid == Example3.data && Example3.flag_mid == Example3.flag && Example3._lock_mid == Example3._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example3.data(u: Tid,y: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example3.data[x] := tmpV;                                                                          
 Example3.data[y] := w;                                                                             
 _writeByTPost := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.3): Example3.data is not Write-Write Stable with respect to Example3.data (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example3.data.Example3.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.data;                                                                            
 modifies Example3.data;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var Example3._lock_mid: [Example3]Tid;                                                             
 var t_mid: Tid;                                                                                    
 var x_mid: Example3;                                                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Example3.flag_mid: [Example3]bool;                                                             
 var v_mid: int;                                                                                    
 var y_mid: Example3;                                                                               
 var Example3._state_mid: [Example3]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Example3.data_mid: [Example3]int;                                                              
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example3.data(u: Tid,y: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example3.data[x];                                                                          
 Example3.data[x] := v;                                                                             
 assume Example3._state_mid == Example3._state && Example3.data_mid == Example3.data && Example3.flag_mid == Example3.flag && Example3._lock_mid == Example3._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example3.data(u: Tid,y: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example3.data[x] := tmpV;                                                                          
 Example3.data[y] := w;                                                                             
 _writeByTPost := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.3): Example3.data is not Write-Write Stable with respect to Example3.data (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.3): Example3.data is not Write-Write Stable with respect to Example3.data (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example3.data.Example3.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.data;                                                                            
 modifies Example3.data;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example3.data(t: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example3.data(u: Tid,y: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example3.data[y] := w;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example3.data(t: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.3): Example3.data is not Read-Write Stable with respect to Example3.data (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.3): Example3.data is not Read-Write Stable with respect to Example3.data (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.3): Example3.data is not Read-Write Stable with respect to Example3.data (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example3.data.Example3.data(t: Tid, u: Tid, v: int, w: int, w0: int, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.data;                                                                            
 modifies Example3.data;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example3.data(u: Tid,y: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example3.data[x] := v;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example3.data(u: Tid,y: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.3): Example3.data is not Write-Read Stable with respect to Example3.data (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.3): Example3.data is not Write-Read Stable with respect to Example3.data (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.3): Example3.data is not Write-Read Stable with respect to Example3.data (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example3.data.Example3.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.data;                                                                            
 modifies Example3.flag;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w0_pre: bool;                                                                                  
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example3.flag(u: Tid,y: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example3.data[x] := v;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example3.flag(u: Tid,y: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): Example3.flag is not Write-Write Stable with respect to Example3.data (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): Example3.flag is not Write-Write Stable with respect to Example3.data (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): Example3.flag is not Write-Write Stable with respect to Example3.data (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example3.data.Example3.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.data;                                                                            
 modifies Example3.flag;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w0_pre: bool;                                                                                  
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var Example3._lock_mid: [Example3]Tid;                                                             
 var t_mid: Tid;                                                                                    
 var x_mid: Example3;                                                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Example3.flag_mid: [Example3]bool;                                                             
 var w0_mid: bool;                                                                                  
 var v_mid: int;                                                                                    
 var w_mid: bool;                                                                                   
 var y_mid: Example3;                                                                               
 var Example3._state_mid: [Example3]State;                                                          
 var $pc_mid: Phase;                                                                                
 var Example3.data_mid: [Example3]int;                                                              
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example3.data[x];                                                                          
 Example3.data[x] := v;                                                                             
                                                                                                    
 assume Example3._state_mid == Example3._state && Example3.data_mid == Example3.data && Example3.flag_mid == Example3.flag && Example3._lock_mid == Example3._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example3.flag(u: Tid,y: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example3.data[x] := tmpV;                                                                          
 Example3.flag[y] := w;                                                                             
 _writeByTPost := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.3): Example3.data is not Write-Write Stable with respect to Example3.flag (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example3.data.Example3.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.data;                                                                            
 modifies Example3.flag;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w0_pre: bool;                                                                                  
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var Example3._lock_mid: [Example3]Tid;                                                             
 var t_mid: Tid;                                                                                    
 var x_mid: Example3;                                                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Example3.flag_mid: [Example3]bool;                                                             
 var w0_mid: bool;                                                                                  
 var v_mid: int;                                                                                    
 var w_mid: bool;                                                                                   
 var y_mid: Example3;                                                                               
 var Example3._state_mid: [Example3]State;                                                          
 var $pc_mid: Phase;                                                                                
 var Example3.data_mid: [Example3]int;                                                              
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example3.flag(u: Tid,y: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example3.data[x];                                                                          
 Example3.data[x] := v;                                                                             
 assume Example3._state_mid == Example3._state && Example3.data_mid == Example3.data && Example3.flag_mid == Example3.flag && Example3._lock_mid == Example3._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example3.flag(u: Tid,y: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example3.data[x] := tmpV;                                                                          
 Example3.flag[y] := w;                                                                             
 _writeByTPost := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.3): Example3.data is not Write-Write Stable with respect to Example3.flag (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.3): Example3.data is not Write-Write Stable with respect to Example3.flag (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example3.data.Example3.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.data;                                                                            
 modifies Example3.flag;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w0_pre: bool;                                                                                  
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example3.data(t: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example3.flag(u: Tid,y: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example3.flag[y] := w;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example3.data(t: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.3): Example3.data is not Read-Write Stable with respect to Example3.flag (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.3): Example3.data is not Read-Write Stable with respect to Example3.flag (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.3): Example3.data is not Read-Write Stable with respect to Example3.flag (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example3.data.Example3.flag(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.data;                                                                            
 modifies Example3.flag;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w0_pre: bool;                                                                                  
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var Example3.flag_post: [Example3]bool;                                                            
 var v_post: int;                                                                                   
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example3.flag(u: Tid,y: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example3.data(t: Tid,x: Example3,v: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example3.data[x] := v;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example3.flag(u: Tid,y: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Example3.flag is not Write-Read Stable with respect to Example3.data (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Example3.flag is not Write-Read Stable with respect to Example3.data (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): Example3.flag is not Write-Read Stable with respect to Example3.data (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example3.flag.Example3.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.flag;                                                                            
 modifies Example3.data;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example3.data(u: Tid,y: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example3.flag[x] := v;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example3.data(u: Tid,y: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.3): Example3.data is not Write-Write Stable with respect to Example3.flag (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.3): Example3.data is not Write-Write Stable with respect to Example3.flag (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.3): Example3.data is not Write-Write Stable with respect to Example3.flag (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example3.flag.Example3.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.flag;                                                                            
 modifies Example3.data;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var Example3._lock_mid: [Example3]Tid;                                                             
 var t_mid: Tid;                                                                                    
 var x_mid: Example3;                                                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Example3.flag_mid: [Example3]bool;                                                             
 var v_mid: bool;                                                                                   
 var y_mid: Example3;                                                                               
 var Example3._state_mid: [Example3]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Example3.data_mid: [Example3]int;                                                              
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example3.flag[x];                                                                          
 Example3.flag[x] := v;                                                                             
                                                                                                    
 assume Example3._state_mid == Example3._state && Example3.data_mid == Example3.data && Example3.flag_mid == Example3.flag && Example3._lock_mid == Example3._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example3.data(u: Tid,y: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example3.flag[x] := tmpV;                                                                          
 Example3.data[y] := w;                                                                             
 _writeByTPost := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Example3.flag is not Write-Write Stable with respect to Example3.data (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example3.flag.Example3.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.flag;                                                                            
 modifies Example3.data;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var Example3._lock_mid: [Example3]Tid;                                                             
 var t_mid: Tid;                                                                                    
 var x_mid: Example3;                                                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Example3.flag_mid: [Example3]bool;                                                             
 var v_mid: bool;                                                                                   
 var y_mid: Example3;                                                                               
 var Example3._state_mid: [Example3]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Example3.data_mid: [Example3]int;                                                              
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example3.data(u: Tid,y: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example3.flag[x];                                                                          
 Example3.flag[x] := v;                                                                             
 assume Example3._state_mid == Example3._state && Example3.data_mid == Example3.data && Example3.flag_mid == Example3.flag && Example3._lock_mid == Example3._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example3.data(u: Tid,y: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example3.flag[x] := tmpV;                                                                          
 Example3.data[y] := w;                                                                             
 _writeByTPost := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Example3.flag is not Write-Write Stable with respect to Example3.data (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Example3.flag is not Write-Write Stable with respect to Example3.data (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example3.flag.Example3.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.flag;                                                                            
 modifies Example3.data;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example3.flag(t: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example3.data(u: Tid,y: Example3,w: int,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example3.data[y] := w;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example3.flag(t: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Example3.flag is not Read-Write Stable with respect to Example3.data (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Example3.flag is not Read-Write Stable with respect to Example3.data (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Example3.flag is not Read-Write Stable with respect to Example3.data (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example3.flag.Example3.data(t: Tid, u: Tid, v: bool, w: int, w0: int, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.flag;                                                                            
 modifies Example3.data;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Example3._state_pre: [Example3]State;                                                          
 var w_pre: int;                                                                                    
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example3.data(u: Tid,y: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example3.flag[x] := v;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example3.data(u: Tid,y: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.3): Example3.data is not Write-Read Stable with respect to Example3.flag (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.3): Example3.data is not Write-Read Stable with respect to Example3.flag (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.3): Example3.data is not Write-Read Stable with respect to Example3.flag (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Example3.flag.Example3.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.flag;                                                                            
 modifies Example3.flag;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w0_pre: bool;                                                                                  
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example3.flag(u: Tid,y: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example3.flag[x] := v;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Example3.flag(u: Tid,y: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): Example3.flag is not Write-Write Stable with respect to Example3.flag (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): Example3.flag is not Write-Write Stable with respect to Example3.flag (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): Example3.flag is not Write-Write Stable with respect to Example3.flag (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Example3.flag.Example3.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.flag;                                                                            
 modifies Example3.flag;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w0_pre: bool;                                                                                  
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var Example3._lock_mid: [Example3]Tid;                                                             
 var t_mid: Tid;                                                                                    
 var x_mid: Example3;                                                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Example3.flag_mid: [Example3]bool;                                                             
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var w_mid: bool;                                                                                   
 var y_mid: Example3;                                                                               
 var Example3._state_mid: [Example3]State;                                                          
 var $pc_mid: Phase;                                                                                
 var Example3.data_mid: [Example3]int;                                                              
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Example3.flag[x];                                                                          
 Example3.flag[x] := v;                                                                             
                                                                                                    
 assume Example3._state_mid == Example3._state && Example3.data_mid == Example3.data && Example3.flag_mid == Example3.flag && Example3._lock_mid == Example3._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Example3.flag(u: Tid,y: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Example3.flag[x] := tmpV;                                                                          
 Example3.flag[y] := w;                                                                             
 _writeByTPost := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Example3.flag is not Write-Write Stable with respect to Example3.flag (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Example3.flag.Example3.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.flag;                                                                            
 modifies Example3.flag;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w0_pre: bool;                                                                                  
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var Example3._lock_mid: [Example3]Tid;                                                             
 var t_mid: Tid;                                                                                    
 var x_mid: Example3;                                                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Example3.flag_mid: [Example3]bool;                                                             
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var w_mid: bool;                                                                                   
 var y_mid: Example3;                                                                               
 var Example3._state_mid: [Example3]State;                                                          
 var $pc_mid: Phase;                                                                                
 var Example3.data_mid: [Example3]int;                                                              
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Example3.flag(u: Tid,y: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Example3.flag[x];                                                                          
 Example3.flag[x] := v;                                                                             
 assume Example3._state_mid == Example3._state && Example3.data_mid == Example3.data && Example3.flag_mid == Example3.flag && Example3._lock_mid == Example3._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Example3.flag(u: Tid,y: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Example3.flag[x] := tmpV;                                                                          
 Example3.flag[y] := w;                                                                             
 _writeByTPost := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Example3.flag is not Write-Write Stable with respect to Example3.flag (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Example3.flag is not Write-Write Stable with respect to Example3.flag (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Example3.flag.Example3.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.flag;                                                                            
 modifies Example3.flag;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w0_pre: bool;                                                                                  
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Example3.flag(t: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Example3.flag(u: Tid,y: Example3,w: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example3.flag[y] := w;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Example3.flag(t: Tid,x: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Example3.flag is not Read-Write Stable with respect to Example3.flag (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Example3.flag is not Read-Write Stable with respect to Example3.flag (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Example3.flag is not Read-Write Stable with respect to Example3.flag (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Example3.flag.Example3.flag(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: Example3, y: Example3)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Example3._state[x], t);                                                      
 requires isAccessible(Example3._state[y], u);                                                      
 modifies Example3.flag;                                                                            
 modifies Example3.flag;                                                                            
                                                                                                    
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
 var x_pre: Example3;                                                                               
 var w_pre: bool;                                                                                   
 var Example3.flag_pre: [Example3]bool;                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Example3._state_pre: [Example3]State;                                                          
 var w0_pre: bool;                                                                                  
 var Example3._lock_pre: [Example3]Tid;                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Example3.data_pre: [Example3]int;                                                              
 var t_pre: Tid;                                                                                    
 var y_pre: Example3;                                                                               
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Example3._lock_post: [Example3]Tid;                                                            
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Example3.data_post: [Example3]int;                                                             
 var Example3._state_post: [Example3]State;                                                         
 var v_post: bool;                                                                                  
 var Example3.flag_post: [Example3]bool;                                                            
 var y_post: Example3;                                                                              
 var x_post: Example3;                                                                              
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Example3.flag(u: Tid,y: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Example3.flag(t: Tid,x: Example3,v: bool,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Example3.flag[x] := v;                                                                             
 assume Example3._state_post == Example3._state && Example3.data_post == Example3.data && Example3.flag_post == Example3.flag && Example3._lock_post == Example3._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Example3.flag(u: Tid,y: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Example3.flag is not Write-Read Stable with respect to Example3.flag (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Example3.flag is not Write-Read Stable with respect to Example3.flag (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): Example3.flag is not Write-Read Stable with respect to Example3.flag (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);             
requires ValidTid(tid);                                                                             
modifies Example3._state;                                                                           
modifies Example3.data;                                                                             
modifies Example3.flag;                                                                             
modifies Example3._lock;                                                                            
ensures StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);              
ensures Y(tid , old(Example3._state), old(Example3.data), old(Example3.flag), old(Example3._lock) , Example3._state, Example3.data, Example3.flag, Example3._lock);
                                                                                                    
// Example3.data:                                                                                   
                                                                                                    
function {:inline} Y_Example3.data(tid : Tid, this: Example3, newValue: int , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid): bool
{                                                                                                   
 ((isAccessible(Example3._state[this], tid) && leq(m#moverPath(ReadEval.Example3.data(tid: Tid,this: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock)), _R)) ==> (Example3.data[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Example3.data(tid : Tid, this: Example3, newValue: int , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Example3.data.Subsumes.W(tid : Tid, u : Tid, this: Example3, newValue: int , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Example3.data_yield: [Example3]int;                                                             
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var this_yield: Example3;                                                                           
var Example3._lock_yield: [Example3]Tid;                                                            
var Example3._state_yield: [Example3]State;                                                         
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Example3.flag_yield: [Example3]bool;                                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Example3._state[this], tid);                                                   
 assume isAccessible(Example3._state[this], u);                                                     
 assume !isError(m#moverPath(WriteEval.Example3.data(u: Tid,this: Example3,newValue: int,Example3._state,Example3.data,Example3.flag,Example3._lock)));
                                                                                                    
assume Example3._state_yield == Example3._state && Example3.data_yield == Example3.data && Example3.flag_yield == Example3.flag && Example3._lock_yield == Example3._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example3.data(tid, this, newValue , Example3._state, Example3.data, Example3.flag, Example3._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example3.data.Reflexive(tid : Tid, this: Example3 , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example3.data_yield: [Example3]int;                                                             
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var this_yield: Example3;                                                                           
var Example3._lock_yield: [Example3]Tid;                                                            
var Example3._state_yield: [Example3]State;                                                         
var Example3.flag_yield: [Example3]bool;                                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Example3._state[this], tid);                                                   
assume Example3._state_yield == Example3._state && Example3.data_yield == Example3.data && Example3.flag_yield == Example3.flag && Example3._lock_yield == Example3._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example3.data(tid, this, Example3.data[this] , Example3._state, Example3.data, Example3.flag, Example3._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example3.data.Transitive(tid : Tid, this: Example3, newValue : int , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid , Example3._state_p: [Example3]State, Example3.data_p: [Example3]int, Example3.flag_p: [Example3]bool, Example3._lock_p: [Example3]Tid)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires StateInvariant(Example3._state_p, Example3.data_p, Example3.flag_p, Example3._lock_p);    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example3.flag_pre: [Example3]bool;                                                              
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Example3._state_pre: [Example3]State;                                                           
var this_pre: Example3;                                                                             
var tid_pre: Tid;                                                                                   
var Example3._lock_pre: [Example3]Tid;                                                              
var $pc_pre: Phase;                                                                                 
var Example3.data_pre: [Example3]int;                                                               
                                                                                                    
var $recorded.state_post: int;                                                                      
var Example3._lock_post: [Example3]Tid;                                                             
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Example3.data_post: [Example3]int;                                                              
var Example3._state_post: [Example3]State;                                                          
var tid_post: Tid;                                                                                  
var Example3.flag_post: [Example3]bool;                                                             
var this_post: Example3;                                                                            
                                                                                                    
assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Example3._state[this], tid);                                                   
 assume Y(tid , Example3._state, Example3.data, Example3.flag, Example3._lock , Example3._state_p, Example3.data_p, Example3.flag_p, Example3._lock_p);
 assume Y_Example3.data(tid, this, newValue , Example3._state_p, Example3.data_p, Example3.flag_p, Example3._lock_p);
assume Example3._state_post == Example3._state_p && Example3.data_post == Example3.data_p && Example3.flag_post == Example3.flag_p && Example3._lock_post == Example3._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Example3.data(tid, this, newValue , Example3._state, Example3.data, Example3.flag, Example3._lock);
}                                                                                                   
// Example3.flag:                                                                                   
                                                                                                    
function {:inline} Y_Example3.flag(tid : Tid, this: Example3, newValue: bool , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid): bool
{                                                                                                   
 ((isAccessible(Example3._state[this], tid) && leq(m#moverPath(ReadEval.Example3.flag(tid: Tid,this: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock)), _R)) ==> (Example3.flag[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Example3.flag(tid : Tid, this: Example3, newValue: bool , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Example3.flag.Subsumes.W(tid : Tid, u : Tid, this: Example3, newValue: bool , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: bool;                                                                           
var Example3.data_yield: [Example3]int;                                                             
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var this_yield: Example3;                                                                           
var Example3._lock_yield: [Example3]Tid;                                                            
var Example3._state_yield: [Example3]State;                                                         
var u_yield: Tid;                                                                                   
var Example3.flag_yield: [Example3]bool;                                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Example3._state[this], tid);                                                   
 assume isAccessible(Example3._state[this], u);                                                     
 assume !isError(m#moverPath(WriteEval.Example3.flag(u: Tid,this: Example3,newValue: bool,Example3._state,Example3.data,Example3.flag,Example3._lock)));
                                                                                                    
assume Example3._state_yield == Example3._state && Example3.data_yield == Example3.data && Example3.flag_yield == Example3.flag && Example3._lock_yield == Example3._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example3.flag(tid, this, newValue , Example3._state, Example3.data, Example3.flag, Example3._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example3.flag.Reflexive(tid : Tid, this: Example3 , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example3.data_yield: [Example3]int;                                                             
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var this_yield: Example3;                                                                           
var Example3._lock_yield: [Example3]Tid;                                                            
var Example3._state_yield: [Example3]State;                                                         
var Example3.flag_yield: [Example3]bool;                                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Example3._state[this], tid);                                                   
assume Example3._state_yield == Example3._state && Example3.data_yield == Example3.data && Example3.flag_yield == Example3.flag && Example3._lock_yield == Example3._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example3.flag(tid, this, Example3.flag[this] , Example3._state, Example3.data, Example3.flag, Example3._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example3.flag.Transitive(tid : Tid, this: Example3, newValue : bool , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid , Example3._state_p: [Example3]State, Example3.data_p: [Example3]int, Example3.flag_p: [Example3]bool, Example3._lock_p: [Example3]Tid)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires StateInvariant(Example3._state_p, Example3.data_p, Example3.flag_p, Example3._lock_p);    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var newValue_pre: bool;                                                                             
var Example3.flag_pre: [Example3]bool;                                                              
var $recorded.state_pre: int;                                                                       
var Example3._state_pre: [Example3]State;                                                           
var this_pre: Example3;                                                                             
var tid_pre: Tid;                                                                                   
var Example3._lock_pre: [Example3]Tid;                                                              
var $pc_pre: Phase;                                                                                 
var Example3.data_pre: [Example3]int;                                                               
                                                                                                    
var $recorded.state_post: int;                                                                      
var Example3._lock_post: [Example3]Tid;                                                             
var $pc_post: Phase;                                                                                
var Example3.data_post: [Example3]int;                                                              
var Example3._state_post: [Example3]State;                                                          
var tid_post: Tid;                                                                                  
var Example3.flag_post: [Example3]bool;                                                             
var newValue_post: bool;                                                                            
var this_post: Example3;                                                                            
                                                                                                    
assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Example3._state[this], tid);                                                   
 assume Y(tid , Example3._state, Example3.data, Example3.flag, Example3._lock , Example3._state_p, Example3.data_p, Example3.flag_p, Example3._lock_p);
 assume Y_Example3.flag(tid, this, newValue , Example3._state_p, Example3.data_p, Example3.flag_p, Example3._lock_p);
assume Example3._state_post == Example3._state_p && Example3.data_post == Example3.data_p && Example3.flag_post == Example3.flag_p && Example3._lock_post == Example3._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Example3.flag(tid, this, newValue , Example3._state, Example3.data, Example3.flag, Example3._lock);
}                                                                                                   
// Example3._lock:                                                                                  
                                                                                                    
function {:inline} Y_Example3._lock(tid : Tid, this: Example3, newValue: Tid , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid): bool
{                                                                                                   
 ((isAccessible(Example3._state[this], tid) && leq(m#moverPath(ReadEval.Example3._lock(tid: Tid,this: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock)), _R)) ==> (Example3._lock[this] == newValue))
 &&(((Example3._lock[this]==tid)==(newValue==tid)))                                                 
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Example3._lock(tid : Tid, this: Example3, newValue: Tid , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Example3._lock.Subsumes.W(tid : Tid, u : Tid, this: Example3, newValue: Tid , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Example3.data_yield: [Example3]int;                                                             
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var this_yield: Example3;                                                                           
var Example3._lock_yield: [Example3]Tid;                                                            
var Example3._state_yield: [Example3]State;                                                         
var u_yield: Tid;                                                                                   
var Example3.flag_yield: [Example3]bool;                                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Example3._state[this], tid);                                                   
 assume isAccessible(Example3._state[this], u);                                                     
 assume !isError(m#moverPath(WriteEval.Example3._lock(u: Tid,this: Example3,newValue: Tid,Example3._state,Example3.data,Example3.flag,Example3._lock)));
 assume leq(m#moverPath(ReadEval.Example3._lock(tid: Tid,this: Example3,Example3._state,Example3.data,Example3.flag,Example3._lock)), _N);
assume Example3._state_yield == Example3._state && Example3.data_yield == Example3.data && Example3.flag_yield == Example3.flag && Example3._lock_yield == Example3._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example3._lock(tid, this, newValue , Example3._state, Example3.data, Example3.flag, Example3._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example3._lock.Reflexive(tid : Tid, this: Example3 , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example3.data_yield: [Example3]int;                                                             
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var this_yield: Example3;                                                                           
var Example3._lock_yield: [Example3]Tid;                                                            
var Example3._state_yield: [Example3]State;                                                         
var Example3.flag_yield: [Example3]bool;                                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Example3._state[this], tid);                                                   
assume Example3._state_yield == Example3._state && Example3.data_yield == Example3.data && Example3.flag_yield == Example3.flag && Example3._lock_yield == Example3._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Example3._lock(tid, this, Example3._lock[this] , Example3._state, Example3.data, Example3.flag, Example3._lock);
}                                                                                                   
                                                                                                    
procedure Y_Example3._lock.Transitive(tid : Tid, this: Example3, newValue : Tid , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid , Example3._state_p: [Example3]State, Example3.data_p: [Example3]int, Example3.flag_p: [Example3]bool, Example3._lock_p: [Example3]Tid)
 requires StateInvariant(Example3._state, Example3.data, Example3.flag, Example3._lock);            
 requires StateInvariant(Example3._state_p, Example3.data_p, Example3.flag_p, Example3._lock_p);    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Example3.flag_pre: [Example3]bool;                                                              
var $recorded.state_pre: int;                                                                       
var Example3._state_pre: [Example3]State;                                                           
var this_pre: Example3;                                                                             
var tid_pre: Tid;                                                                                   
var Example3._lock_pre: [Example3]Tid;                                                              
var $pc_pre: Phase;                                                                                 
var Example3.data_pre: [Example3]int;                                                               
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Example3._lock_post: [Example3]Tid;                                                             
var $pc_post: Phase;                                                                                
var Example3.data_post: [Example3]int;                                                              
var Example3._state_post: [Example3]State;                                                          
var tid_post: Tid;                                                                                  
var Example3.flag_post: [Example3]bool;                                                             
var newValue_post: Tid;                                                                             
var this_post: Example3;                                                                            
                                                                                                    
assume Example3._state_pre == Example3._state && Example3.data_pre == Example3.data && Example3.flag_pre == Example3.flag && Example3._lock_pre == Example3._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Example3._state[this], tid);                                                   
 assume Y(tid , Example3._state, Example3.data, Example3.flag, Example3._lock , Example3._state_p, Example3.data_p, Example3.flag_p, Example3._lock_p);
 assume Y_Example3._lock(tid, this, newValue , Example3._state_p, Example3.data_p, Example3.flag_p, Example3._lock_p);
assume Example3._state_post == Example3._state_p && Example3.data_post == Example3.data_p && Example3.flag_post == Example3.flag_p && Example3._lock_post == Example3._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Example3._lock(tid, this, newValue , Example3._state, Example3.data, Example3.flag, Example3._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Example3._state: [Example3]State, Example3.data: [Example3]int, Example3.flag: [Example3]bool, Example3._lock: [Example3]Tid , Example3._state_p: [Example3]State, Example3.data_p: [Example3]int, Example3.flag_p: [Example3]bool, Example3._lock_p: [Example3]Tid): bool
{                                                                                                   
 (forall this: Example3 :: Y_Example3.data(tid : Tid, this, Example3.data_p[this] , Example3._state, Example3.data, Example3.flag, Example3._lock))
 && (forall this: Example3 :: Y_Example3.flag(tid : Tid, this, Example3.flag_p[this] , Example3._state, Example3.data, Example3.flag, Example3._lock))
 && (forall this: Example3 :: Y_Example3._lock(tid : Tid, this, Example3._lock_p[this] , Example3._state, Example3.data, Example3.flag, Example3._lock))
 && (forall _i : Example3 :: isShared(Example3._state[_i]) ==> isShared(Example3._state_p[_i]))     
 && (forall _i : Example3 :: isLocal(Example3._state[_i], tid) <==> isLocal(Example3._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 648.1-988.2: (Method:8.3)
// 656.1-656.24: (8.3): Bad tid
// 657.1-657.42: (8.3): this is not global
// 798.2-800.2: (class anchor.sink.VarDeclStmt:9.5)
// 801.2-804.19: (class anchor.sink.Assign:9.5)
// 806.3-808.3: (class anchor.sink.VarDeclStmt:10.7)
// 809.3-811.3: (class anchor.sink.VarDeclStmt:10.7)
// 812.3-829.31: (class anchor.sink.Read:10.7)
// 824.1-824.33: (10.7): Cannot have potential null deference in left-mover part.
// 828.1-828.28: (10.7): Reduction failure
// 830.3-833.19: (class anchor.sink.Assign:10.7)
// 835.4-837.4: (class anchor.sink.VarDeclStmt:11.11)
// 838.4-841.17: (class anchor.sink.Assign:11.11)
// 843.4-859.32: (class anchor.sink.Write:11.11)
// 855.1-855.34: (11.11): Cannot have potential null deference in left-mover part.
// 858.1-858.29: (11.11): Reduction failure
// 860.4-862.4: (class anchor.sink.VarDeclStmt:12.11)
// 863.4-866.14: (class anchor.sink.Assign:12.11)
// 868.4-884.32: (class anchor.sink.Write:12.11)
// 880.1-880.34: (12.11): Cannot have potential null deference in left-mover part.
// 883.1-883.29: (12.11): Reduction failure
// 890.3-894.15: (class anchor.sink.While:15.9)
// 896.1-896.28: (8.3): Bad tid
// 897.1-897.46: (8.3): this is not global
// 900.1-900.197: (15.9): Loop does not preserve yields_as annotation for field data
// 901.1-901.197: (15.9): Loop does not preserve yields_as annotation for field flag
// 902.1-902.34: (15.9): Phase must be invariant at loop head
// 903.1-903.31: (15.9): Potentially infinite loop cannot be in post-commit phase.
// 905.4-907.4: (class anchor.sink.VarDeclStmt:15.16)
// 908.4-911.17: (class anchor.sink.Assign:15.16)
// 913.5-916.11: (class anchor.sink.Break:15.9)
// 919.4-921.4: (class anchor.sink.VarDeclStmt:16.11)
// 922.4-939.32: (class anchor.sink.Read:16.11)
// 934.1-934.34: (16.11): Cannot have potential null deference in left-mover part.
// 938.1-938.29: (16.11): Reduction failure
// 941.5-944.11: (class anchor.sink.Break:17.13)
// 947.4-955.44: (class anchor.sink.Yield:19.11)
// 958.1-958.31: (15.9): Phase must be invariant at loop head
// 960.3-962.3: (class anchor.sink.VarDeclStmt:21.9)
// 963.3-980.28: (class anchor.sink.Read:21.9)
// 975.1-975.33: (21.9): Cannot have potential null deference in left-mover part.
// 979.1-979.28: (21.9): Reduction failure
// 982.2-987.9: (class anchor.sink.Return:8.22)
// 1064.1-1064.34: (2.3): Example3.data failed Write-Write Right-Mover Check
// 1123.1-1123.30: (2.3): Example3.data failed Write-Read Right-Mover Check
// 1186.1-1186.34: (2.3): Example3.data failed Write-Write Left-Mover Check
// 1246.1-1246.30: (2.3): Example3.data failed Write-Read Left-Mover Check
// 1303.1-1303.34: (2.3): Example3.data failed Read-Write Right-Mover Check
// 1363.1-1363.34: (2.3): Example3.data failed Read-Write Left-Mover Check
// 1422.1-1422.34: (4.3): Example3.flag failed Write-Write Right-Mover Check
// 1481.1-1481.30: (4.3): Example3.flag failed Write-Read Right-Mover Check
// 1544.1-1544.34: (4.3): Example3.flag failed Write-Write Left-Mover Check
// 1604.1-1604.30: (4.3): Example3.flag failed Write-Read Left-Mover Check
// 1661.1-1661.34: (4.3): Example3.flag failed Read-Write Right-Mover Check
// 1721.1-1721.34: (4.3): Example3.flag failed Read-Write Left-Mover Check
// 1792.1-1792.140: (2.3): Example3.data is not Write-Write Stable with respect to Example3.data (case A.1)
// 1793.1-1793.101: (2.3): Example3.data is not Write-Write Stable with respect to Example3.data (case A.2)
// 1794.1-1794.158: (2.3): Example3.data is not Write-Write Stable with respect to Example3.data (case A.3)
// 1890.1-1890.140: (2.3): Example3.data is not Write-Write Stable with respect to Example3.data (case C)
// 1991.1-1991.144: (2.3): Example3.data is not Write-Write Stable with respect to Example3.data (case D)
// 1992.1-1992.144: (2.3): Example3.data is not Write-Write Stable with respect to Example3.data (case R)
// 2063.1-2063.136: (2.3): Example3.data is not Read-Write Stable with respect to Example3.data (case F)
// 2064.1-2064.136: (2.3): Example3.data is not Read-Write Stable with respect to Example3.data (case H)
// 2065.1-2065.146: (2.3): Example3.data is not Read-Write Stable with respect to Example3.data (case I)
// 2135.1-2135.136: (2.3): Example3.data is not Write-Read Stable with respect to Example3.data (case J)
// 2136.1-2136.136: (2.3): Example3.data is not Write-Read Stable with respect to Example3.data (case K)
// 2137.1-2137.99: (2.3): Example3.data is not Write-Read Stable with respect to Example3.data (case L)
// 2209.1-2209.140: (4.3): Example3.flag is not Write-Write Stable with respect to Example3.data (case A.1)
// 2210.1-2210.101: (4.3): Example3.flag is not Write-Write Stable with respect to Example3.data (case A.2)
// 2211.1-2211.158: (4.3): Example3.flag is not Write-Write Stable with respect to Example3.data (case A.3)
// 2307.1-2307.140: (2.3): Example3.data is not Write-Write Stable with respect to Example3.flag (case C)
// 2408.1-2408.144: (2.3): Example3.data is not Write-Write Stable with respect to Example3.flag (case D)
// 2409.1-2409.144: (2.3): Example3.data is not Write-Write Stable with respect to Example3.flag (case R)
// 2480.1-2480.136: (2.3): Example3.data is not Read-Write Stable with respect to Example3.flag (case F)
// 2481.1-2481.136: (2.3): Example3.data is not Read-Write Stable with respect to Example3.flag (case H)
// 2482.1-2482.146: (2.3): Example3.data is not Read-Write Stable with respect to Example3.flag (case I)
// 2552.1-2552.136: (4.3): Example3.flag is not Write-Read Stable with respect to Example3.data (case J)
// 2553.1-2553.136: (4.3): Example3.flag is not Write-Read Stable with respect to Example3.data (case K)
// 2554.1-2554.99: (4.3): Example3.flag is not Write-Read Stable with respect to Example3.data (case L)
// 2626.1-2626.140: (2.3): Example3.data is not Write-Write Stable with respect to Example3.flag (case A.1)
// 2627.1-2627.101: (2.3): Example3.data is not Write-Write Stable with respect to Example3.flag (case A.2)
// 2628.1-2628.158: (2.3): Example3.data is not Write-Write Stable with respect to Example3.flag (case A.3)
// 2724.1-2724.140: (4.3): Example3.flag is not Write-Write Stable with respect to Example3.data (case C)
// 2825.1-2825.144: (4.3): Example3.flag is not Write-Write Stable with respect to Example3.data (case D)
// 2826.1-2826.144: (4.3): Example3.flag is not Write-Write Stable with respect to Example3.data (case R)
// 2897.1-2897.136: (4.3): Example3.flag is not Read-Write Stable with respect to Example3.data (case F)
// 2898.1-2898.136: (4.3): Example3.flag is not Read-Write Stable with respect to Example3.data (case H)
// 2899.1-2899.146: (4.3): Example3.flag is not Read-Write Stable with respect to Example3.data (case I)
// 2969.1-2969.136: (2.3): Example3.data is not Write-Read Stable with respect to Example3.flag (case J)
// 2970.1-2970.136: (2.3): Example3.data is not Write-Read Stable with respect to Example3.flag (case K)
// 2971.1-2971.99: (2.3): Example3.data is not Write-Read Stable with respect to Example3.flag (case L)
// 3043.1-3043.140: (4.3): Example3.flag is not Write-Write Stable with respect to Example3.flag (case A.1)
// 3044.1-3044.101: (4.3): Example3.flag is not Write-Write Stable with respect to Example3.flag (case A.2)
// 3045.1-3045.158: (4.3): Example3.flag is not Write-Write Stable with respect to Example3.flag (case A.3)
// 3141.1-3141.140: (4.3): Example3.flag is not Write-Write Stable with respect to Example3.flag (case C)
// 3242.1-3242.144: (4.3): Example3.flag is not Write-Write Stable with respect to Example3.flag (case D)
// 3243.1-3243.144: (4.3): Example3.flag is not Write-Write Stable with respect to Example3.flag (case R)
// 3314.1-3314.136: (4.3): Example3.flag is not Read-Write Stable with respect to Example3.flag (case F)
// 3315.1-3315.136: (4.3): Example3.flag is not Read-Write Stable with respect to Example3.flag (case H)
// 3316.1-3316.146: (4.3): Example3.flag is not Read-Write Stable with respect to Example3.flag (case I)
// 3386.1-3386.136: (4.3): Example3.flag is not Write-Read Stable with respect to Example3.flag (case J)
// 3387.1-3387.136: (4.3): Example3.flag is not Write-Read Stable with respect to Example3.flag (case K)
// 3388.1-3388.99: (4.3): Example3.flag is not Write-Read Stable with respect to Example3.flag (case L)
// 3420.1-3440.2: (2.3): yields_as clause for Example3.data is not valid
// 3445.1-3460.2: (2.3): yields_as clause for Example3.data is not reflexive
// 3466.1-3496.2: (2.3): yields_as clause for Example3.data is not transitive
// 3515.1-3535.2: (4.3): yields_as clause for Example3.flag is not valid
// 3540.1-3555.2: (4.3): yields_as clause for Example3.flag is not reflexive
// 3561.1-3591.2: (4.3): yields_as clause for Example3.flag is not transitive
// 3611.1-3631.2: (7.32): yields_as clause for Example3._lock is not valid
// 3636.1-3651.2: (7.32): yields_as clause for Example3._lock is not reflexive
// 3657.1-3687.2: (7.32): yields_as clause for Example3._lock is not transitive
