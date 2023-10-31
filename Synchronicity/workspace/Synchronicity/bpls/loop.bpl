                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/loop.anchor:                            
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
       int value isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.value == 0;                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void inc() {                                                                           
        int x;                                                                                      
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          int tmp2;                                                                                 
          tmp2 := this.value;                                                                       
          tmp1 = tmp2 < 10;                                                                         
          if (!tmp1) break; else {                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            x = x + 1;                                                                              
          }                                                                                         
        }                                                                                           
        boolean tmp3;                                                                               
        int tmp4;                                                                                   
        tmp4 := this.value;                                                                         
        tmp3 = tmp4 >= 10;                                                                          
        assert tmp3 /* == this.value >= 10 */;                                                      
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
       int value isLocal(this, tid)                                                                 
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.value == 0;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void inc() {                                                                           
        int x;                                                                                      
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          int tmp2;                                                                                 
          tmp2 := this.value;                                                                       
          tmp1 = tmp2 < 10;                                                                         
          if (!tmp1) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            x = x + 1;                                                                              
          }                                                                                         
        }                                                                                           
        boolean tmp3;                                                                               
        int tmp4;                                                                                   
        tmp4 := this.value;                                                                         
        tmp3 = tmp4 >= 10;                                                                          
        assert tmp3 /* == this.value >= 10 */;                                                      
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
       int value isLocal(this, tid)                                                                 
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.value == 0;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void inc() {                                                                           
        int x;                                                                                      
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          int tmp2;                                                                                 
          tmp2 := this.value;                                                                       
          tmp1 = tmp2 < 10;                                                                         
          if (!tmp1) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            x = x + 1;                                                                              
          }                                                                                         
        }                                                                                           
        boolean tmp3;                                                                               
        int tmp4;                                                                                   
        tmp4 := this.value;                                                                         
        tmp3 = tmp4 >= 10;                                                                          
        assert tmp3 /* == this.value >= 10 */;                                                      
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
       int value isLocal(this, tid)                                                                 
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.value == 0;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void inc() {                                                                           
        int x;                                                                                      
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          int tmp2;                                                                                 
          tmp2 := this.value;                                                                       
          tmp1 = tmp2 < 10;                                                                         
          if (!tmp1) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            x = x + 1;                                                                              
          }                                                                                         
        }                                                                                           
        boolean tmp3;                                                                               
        int tmp4;                                                                                   
        tmp4 := this.value;                                                                         
        tmp3 = tmp4 >= 10;                                                                          
        assert tmp3 /* == this.value >= 10 */;                                                      
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
                                                                                                    
                                                                                                    
/*** Class Decl Inc ***/                                                                            
                                                                                                    
type Inc;                                                                                           
const unique Inc.null: Inc;                                                                         
var Inc._state: [Inc]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc.value: [Inc]int;                                                                            
                                                                                                    
function {:inline} ReadEval.Inc.value(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.value: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(Inc._state[this], tid)) then                                                           
  if (isLocal(Inc._state[this], tid)) then                                                          
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
                                                                                                    
function {:inline} WriteEval.Inc.value(tid: Tid,this : Inc,newValue: int,Inc._state: [Inc]State,Inc.value: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc._state[this], tid)) then                                                           
  if (isLocal(Inc._state[this], tid)) then                                                          
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
                                                                                                    
