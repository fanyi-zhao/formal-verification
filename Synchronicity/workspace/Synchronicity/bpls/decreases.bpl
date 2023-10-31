                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/decreases.anchor:                       
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        int i;                                                                                      
        i = 0;                                                                                      
        while (true)                                                                                
          decreases 10 - i;                                                                         
         {                                                                                          
          boolean tmp1;                                                                             
          tmp1 = i < 10;                                                                            
          if (!tmp1) break; else {                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            i = i + 1;                                                                              
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f2() {                                                                            
        int i;                                                                                      
        i = 0;                                                                                      
        while (true)                                                                                
          decreases i;                                                                              
         {                                                                                          
          boolean tmp2;                                                                             
          tmp2 = i < 10;                                                                            
          if (!tmp2) break; else {                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            i = i + 1;                                                                              
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f3() {                                                                            
        int i;                                                                                      
        i = 0;                                                                                      
        while (true)                                                                                
          decreases i;                                                                              
         {                                                                                          
          boolean tmp3;                                                                             
          tmp3 = i < 10;                                                                            
          if (!tmp3) break; else {                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            i = i - 1;                                                                              
          }                                                                                         
        }                                                                                           
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        int i;                                                                                      
        i = 0;                                                                                      
        while (true)                                                                                
          decreases 10 - i;                                                                         
         {                                                                                          
          boolean tmp1;                                                                             
          tmp1 = i < 10;                                                                            
          if (!tmp1) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            i = i + 1;                                                                              
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f2() {                                                                            
        int i;                                                                                      
        i = 0;                                                                                      
        while (true)                                                                                
          decreases i;                                                                              
         {                                                                                          
          boolean tmp2;                                                                             
          tmp2 = i < 10;                                                                            
          if (!tmp2) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            i = i + 1;                                                                              
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f3() {                                                                            
        int i;                                                                                      
        i = 0;                                                                                      
        while (true)                                                                                
          decreases i;                                                                              
         {                                                                                          
          boolean tmp3;                                                                             
          tmp3 = i < 10;                                                                            
          if (!tmp3) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            i = i - 1;                                                                              
          }                                                                                         
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        int i;                                                                                      
        i = 0;                                                                                      
        while (true)                                                                                
          decreases 10 - i;                                                                         
         {                                                                                          
          boolean tmp1;                                                                             
          tmp1 = i < 10;                                                                            
          if (!tmp1) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            i = i + 1;                                                                              
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f2() {                                                                            
        int i;                                                                                      
        i = 0;                                                                                      
        while (true)                                                                                
          decreases i;                                                                              
         {                                                                                          
          boolean tmp2;                                                                             
          tmp2 = i < 10;                                                                            
          if (!tmp2) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            i = i + 1;                                                                              
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f3() {                                                                            
        int i;                                                                                      
        i = 0;                                                                                      
        while (true)                                                                                
          decreases i;                                                                              
         {                                                                                          
          boolean tmp3;                                                                             
          tmp3 = i < 10;                                                                            
          if (!tmp3) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            i = i - 1;                                                                              
          }                                                                                         
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        int i;                                                                                      
        i = 0;                                                                                      
        while (true)                                                                                
          decreases 10 - i;                                                                         
         {                                                                                          
          boolean tmp1;                                                                             
          tmp1 = i < 10;                                                                            
          if (!tmp1) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            i = i + 1;                                                                              
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f2() {                                                                            
        int i;                                                                                      
        i = 0;                                                                                      
        while (true)                                                                                
          decreases i;                                                                              
         {                                                                                          
          boolean tmp2;                                                                             
          tmp2 = i < 10;                                                                            
          if (!tmp2) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            i = i + 1;                                                                              
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f3() {                                                                            
        int i;                                                                                      
        i = 0;                                                                                      
        while (true)                                                                                
          decreases i;                                                                              
         {                                                                                          
          boolean tmp3;                                                                             
          tmp3 = i < 10;                                                                            
          if (!tmp3) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            i = i - 1;                                                                              
          }                                                                                         
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
                                                                                                    
requires ValidTid(tid);                                                                                    // (3.3): Bad tid
requires isShared(Cow._state[this]);                                                                       // (3.3): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock);                                                     
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock);                                                      
{                                                                                                   
 var $pc1171632: Phase;                                                                             
 var $pc1171631: Phase;                                                                             
 var Cow._state1171631: [Cow]State;                                                                 
 var this1171631: Cow;                                                                              
 var $pc1171631_bottom: Phase;                                                                      
 var $decr$init$1171631$0: int;                                                                     
 var tid1171631_bottom: Tid;                                                                        
 var this1171631_bottom: Cow;                                                                       
 var tmp1: bool;                                                                                    
 var i: int;                                                                                        
 var i1171631_bottom: int;                                                                          
 var i1171631: int;                                                                                 
 var phase1171631: Phase;                                                                           
 var $recorded.state1171631_bottom: int;                                                            
 var Cow._lock1171631_bottom: [Cow]Tid;                                                             
 var tid1171631: Tid;                                                                               
 var $recorded.state1171631: int;                                                                   
 var Cow._state1171632: [Cow]State;                                                                 
 var $recorded.state1171632: int;                                                                   
 var i1171632: int;                                                                                 
 var Cow._lock1171631: [Cow]Tid;                                                                    
 var Cow._state1171631_bottom: [Cow]State;                                                          
 var $decr$loop$1171631$0: int;                                                                     
 var Cow._lock1171632: [Cow]Tid;                                                                    
 var tid1171632: Tid;                                                                               
 var this1171632: Cow;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 4.7: int i;                                                                                     
                                                                                                    
                                                                                                    
 // 4.7: i = 0;                                                                                     
                                                                                                    
 i := 0;                                                                                            
 assume Cow._state1171631 == Cow._state && Cow._lock1171631 == Cow._lock && i1171631 == i && this1171631 == this && tid1171631 == tid;
 assume $recorded.state1171631 == 1;                                                                
                                                                                                    
 // 5.7: while (true)                                                                               
                                                                                                    
 phase1171631 := $pc;                                                                               
 $decr$init$1171631$0 := (10-i);                                                                    
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (3.3): Bad tid
  invariant isShared(Cow._state[this]);                                                                    // (3.3): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow._lock);                                                  
  invariant ((10-i) <= $decr$init$1171631$0 && ((10-i) == $decr$init$1171631$0 ==> true));          
  invariant phase1171631 == $pc;                                                                           // (5.7): Phase must be invariant at loop head
 {                                                                                                  
  $decr$loop$1171631$0 := (10-i);                                                                   
                                                                                                    
  // 5.16: boolean tmp1;                                                                            
                                                                                                    
                                                                                                    
  // 5.16: tmp1 = i < 10;                                                                           
                                                                                                    
  tmp1 := (i<10);                                                                                   
  if (!(tmp1)) {                                                                                    
                                                                                                    
   // 5.7: break;                                                                                   
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 6.9: i = i + 1;                                                                                
                                                                                                    
  i := (i+1);                                                                                       
  assert ((10-i) <= $decr$loop$1171631$0 && ((10-i) == $decr$loop$1171631$0 ==> false));                   // (5.7): loop may not terminate
  assert 0 <= $decr$loop$1171631$0  || (10-i) == $decr$loop$1171631$0;                                     // (5.7): decreasing expression not properly bounded by 0
  assume Cow._state1171631_bottom == Cow._state && Cow._lock1171631_bottom == Cow._lock && i1171631_bottom == i && this1171631_bottom == this && tid1171631_bottom == tid;
  assume $recorded.state1171631_bottom == 1;                                                        
  assert phase1171631 == $pc;                                                                              // (5.7): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 3.19: // return;                                                                                
                                                                                                    
 assume Cow._state1171632 == Cow._state && Cow._lock1171632 == Cow._lock && i1171632 == i && this1171632 == this && tid1171632 == tid;
 assume $recorded.state1171632 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f2(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (10.3): Bad tid
requires isShared(Cow._state[this]);                                                                       // (10.3): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock);                                                     
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock);                                                      
{                                                                                                   
 var phase1171666: Phase;                                                                           
 var this1171666_bottom: Cow;                                                                       
 var $pc1171666: Phase;                                                                             
 var Cow._lock1171666: [Cow]Tid;                                                                    
 var $pc1171667: Phase;                                                                             
 var tid1171666_bottom: Tid;                                                                        
 var Cow._state1171666_bottom: [Cow]State;                                                          
 var i1171667: int;                                                                                 
 var tmp2: bool;                                                                                    
 var $decr$init$1171666$0: int;                                                                     
 var $pc1171666_bottom: Phase;                                                                      
 var i: int;                                                                                        
 var i1171666: int;                                                                                 
 var Cow._lock1171666_bottom: [Cow]Tid;                                                             
 var this1171666: Cow;                                                                              
 var Cow._lock1171667: [Cow]Tid;                                                                    
 var $recorded.state1171666: int;                                                                   
 var Cow._state1171666: [Cow]State;                                                                 
 var tid1171666: Tid;                                                                               
 var $decr$loop$1171666$0: int;                                                                     
 var $recorded.state1171667: int;                                                                   
 var tid1171667: Tid;                                                                               
 var $recorded.state1171666_bottom: int;                                                            
 var i1171666_bottom: int;                                                                          
 var Cow._state1171667: [Cow]State;                                                                 
 var this1171667: Cow;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 11.7: int i;                                                                                    
                                                                                                    
                                                                                                    
 // 11.7: i = 0;                                                                                    
                                                                                                    
 i := 0;                                                                                            
 assume Cow._state1171666 == Cow._state && Cow._lock1171666 == Cow._lock && i1171666 == i && this1171666 == this && tid1171666 == tid;
 assume $recorded.state1171666 == 1;                                                                
                                                                                                    
 // 12.7: while (true)                                                                              
                                                                                                    
 phase1171666 := $pc;                                                                               
 $decr$init$1171666$0 := i;                                                                         
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (10.3): Bad tid
  invariant isShared(Cow._state[this]);                                                                    // (10.3): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow._lock);                                                  
  invariant (i <= $decr$init$1171666$0 && (i == $decr$init$1171666$0 ==> true));                    
  invariant phase1171666 == $pc;                                                                           // (12.7): Phase must be invariant at loop head
 {                                                                                                  
  $decr$loop$1171666$0 := i;                                                                        
                                                                                                    
  // 12.16: boolean tmp2;                                                                           
                                                                                                    
                                                                                                    
  // 12.16: tmp2 = i < 10;                                                                          
                                                                                                    
  tmp2 := (i<10);                                                                                   
  if (!(tmp2)) {                                                                                    
                                                                                                    
   // 12.7: break;                                                                                  
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 13.9: i = i + 1;                                                                               
                                                                                                    
  i := (i+1);                                                                                       
  assert (i <= $decr$loop$1171666$0 && (i == $decr$loop$1171666$0 ==> false));                             // (12.7): loop may not terminate
  assert 0 <= $decr$loop$1171666$0  || i == $decr$loop$1171666$0;                                          // (12.7): decreasing expression not properly bounded by 0
  assume Cow._state1171666_bottom == Cow._state && Cow._lock1171666_bottom == Cow._lock && i1171666_bottom == i && this1171666_bottom == this && tid1171666_bottom == tid;
  assume $recorded.state1171666_bottom == 1;                                                        
  assert phase1171666 == $pc;                                                                              // (12.7): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 10.20: // return;                                                                               
                                                                                                    
 assume Cow._state1171667 == Cow._state && Cow._lock1171667 == Cow._lock && i1171667 == i && this1171667 == this && tid1171667 == tid;
 assume $recorded.state1171667 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f3(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (17.3): Bad tid
requires isShared(Cow._state[this]);                                                                       // (17.3): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock);                                                     
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock);                                                      
{                                                                                                   
 var Cow._state1171701_bottom: [Cow]State;                                                          
 var tid1171701_bottom: Tid;                                                                        
 var $pc1171702: Phase;                                                                             
 var Cow._lock1171702: [Cow]Tid;                                                                    
 var this1171702: Cow;                                                                              
 var this1171701_bottom: Cow;                                                                       
 var Cow._lock1171701: [Cow]Tid;                                                                    
 var Cow._lock1171701_bottom: [Cow]Tid;                                                             
 var $decr$loop$1171701$0: int;                                                                     
 var i: int;                                                                                        
 var tid1171701: Tid;                                                                               
 var Cow._state1171702: [Cow]State;                                                                 
 var i1171701: int;                                                                                 
 var $recorded.state1171701: int;                                                                   
 var i1171701_bottom: int;                                                                          
 var tid1171702: Tid;                                                                               
 var $pc1171701_bottom: Phase;                                                                      
 var $recorded.state1171702: int;                                                                   
 var this1171701: Cow;                                                                              
 var $decr$init$1171701$0: int;                                                                     
 var $pc1171701: Phase;                                                                             
 var tmp3: bool;                                                                                    
 var i1171702: int;                                                                                 
 var $recorded.state1171701_bottom: int;                                                            
 var phase1171701: Phase;                                                                           
 var Cow._state1171701: [Cow]State;                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 18.7: int i;                                                                                    
                                                                                                    
                                                                                                    
 // 18.7: i = 0;                                                                                    
                                                                                                    
 i := 0;                                                                                            
 assume Cow._state1171701 == Cow._state && Cow._lock1171701 == Cow._lock && i1171701 == i && this1171701 == this && tid1171701 == tid;
 assume $recorded.state1171701 == 1;                                                                
                                                                                                    
 // 19.7: while (true)                                                                              
                                                                                                    
 phase1171701 := $pc;                                                                               
 $decr$init$1171701$0 := i;                                                                         
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (17.3): Bad tid
  invariant isShared(Cow._state[this]);                                                                    // (17.3): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow._lock);                                                  
  invariant (i <= $decr$init$1171701$0 && (i == $decr$init$1171701$0 ==> true));                    
  invariant phase1171701 == $pc;                                                                           // (19.7): Phase must be invariant at loop head
 {                                                                                                  
  $decr$loop$1171701$0 := i;                                                                        
                                                                                                    
  // 19.16: boolean tmp3;                                                                           
                                                                                                    
                                                                                                    
  // 19.16: tmp3 = i < 10;                                                                          
                                                                                                    
  tmp3 := (i<10);                                                                                   
  if (!(tmp3)) {                                                                                    
                                                                                                    
   // 19.7: break;                                                                                  
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 20.9: i = i - 1;                                                                               
                                                                                                    
  i := (i-1);                                                                                       
  assert (i <= $decr$loop$1171701$0 && (i == $decr$loop$1171701$0 ==> false));                             // (19.7): loop may not terminate
  assert 0 <= $decr$loop$1171701$0  || i == $decr$loop$1171701$0;                                          // (19.7): decreasing expression not properly bounded by 0
  assume Cow._state1171701_bottom == Cow._state && Cow._lock1171701_bottom == Cow._lock && i1171701_bottom == i && this1171701_bottom == this && tid1171701_bottom == tid;
  assume $recorded.state1171701_bottom == 1;                                                        
  assert phase1171701 == $pc;                                                                              // (19.7): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 17.20: // return;                                                                               
                                                                                                    
 assume Cow._state1171702 == Cow._state && Cow._lock1171702 == Cow._lock && i1171702 == i && this1171702 == this && tid1171702 == tid;
 assume $recorded.state1171702 == 1;                                                                
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
                                                                                                    
                                                                                                    
// 614.1-712.2: (Method:3.3)
// 620.1-620.24: (3.3): Bad tid
// 621.1-621.37: (3.3): this is not global
// 658.2-660.2: (class anchor.sink.VarDeclStmt:4.7)
// 661.2-664.9: (class anchor.sink.Assign:4.7)
// 667.2-672.14: (class anchor.sink.While:5.7)
// 674.1-674.27: (3.3): Bad tid
// 675.1-675.40: (3.3): this is not global
// 677.51-678.91: (5.7): decreasing expressions may actually increase
// 679.1-679.33: (5.7): Phase must be invariant at loop head
// 682.3-684.3: (class anchor.sink.VarDeclStmt:5.16)
// 685.3-688.18: (class anchor.sink.Assign:5.16)
// 690.4-693.10: (class anchor.sink.Break:5.7)
// 696.3-699.14: (class anchor.sink.Assign:6.9)
// 700.1-700.89: (5.7): loop may not terminate
// 701.1-701.71: (5.7): decreasing expression not properly bounded by 0
// 704.1-704.30: (5.7): Phase must be invariant at loop head
// 706.2-711.9: (class anchor.sink.Return:3.19)
// 713.1-811.2: (Method:10.3)
// 719.1-719.24: (10.3): Bad tid
// 720.1-720.37: (10.3): this is not global
// 757.2-759.2: (class anchor.sink.VarDeclStmt:11.7)
// 760.2-763.9: (class anchor.sink.Assign:11.7)
// 766.2-771.14: (class anchor.sink.While:12.7)
// 773.1-773.27: (10.3): Bad tid
// 774.1-774.40: (10.3): this is not global
// 776.51-777.81: (12.7): decreasing expressions may actually increase
// 778.1-778.33: (12.7): Phase must be invariant at loop head
// 781.3-783.3: (class anchor.sink.VarDeclStmt:12.16)
// 784.3-787.18: (class anchor.sink.Assign:12.16)
// 789.4-792.10: (class anchor.sink.Break:12.7)
// 795.3-798.14: (class anchor.sink.Assign:13.9)
// 799.1-799.79: (12.7): loop may not terminate
// 800.1-800.66: (12.7): decreasing expression not properly bounded by 0
// 803.1-803.30: (12.7): Phase must be invariant at loop head
// 805.2-810.9: (class anchor.sink.Return:10.20)
// 812.1-910.2: (Method:17.3)
// 818.1-818.24: (17.3): Bad tid
// 819.1-819.37: (17.3): this is not global
// 856.2-858.2: (class anchor.sink.VarDeclStmt:18.7)
// 859.2-862.9: (class anchor.sink.Assign:18.7)
// 865.2-870.14: (class anchor.sink.While:19.7)
// 872.1-872.27: (17.3): Bad tid
// 873.1-873.40: (17.3): this is not global
// 875.51-876.81: (19.7): decreasing expressions may actually increase
// 877.1-877.33: (19.7): Phase must be invariant at loop head
// 880.3-882.3: (class anchor.sink.VarDeclStmt:19.16)
// 883.3-886.18: (class anchor.sink.Assign:19.16)
// 888.4-891.10: (class anchor.sink.Break:19.7)
// 894.3-897.14: (class anchor.sink.Assign:20.9)
// 898.1-898.79: (19.7): loop may not terminate
// 899.1-899.66: (19.7): decreasing expression not properly bounded by 0
// 902.1-902.30: (19.7): Phase must be invariant at loop head
// 904.2-909.9: (class anchor.sink.Return:17.20)
// 957.1-975.2: (7.32): yields_as clause for Cow._lock is not valid
// 980.1-993.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 999.1-1025.2: (7.32): yields_as clause for Cow._lock is not transitive