var Inc._lock: [Inc]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Inc._lock(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.value: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Inc._lock(tid: Tid,this : Inc,newValue: Tid,Inc._state: [Inc]State,Inc.value: [Inc]int,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
procedure  Inc.inc(tid:Tid, this : Inc)                                                             
modifies Inc._state;                                                                                
modifies Inc.value;                                                                                 
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (8.2): Bad tid
requires isShared(Inc._state[this]);                                                                       // (8.2): this is not global
                                                                                                    
requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                          
                                                                                                    
ensures StateInvariant(Inc._state, Inc.value, Inc._lock);                                           
{                                                                                                   
 var tmp22592038: int;                                                                              
 var x2592085: int;                                                                                 
 var this2592068: Inc;                                                                              
 var this2592038: Inc;                                                                              
 var tmp32592068: bool;                                                                             
 var tmp42592085: int;                                                                              
 var Inc._lock2592084: [Inc]Tid;                                                                    
 var this2592084: Inc;                                                                              
 var path2592068: int;                                                                              
 var $pc2592059: Phase;                                                                             
 var tmp12592038: bool;                                                                             
 var x: int;                                                                                        
 var this2592085: Inc;                                                                              
 var $recorded.state2592059: int;                                                                   
 var Inc._lock2592059_bottom: [Inc]Tid;                                                             
 var tid2592059_bottom: Tid;                                                                        
 var Inc.value2592085: [Inc]int;                                                                    
 var tmp1: bool;                                                                                    
 var Inc.value2592059: [Inc]int;                                                                    
 var Inc._state2592084: [Inc]State;                                                                 
 var phase2592059: Phase;                                                                           
 var this2592059: Inc;                                                                              
 var Inc._state2592059_bottom: [Inc]State;                                                          
 var Inc._state2592085: [Inc]State;                                                                 
 var tmp42592084: int;                                                                              
 var Inc._lock2592068: [Inc]Tid;                                                                    
 var $recorded.state2592084: int;                                                                   
 var tmp42592068: int;                                                                              
 var $recorded.state2592038: int;                                                                   
 var tid2592084: Tid;                                                                               
 var Inc._state2592038: [Inc]State;                                                                 
 var Inc._state2592068: [Inc]State;                                                                 
 var tid2592059: Tid;                                                                               
 var $pc2592085: Phase;                                                                             
 var path2592038: int;                                                                              
 var tmp32592085: bool;                                                                             
 var mover2592068: Mover;                                                                           
 var moverPath2592068: MoverPath;                                                                   
 var tid2592038: Tid;                                                                               
 var $recorded.state2592085: int;                                                                   
 var x2592068: int;                                                                                 
 var tid2592085: Tid;                                                                               
 var moverPath2592038: MoverPath;                                                                   
 var x2592084: int;                                                                                 
 var $recorded.state2592059_bottom: int;                                                            
 var tid2592068: Tid;                                                                               
 var this2592059_bottom: Inc;                                                                       
 var Inc.value2592084: [Inc]int;                                                                    
 var Inc._lock2592038: [Inc]Tid;                                                                    
 var $pc2592038: Phase;                                                                             
 var tmp3: bool;                                                                                    
 var Inc._state2592059: [Inc]State;                                                                 
 var x2592038: int;                                                                                 
 var tmp32592084: bool;                                                                             
 var Inc.value2592059_bottom: [Inc]int;                                                             
 var Inc.value2592038: [Inc]int;                                                                    
 var mover2592038: Mover;                                                                           
 var tmp2: int;                                                                                     
 var x2592059_bottom: int;                                                                          
 var $pc2592084: Phase;                                                                             
 var Inc._lock2592059: [Inc]Tid;                                                                    
 var $pc2592068: Phase;                                                                             
 var tmp4: int;                                                                                     
 var x2592059: int;                                                                                 
 var Inc.value2592068: [Inc]int;                                                                    
 var Inc._lock2592085: [Inc]Tid;                                                                    
 var $recorded.state2592068: int;                                                                   
 var $pc2592059_bottom: Phase;                                                                      
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 9.3: int x;                                                                                     
                                                                                                    
 assume Inc._state2592059 == Inc._state && Inc.value2592059 == Inc.value && Inc._lock2592059 == Inc._lock && x2592059 == x && this2592059 == this && tid2592059 == tid;
 assume $recorded.state2592059 == 1;                                                                
                                                                                                    
 // 10.5: while (true)   {                                                                          
                                                                                                    
 phase2592059 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (8.2): Bad tid
  invariant isShared(Inc._state[this]);                                                                    // (8.2): this is not global
                                                                                                    
  invariant StateInvariant(Inc._state, Inc.value, Inc._lock);                                       
  invariant (forall _this : Inc :: Invariant.Y_Inc.value(tid : Tid, _this, Inc.value[_this] ,Inc._state2592059,Inc.value2592059,Inc._lock2592059));       // (10.5): Loop does not preserve yields_as annotation for field value
  invariant phase2592059 == $pc;                                                                           // (10.5): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (10.5): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 10.23: boolean tmp1;                                                                           
                                                                                                    
                                                                                                    
  // 10.12: int tmp2;                                                                               
                                                                                                    
                                                                                                    
  // 10.12: tmp2 := this.value;                                                                     
                                                                                                    
                                                                                                    
  moverPath2592038 := ReadEval.Inc.value(tid: Tid,this: Inc,Inc._state,Inc.value,Inc._lock);        
  mover2592038 := m#moverPath(moverPath2592038);                                                    
  path2592038 := p#moverPath(moverPath2592038);                                                     
  assume Inc._state2592038 == Inc._state && Inc.value2592038 == Inc.value && Inc._lock2592038 == Inc._lock && tmp22592038 == tmp2 && tmp12592038 == tmp1 && x2592038 == x && this2592038 == this && tid2592038 == tid && $pc2592038 == $pc;
  assume $recorded.state2592038 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != Inc.null;                                                                         
  } else {                                                                                          
   assert this != Inc.null;                                                                                // (10.12): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2592038);                                                             
  assert $pc != PhaseError;                                                                                // (10.12): Reduction failure
  tmp2 := Inc.value[this];                                                                          
                                                                                                    
  // 10.23: tmp1 = tmp2 < 10;                                                                       
                                                                                                    
  tmp1 := (tmp2<10);                                                                                
  if (!(tmp1)) {                                                                                    
                                                                                                    
   // 10.5: break;                                                                                  
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 11.7: x = x + 1;                                                                               
                                                                                                    
  x := (x+1);                                                                                       
  assume Inc._state2592059_bottom == Inc._state && Inc.value2592059_bottom == Inc.value && Inc._lock2592059_bottom == Inc._lock && x2592059_bottom == x && this2592059_bottom == this && tid2592059_bottom == tid;
  assume $recorded.state2592059_bottom == 1;                                                        
  assert phase2592059 == $pc;                                                                              // (10.5): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 14.5: boolean tmp3;                                                                             
                                                                                                    
                                                                                                    
 // 14.5: int tmp4;                                                                                 
                                                                                                    
                                                                                                    
 // 14.5: tmp4 := this.value;                                                                       
                                                                                                    
                                                                                                    
 moverPath2592068 := ReadEval.Inc.value(tid: Tid,this: Inc,Inc._state,Inc.value,Inc._lock);         
 mover2592068 := m#moverPath(moverPath2592068);                                                     
 path2592068 := p#moverPath(moverPath2592068);                                                      
 assume Inc._state2592068 == Inc._state && Inc.value2592068 == Inc.value && Inc._lock2592068 == Inc._lock && tmp42592068 == tmp4 && tmp32592068 == tmp3 && x2592068 == x && this2592068 == this && tid2592068 == tid && $pc2592068 == $pc;
 assume $recorded.state2592068 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Inc.null;                                                                          
 } else {                                                                                           
  assert this != Inc.null;                                                                                 // (14.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2592068);                                                              
 assert $pc != PhaseError;                                                                                 // (14.5): Reduction failure
 tmp4 := Inc.value[this];                                                                           
                                                                                                    
 // 14.5: tmp3 = tmp4 >= 10;                                                                        
                                                                                                    
 tmp3 := (tmp4>=10);                                                                                
                                                                                                    
 // 14.5: assert tmp3 /* == this.value >= 10 */;                                                    
                                                                                                    
 assume Inc._state2592084 == Inc._state && Inc.value2592084 == Inc.value && Inc._lock2592084 == Inc._lock && tmp42592084 == tmp4 && tmp32592084 == tmp3 && x2592084 == x && this2592084 == this && tid2592084 == tid;
 assume $recorded.state2592084 == 1;                                                                
 assert tmp3 /* lowered (Inc.value[this]>=10) */;                                                          // (14.5): This assertion may not hold.
                                                                                                    
 // 8.21: // return;                                                                                
                                                                                                    
 assume Inc._state2592085 == Inc._state && Inc.value2592085 == Inc.value && Inc._lock2592085 == Inc._lock && tmp42592085 == tmp4 && tmp32592085 == tmp3 && x2592085 == x && this2592085 == this && tid2592085 == tid;
 assume $recorded.state2592085 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Inc._state: [Inc]State,Inc.value: [Inc]int,Inc._lock: [Inc]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Inc  :: _i == Inc.null <==> isNull(Inc._state[_i])) &&                                
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Inc.value(t: Tid, u: Tid, v: int, w: int, x: Inc)            
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.value_pre: [Inc]int;                                                                       
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]int;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: int,Inc._state,Inc.value,Inc._lock);             
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.value[x] := v;                                                                                 
 assume Inc._state_post == Inc._state && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.value(u: Tid,x: Inc,w: int,Inc._state,Inc.value,Inc._lock);             
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (6.2): Inc.value failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Inc.value(t: Tid, u: Tid, v: int, w: int, x: Inc)             
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.value_pre: [Inc]int;                                                                       
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]int;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: int,Inc._state,Inc.value,Inc._lock);             
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.value[x] := v;                                                                                 
 assume Inc._state_post == Inc._state && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Inc.value(u: Tid,x: Inc,Inc._state,Inc.value,Inc._lock);                      
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (6.2): Inc.value failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Inc.value(t: Tid, u: Tid, v: int, w: int, x: Inc)             
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
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
 var havocValue : int;                                                                              
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.value_pre: [Inc]int;                                                                       
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]int;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.value[x];                                                                          
 assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: int,Inc._state,Inc.value,Inc._lock);             
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Inc.value[x] := havocValue;                                                                        
 assume Inc._state_post == Inc._state && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.value(u: Tid,x: Inc,w: int,Inc._state,Inc.value,Inc._lock);             
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (6.2): Inc.value failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Inc.value(t: Tid, u: Tid, v: int, w: int, x: Inc)              
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
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
 var havocValue : int;                                                                              
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.value_pre: [Inc]int;                                                                       
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]int;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.value[x];                                                                          
 assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Inc.value(u: Tid,x: Inc,Inc._state,Inc.value,Inc._lock);                      
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Inc._state_post == Inc._state && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: int,Inc._state,Inc.value,Inc._lock);             
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (6.2): Inc.value failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Inc.value(t: Tid, u: Tid, v: int, w: int, x: Inc)                  
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.value_pre: [Inc]int;                                                                       
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]int;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.value(t: Tid,x: Inc,Inc._state,Inc.value,Inc._lock);                      
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Inc._state_post == Inc._state && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Inc.value(u: Tid,x: Inc,w: int,Inc._state,Inc.value,Inc._lock);             
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.2): Inc.value failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Inc.value(t: Tid, u: Tid, v: int, w: int, x: Inc)                   
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
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
 var havocValue : int;                                                                              
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.value_pre: [Inc]int;                                                                       
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]int;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Inc.value[x];                                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.value(t: Tid,x: Inc,Inc._state,Inc.value,Inc._lock);                      
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Inc.value[x] := havocValue;                                                                        
 assume Inc._state_post == Inc._state && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Inc.value(u: Tid,x: Inc,w: int,Inc._state,Inc.value,Inc._lock);             
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.2): Inc.value failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.value.Inc.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.value_pre: [Inc]int;                                                                       
 var w_pre: int;                                                                                    
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
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]int;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.value(u: Tid,y: Inc,w: int,Inc._state,Inc.value,Inc._lock);             
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: int,Inc._state,Inc.value,Inc._lock);             
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.value[x] := v;                                                                                 
 assume Inc._state_post == Inc._state && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.value(u: Tid,y: Inc,w: int,Inc._state,Inc.value,Inc._lock);         
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.2): Inc.value is not Write-Write Stable with respect to Inc.value (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.2): Inc.value is not Write-Write Stable with respect to Inc.value (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.2): Inc.value is not Write-Write Stable with respect to Inc.value (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.value.Inc.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.value;                                                                                
 modifies Inc.value;                                                                                
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.value_pre: [Inc]int;                                                                       
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Inc.value_mid: [Inc]int;                                                                       
 var w_mid: int;                                                                                    
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]int;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: int,Inc._state,Inc.value,Inc._lock);             
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.value[x];                                                                              
 Inc.value[x] := v;                                                                                 
                                                                                                    
 assume Inc._state_mid == Inc._state && Inc.value_mid == Inc.value && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.value(u: Tid,y: Inc,w: int,Inc._state,Inc.value,Inc._lock);             
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.value[x] := tmpV;                                                                              
 Inc.value[y] := w;                                                                                 
 _writeByTPost := WriteEval.Inc.value(t: Tid,x: Inc,v: int,Inc._state,Inc.value,Inc._lock);         
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Inc._state_post == Inc._state && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.2): Inc.value is not Write-Write Stable with respect to Inc.value (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.value.Inc.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.value;                                                                                
 modifies Inc.value;                                                                                
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.value_pre: [Inc]int;                                                                       
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Inc.value_mid: [Inc]int;                                                                       
 var w_mid: int;                                                                                    
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]int;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.value(u: Tid,y: Inc,w: int,Inc._state,Inc.value,Inc._lock);             
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: int,Inc._state,Inc.value,Inc._lock);             
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.value[x];                                                                              
 Inc.value[x] := v;                                                                                 
 assume Inc._state_mid == Inc._state && Inc.value_mid == Inc.value && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.value(u: Tid,y: Inc,w: int,Inc._state,Inc.value,Inc._lock);         
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.value[x] := tmpV;                                                                              
 Inc.value[y] := w;                                                                                 
 _writeByTPost := WriteEval.Inc.value(t: Tid,x: Inc,v: int,Inc._state,Inc.value,Inc._lock);         
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.2): Inc.value is not Write-Write Stable with respect to Inc.value (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.2): Inc.value is not Write-Write Stable with respect to Inc.value (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.value.Inc.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.value_pre: [Inc]int;                                                                       
 var w_pre: int;                                                                                    
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
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]int;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.value(t: Tid,x: Inc,Inc._state,Inc.value,Inc._lock);                      
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.value(u: Tid,y: Inc,w: int,Inc._state,Inc.value,Inc._lock);             
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.value[y] := w;                                                                                 
 assume Inc._state_post == Inc._state && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.value(t: Tid,x: Inc,Inc._state,Inc.value,Inc._lock);                  
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.2): Inc.value is not Read-Write Stable with respect to Inc.value (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.2): Inc.value is not Read-Write Stable with respect to Inc.value (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.2): Inc.value is not Read-Write Stable with respect to Inc.value (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.value.Inc.value(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.value_pre: [Inc]int;                                                                       
 var w_pre: int;                                                                                    
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
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var Inc.value_post: [Inc]int;                                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.value(u: Tid,y: Inc,Inc._state,Inc.value,Inc._lock);                      
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.value(t: Tid,x: Inc,v: int,Inc._state,Inc.value,Inc._lock);             
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.value[x] := v;                                                                                 
 assume Inc._state_post == Inc._state && Inc.value_post == Inc.value && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.value(u: Tid,y: Inc,Inc._state,Inc.value,Inc._lock);                  
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.2): Inc.value is not Write-Read Stable with respect to Inc.value (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.2): Inc.value is not Write-Read Stable with respect to Inc.value (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.2): Inc.value is not Write-Read Stable with respect to Inc.value (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                          
requires ValidTid(tid);                                                                             
modifies Inc._state;                                                                                
modifies Inc.value;                                                                                 
modifies Inc._lock;                                                                                 
ensures StateInvariant(Inc._state, Inc.value, Inc._lock);                                           
ensures Y(tid , old(Inc._state), old(Inc.value), old(Inc._lock) , Inc._state, Inc.value, Inc._lock);
                                                                                                    
// Inc.value:                                                                                       
                                                                                                    
function {:inline} Y_Inc.value(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.value: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc.value(tid: Tid,this: Inc,Inc._state,Inc.value,Inc._lock)), _R)) ==> (Inc.value[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.value(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.value: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc.value.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.value: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
var Inc.value_yield: [Inc]int;                                                                      
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc.value(u: Tid,this: Inc,newValue: int,Inc._state,Inc.value,Inc._lock)));
                                                                                                    
assume Inc._state_yield == Inc._state && Inc.value_yield == Inc.value && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.value(tid, this, newValue , Inc._state, Inc.value, Inc._lock);                        
}                                                                                                   
                                                                                                    
procedure Y_Inc.value.Reflexive(tid : Tid, this: Inc , Inc._state: [Inc]State, Inc.value: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
var Inc.value_yield: [Inc]int;                                                                      
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Inc._state_yield == Inc._state && Inc.value_yield == Inc.value && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.value(tid, this, Inc.value[this] , Inc._state, Inc.value, Inc._lock);                 
}                                                                                                   
                                                                                                    
procedure Y_Inc.value.Transitive(tid : Tid, this: Inc, newValue : int , Inc._state: [Inc]State, Inc.value: [Inc]int, Inc._lock: [Inc]Tid , Inc._state_p: [Inc]State, Inc.value_p: [Inc]int, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
 requires StateInvariant(Inc._state_p, Inc.value_p, Inc._lock_p);                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Inc.value_pre: [Inc]int;                                                                        
var tid_pre: Tid;                                                                                   
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var tid_post: Tid;                                                                                  
var Inc._lock_post: [Inc]Tid;                                                                       
var Inc.value_post: [Inc]int;                                                                       
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Inc._state, Inc.value, Inc._lock , Inc._state_p, Inc.value_p, Inc._lock_p);         
 assume Y_Inc.value(tid, this, newValue , Inc._state_p, Inc.value_p, Inc._lock_p);                  
assume Inc._state_post == Inc._state_p && Inc.value_post == Inc.value_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc.value(tid, this, newValue , Inc._state, Inc.value, Inc._lock);                        
}                                                                                                   
// Inc._lock:                                                                                       
                                                                                                    
function {:inline} Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.value: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Inc._state,Inc.value,Inc._lock)), _R)) ==> (Inc._lock[this] == newValue))
 &&(((Inc._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.value: [Inc]int, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.value: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
var Inc.value_yield: [Inc]int;                                                                      
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc._lock(u: Tid,this: Inc,newValue: Tid,Inc._state,Inc.value,Inc._lock)));
 assume leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Inc._state,Inc.value,Inc._lock)), _N);
assume Inc._state_yield == Inc._state && Inc.value_yield == Inc.value && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, newValue , Inc._state, Inc.value, Inc._lock);                        
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Reflexive(tid : Tid, this: Inc , Inc._state: [Inc]State, Inc.value: [Inc]int, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
var Inc.value_yield: [Inc]int;                                                                      
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Inc._state_yield == Inc._state && Inc.value_yield == Inc.value && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, Inc._lock[this] , Inc._state, Inc.value, Inc._lock);                 
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Transitive(tid : Tid, this: Inc, newValue : Tid , Inc._state: [Inc]State, Inc.value: [Inc]int, Inc._lock: [Inc]Tid , Inc._state_p: [Inc]State, Inc.value_p: [Inc]int, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.value, Inc._lock);                                         
 requires StateInvariant(Inc._state_p, Inc.value_p, Inc._lock_p);                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Inc.value_pre: [Inc]int;                                                                        
var tid_pre: Tid;                                                                                   
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var tid_post: Tid;                                                                                  
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
var Inc.value_post: [Inc]int;                                                                       
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.value_pre == Inc.value && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Inc._state, Inc.value, Inc._lock , Inc._state_p, Inc.value_p, Inc._lock_p);         
 assume Y_Inc._lock(tid, this, newValue , Inc._state_p, Inc.value_p, Inc._lock_p);                  
assume Inc._state_post == Inc._state_p && Inc.value_post == Inc.value_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc._lock(tid, this, newValue , Inc._state, Inc.value, Inc._lock);                        
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Inc._state: [Inc]State, Inc.value: [Inc]int, Inc._lock: [Inc]Tid , Inc._state_p: [Inc]State, Inc.value_p: [Inc]int, Inc._lock_p: [Inc]Tid): bool
{                                                                                                   
 (forall this: Inc :: Y_Inc.value(tid : Tid, this, Inc.value_p[this] , Inc._state, Inc.value, Inc._lock))
 && (forall this: Inc :: Y_Inc._lock(tid : Tid, this, Inc._lock_p[this] , Inc._state, Inc.value, Inc._lock))
 && (forall _i : Inc :: isShared(Inc._state[_i]) ==> isShared(Inc._state_p[_i]))                    
 && (forall _i : Inc :: isLocal(Inc._state[_i], tid) <==> isLocal(Inc._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 504.1-693.2: (Method:8.2)
// 511.1-511.24: (8.2): Bad tid
// 512.1-512.37: (8.2): this is not global
// 591.2-593.2: (class anchor.sink.VarDeclStmt:9.3)
// 596.2-600.14: (class anchor.sink.While:10.5)
// 602.1-602.27: (8.2): Bad tid
// 603.1-603.40: (8.2): this is not global
// 606.1-606.148: (10.5): Loop does not preserve yields_as annotation for field value
// 607.1-607.33: (10.5): Phase must be invariant at loop head
// 608.1-608.30: (10.5): Potentially infinite loop cannot be in post-commit phase.
// 610.3-612.3: (class anchor.sink.VarDeclStmt:10.23)
// 613.3-615.3: (class anchor.sink.VarDeclStmt:10.12)
// 616.3-633.27: (class anchor.sink.Read:10.12)
// 628.1-628.28: (10.12): Cannot have potential null deference in left-mover part.
// 632.1-632.28: (10.12): Reduction failure
// 634.3-637.21: (class anchor.sink.Assign:10.23)
// 639.4-642.10: (class anchor.sink.Break:10.5)
// 645.3-648.14: (class anchor.sink.Assign:11.7)
// 651.1-651.30: (10.5): Phase must be invariant at loop head
// 653.2-655.2: (class anchor.sink.VarDeclStmt:14.5)
// 656.2-658.2: (class anchor.sink.VarDeclStmt:14.5)
// 659.2-676.26: (class anchor.sink.Read:14.5)
// 671.1-671.27: (14.5): Cannot have potential null deference in left-mover part.
// 675.1-675.27: (14.5): Reduction failure
// 677.2-680.21: (class anchor.sink.Assign:14.5)
// 681.2-686.50: (class anchor.sink.Assert:14.5)
// 686.1-686.50: (14.5): This assertion may not hold.
// 687.2-692.9: (class anchor.sink.Return:8.21)
// 767.1-767.34: (6.2): Inc.value failed Write-Write Right-Mover Check
// 824.1-824.30: (6.2): Inc.value failed Write-Read Right-Mover Check
// 885.1-885.34: (6.2): Inc.value failed Write-Write Left-Mover Check
// 943.1-943.30: (6.2): Inc.value failed Write-Read Left-Mover Check
// 998.1-998.34: (6.2): Inc.value failed Read-Write Right-Mover Check
// 1056.1-1056.34: (6.2): Inc.value failed Read-Write Left-Mover Check
// 1125.1-1125.140: (6.2): Inc.value is not Write-Write Stable with respect to Inc.value (case A.1)
// 1126.1-1126.101: (6.2): Inc.value is not Write-Write Stable with respect to Inc.value (case A.2)
// 1127.1-1127.158: (6.2): Inc.value is not Write-Write Stable with respect to Inc.value (case A.3)
// 1220.1-1220.140: (6.2): Inc.value is not Write-Write Stable with respect to Inc.value (case C)
// 1318.1-1318.144: (6.2): Inc.value is not Write-Write Stable with respect to Inc.value (case D)
// 1319.1-1319.144: (6.2): Inc.value is not Write-Write Stable with respect to Inc.value (case R)
// 1388.1-1388.136: (6.2): Inc.value is not Read-Write Stable with respect to Inc.value (case F)
// 1389.1-1389.136: (6.2): Inc.value is not Read-Write Stable with respect to Inc.value (case H)
// 1390.1-1390.146: (6.2): Inc.value is not Read-Write Stable with respect to Inc.value (case I)
// 1458.1-1458.136: (6.2): Inc.value is not Write-Read Stable with respect to Inc.value (case J)
// 1459.1-1459.136: (6.2): Inc.value is not Write-Read Stable with respect to Inc.value (case K)
// 1460.1-1460.99: (6.2): Inc.value is not Write-Read Stable with respect to Inc.value (case L)
// 1491.1-1510.2: (6.2): yields_as clause for Inc.value is not valid
// 1515.1-1529.2: (6.2): yields_as clause for Inc.value is not reflexive
// 1535.1-1563.2: (6.2): yields_as clause for Inc.value is not transitive
// 1583.1-1602.2: (7.32): yields_as clause for Inc._lock is not valid
// 1607.1-1621.2: (7.32): yields_as clause for Inc._lock is not reflexive
// 1627.1-1655.2: (7.32): yields_as clause for Inc._lock is not transitive
