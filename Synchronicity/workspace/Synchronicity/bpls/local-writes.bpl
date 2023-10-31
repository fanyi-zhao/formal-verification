                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/local-writes.anchor:                    
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
      volatile Inc next isLocal(this, tid)                                                          
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.next == Inc.null;                                                               
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        Inc i;                                                                                      
        i = new Inc();                                                                              
        i.init()                                                                                    
        Inc j;                                                                                      
        j = new Inc();                                                                              
        j.init()                                                                                    
        i.next := j;                                                                                
        j.next := i;                                                                                
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void g() {                                                                             
        Inc i;                                                                                      
        i = new Inc();                                                                              
        i.init()                                                                                    
        Inc j;                                                                                      
        j = new Inc();                                                                              
        j.init()                                                                                    
        i.next := j, j.next := i;                                                                   
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
      volatile Inc next isLocal(this, tid)                                                          
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
        assume this.next == Inc.null;                                                               
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        Inc i;                                                                                      
        i = new Inc();                                                                              
        i.init()                                                                                    
        Inc j;                                                                                      
        j = new Inc();                                                                              
        j.init()                                                                                    
        i.next := j;                                                                                
        j.next := i;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void g() {                                                                             
        Inc i;                                                                                      
        i = new Inc();                                                                              
        i.init()                                                                                    
        Inc j;                                                                                      
        j = new Inc();                                                                              
        j.init()                                                                                    
        i.next := j, j.next := i;                                                                   
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
      volatile Inc next isLocal(this, tid)                                                          
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
        assume this.next == Inc.null;                                                               
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        Inc i;                                                                                      
        i = new Inc();                                                                              
        {                                                                                           
          inlined i.init();                                                                         
          exit$212: {                                                                               
            Inc this$212;                                                                           
            this$212 = i;                                                                           
            {                                                                                       
              assume this$212.next == Inc.null;                                                     
              {                                                                                     
                {                                                                                   
                  break exit$212;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        Inc j;                                                                                      
        j = new Inc();                                                                              
        {                                                                                           
          inlined j.init();                                                                         
          exit$213: {                                                                               
            Inc this$213;                                                                           
            this$213 = j;                                                                           
            {                                                                                       
              assume this$213.next == Inc.null;                                                     
              {                                                                                     
                {                                                                                   
                  break exit$213;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        i.next := j;                                                                                
        j.next := i;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void g() {                                                                             
        Inc i;                                                                                      
        i = new Inc();                                                                              
        {                                                                                           
          inlined i.init();                                                                         
          exit$214: {                                                                               
            Inc this$214;                                                                           
            this$214 = i;                                                                           
            {                                                                                       
              assume this$214.next == Inc.null;                                                     
              {                                                                                     
                {                                                                                   
                  break exit$214;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        Inc j;                                                                                      
        j = new Inc();                                                                              
        {                                                                                           
          inlined j.init();                                                                         
          exit$215: {                                                                               
            Inc this$215;                                                                           
            this$215 = j;                                                                           
            {                                                                                       
              assume this$215.next == Inc.null;                                                     
              {                                                                                     
                {                                                                                   
                  break exit$215;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        i.next := j, j.next := i;                                                                   
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
      volatile Inc next isLocal(this, tid)                                                          
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
        assume this.next == Inc.null;                                                               
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        Inc i;                                                                                      
        i = new Inc();                                                                              
        {                                                                                           
          inlined i.init();                                                                         
          exit$212: {                                                                               
            Inc this$212;                                                                           
            this$212 = i;                                                                           
            {                                                                                       
              assume this$212.next == Inc.null;                                                     
              {                                                                                     
                {                                                                                   
                  break exit$212;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        Inc j;                                                                                      
        j = new Inc();                                                                              
        {                                                                                           
          inlined j.init();                                                                         
          exit$213: {                                                                               
            Inc this$213;                                                                           
            this$213 = j;                                                                           
            {                                                                                       
              assume this$213.next == Inc.null;                                                     
              {                                                                                     
                {                                                                                   
                  break exit$213;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        i.next := j;                                                                                
        j.next := i;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void g() {                                                                             
        Inc i;                                                                                      
        i = new Inc();                                                                              
        {                                                                                           
          inlined i.init();                                                                         
          exit$214: {                                                                               
            Inc this$214;                                                                           
            this$214 = i;                                                                           
            {                                                                                       
              assume this$214.next == Inc.null;                                                     
              {                                                                                     
                {                                                                                   
                  break exit$214;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        Inc j;                                                                                      
        j = new Inc();                                                                              
        {                                                                                           
          inlined j.init();                                                                         
          exit$215: {                                                                               
            Inc this$215;                                                                           
            this$215 = j;                                                                           
            {                                                                                       
              assume this$215.next == Inc.null;                                                     
              {                                                                                     
                {                                                                                   
                  break exit$215;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        i.next := j, j.next := i;                                                                   
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
                                                                                                    
var Inc.next: [Inc]Inc;                                                                             
                                                                                                    
function {:inline} ReadEval.Inc.next(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc._lock: [Inc]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Inc.null;                                                                         
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
                                                                                                    
function {:inline} WriteEval.Inc.next(tid: Tid,this : Inc,newValue: Inc,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} ReadEval.Inc._lock(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Inc._lock(tid: Tid,this : Inc,newValue: Tid,Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc._lock: [Inc]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
procedure  Inc.f(tid:Tid, this : Inc)                                                               
modifies Inc._state;                                                                                
modifies Inc.next;                                                                                  
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (6.3): Bad tid
requires isShared(Inc._state[this]);                                                                       // (6.3): this is not global
                                                                                                    
requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                           
                                                                                                    
ensures StateInvariant(Inc._state, Inc.next, Inc._lock);                                            
{                                                                                                   
 var j2389140: Inc;                                                                                 
 var $pc2389136: Phase;                                                                             
 var $recorded.state2389136: int;                                                                   
 var moverPath2389139: MoverPath;                                                                   
 var Inc.next2389139: [Inc]Inc;                                                                     
 var Inc._state2389139: [Inc]State;                                                                 
 var $pc2389139: Phase;                                                                             
 var this2389139: Inc;                                                                              
 var $recorded.state2389139: int;                                                                   
 var tid2389140: Tid;                                                                               
 var this2389140: Inc;                                                                              
 var i: Inc;                                                                                        
 var Inc._lock2389136: [Inc]Tid;                                                                    
 var Inc._lock2389140: [Inc]Tid;                                                                    
 var this2389136: Inc;                                                                              
 var Inc.next2389136: [Inc]Inc;                                                                     
 var this$213: Inc;                                                                                 
 var $pc2389140: Phase;                                                                             
 var j: Inc;                                                                                        
 var Inc._lock2389139: [Inc]Tid;                                                                    
 var mover2389136: Mover;                                                                           
 var j2389139: Inc;                                                                                 
 var i2389139: Inc;                                                                                 
 var $recorded.state2389140: int;                                                                   
 var Inc.next2389140: [Inc]Inc;                                                                     
 var tid2389139: Tid;                                                                               
 var path2389136: int;                                                                              
 var i2389136: Inc;                                                                                 
 var this$212: Inc;                                                                                 
 var Inc._state2389136: [Inc]State;                                                                 
 var tid2389136: Tid;                                                                               
 var mover2389139: Mover;                                                                           
 var moverPath2389136: MoverPath;                                                                   
 var Inc._state2389140: [Inc]State;                                                                 
 var i2389140: Inc;                                                                                 
 var j2389136: Inc;                                                                                 
 var path2389139: int;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 7.5: Inc i;                                                                                     
                                                                                                    
                                                                                                    
 // 7.5: i = new Inc();                                                                             
                                                                                                    
 havoc i;                                                                                           
 assume i != Inc.null && isFresh(Inc._state[i]);                                                    
 Inc._state[i] := LOCAL(tid);                                                                       
 assume Inc.next[i]  == Inc.null;                                                                   
 assume Inc._lock[i]  == Tid.null;                                                                  
 // inlined: i.init()}                                                                              
 exit$212_top:                                                                                      
                                                                                                    
 // 7.5: Inc this$212;                                                                              
                                                                                                    
                                                                                                    
 // 7.5: this$212 = i;                                                                              
                                                                                                    
 this$212 := i;                                                                                     
                                                                                                    
 // 3.11: assume this$212.next == Inc.null;                                                         
                                                                                                    
 assume (Inc.next[this$212]==Inc.null);                                                             
                                                                                                    
 // 20.1: break exit$212;                                                                           
                                                                                                    
 goto exit$212_bottom;                                                                              
 exit$212_bottom:                                                                                   
                                                                                                    
 // 8.5: Inc j;                                                                                     
                                                                                                    
                                                                                                    
 // 8.5: j = new Inc();                                                                             
                                                                                                    
 havoc j;                                                                                           
 assume j != Inc.null && isFresh(Inc._state[j]);                                                    
 Inc._state[j] := LOCAL(tid);                                                                       
 assume Inc.next[j]  == Inc.null;                                                                   
 assume Inc._lock[j]  == Tid.null;                                                                  
 // inlined: j.init()}                                                                              
 exit$213_top:                                                                                      
                                                                                                    
 // 8.5: Inc this$213;                                                                              
                                                                                                    
                                                                                                    
 // 8.5: this$213 = j;                                                                              
                                                                                                    
 this$213 := j;                                                                                     
                                                                                                    
 // 3.11: assume this$213.next == Inc.null;                                                         
                                                                                                    
 assume (Inc.next[this$213]==Inc.null);                                                             
                                                                                                    
 // 20.1: break exit$213;                                                                           
                                                                                                    
 goto exit$213_bottom;                                                                              
 exit$213_bottom:                                                                                   
                                                                                                    
                                                                                                    
 // 9.5: i.next := j;                                                                               
                                                                                                    
                                                                                                    
 moverPath2389136 := WriteEval.Inc.next(tid: Tid,i: Inc,j: Inc,Inc._state,Inc.next,Inc._lock);      
 mover2389136 := m#moverPath(moverPath2389136);                                                     
 path2389136 := p#moverPath(moverPath2389136);                                                      
 assume Inc._state2389136 == Inc._state && Inc.next2389136 == Inc.next && Inc._lock2389136 == Inc._lock && j2389136 == j && i2389136 == i && this2389136 == this && tid2389136 == tid && $pc2389136 == $pc;
 assume $recorded.state2389136 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume i != Inc.null;                                                                             
 } else {                                                                                           
  assert i != Inc.null;                                                                                    // (9.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2389136);                                                              
 assert $pc != PhaseError;                                                                                 // (9.5): Reduction failure
 Inc.next[i] := j;                                                                                  
 if (isLocal(Inc._state[j], tid)) {                                                                 
  Inc._state[j] := SHARED();                                                                        
  assert isSharedAssignable(Inc._state[Inc.next[j]]);                                                      // (9.5): j became shared, but j.next may not be shared.
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 10.5: j.next := i;                                                                              
                                                                                                    
                                                                                                    
 moverPath2389139 := WriteEval.Inc.next(tid: Tid,j: Inc,i: Inc,Inc._state,Inc.next,Inc._lock);      
 mover2389139 := m#moverPath(moverPath2389139);                                                     
 path2389139 := p#moverPath(moverPath2389139);                                                      
 assume Inc._state2389139 == Inc._state && Inc.next2389139 == Inc.next && Inc._lock2389139 == Inc._lock && j2389139 == j && i2389139 == i && this2389139 == this && tid2389139 == tid && $pc2389139 == $pc;
 assume $recorded.state2389139 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume j != Inc.null;                                                                             
 } else {                                                                                           
  assert j != Inc.null;                                                                                    // (10.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2389139);                                                              
 assert $pc != PhaseError;                                                                                 // (10.5): Reduction failure
 Inc.next[j] := i;                                                                                  
 if (isLocal(Inc._state[i], tid)) {                                                                 
  Inc._state[i] := SHARED();                                                                        
  assert isSharedAssignable(Inc._state[Inc.next[i]]);                                                      // (10.5): i became shared, but i.next may not be shared.
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 6.19: // return;                                                                                
                                                                                                    
 assume Inc._state2389140 == Inc._state && Inc.next2389140 == Inc.next && Inc._lock2389140 == Inc._lock && j2389140 == j && i2389140 == i && this2389140 == this && tid2389140 == tid;
 assume $recorded.state2389140 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Inc.g(tid:Tid, this : Inc)                                                               
modifies Inc._state;                                                                                
modifies Inc.next;                                                                                  
modifies Inc._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (13.3): Bad tid
requires isShared(Inc._state[this]);                                                                       // (13.3): this is not global
                                                                                                    
requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                           
                                                                                                    
ensures StateInvariant(Inc._state, Inc.next, Inc._lock);                                            
{                                                                                                   
 var tid2389209: Tid;                                                                               
 var Inc.next2389209: [Inc]Inc;                                                                     
 var tid2389211: Tid;                                                                               
 var j2389211: Inc;                                                                                 
 var this$214: Inc;                                                                                 
 var $pc2389206: Phase;                                                                             
 var i2389209: Inc;                                                                                 
 var $pc2389211: Phase;                                                                             
 var $recorded.state2389206: int;                                                                   
 var moverPath2389209: MoverPath;                                                                   
 var Inc._lock2389209: [Inc]Tid;                                                                    
 var i2389206: Inc;                                                                                 
 var path2389209: int;                                                                              
 var Inc.next2389206: [Inc]Inc;                                                                     
 var $pc2389209: Phase;                                                                             
 var tid2389206: Tid;                                                                               
 var Inc._lock2389206: [Inc]Tid;                                                                    
 var $recorded.state2389209: int;                                                                   
 var i2389211: Inc;                                                                                 
 var mover2389206: Mover;                                                                           
 var Inc._lock2389211: [Inc]Tid;                                                                    
 var i: Inc;                                                                                        
 var j2389209: Inc;                                                                                 
 var this2389211: Inc;                                                                              
 var $recorded.state2389211: int;                                                                   
 var Inc.next2389211: [Inc]Inc;                                                                     
 var moverPath2389206: MoverPath;                                                                   
 var j: Inc;                                                                                        
 var j2389206: Inc;                                                                                 
 var this$215: Inc;                                                                                 
 var Inc._state2389209: [Inc]State;                                                                 
 var path2389206: int;                                                                              
 var this2389206: Inc;                                                                              
 var Inc._state2389211: [Inc]State;                                                                 
 var mover2389209: Mover;                                                                           
 var Inc._state2389206: [Inc]State;                                                                 
 var this2389209: Inc;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 14.5: Inc i;                                                                                    
                                                                                                    
                                                                                                    
 // 14.5: i = new Inc();                                                                            
                                                                                                    
 havoc i;                                                                                           
 assume i != Inc.null && isFresh(Inc._state[i]);                                                    
 Inc._state[i] := LOCAL(tid);                                                                       
 assume Inc.next[i]  == Inc.null;                                                                   
 assume Inc._lock[i]  == Tid.null;                                                                  
 // inlined: i.init()}                                                                              
 exit$214_top:                                                                                      
                                                                                                    
 // 14.5: Inc this$214;                                                                             
                                                                                                    
                                                                                                    
 // 14.5: this$214 = i;                                                                             
                                                                                                    
 this$214 := i;                                                                                     
                                                                                                    
 // 3.11: assume this$214.next == Inc.null;                                                         
                                                                                                    
 assume (Inc.next[this$214]==Inc.null);                                                             
                                                                                                    
 // 20.1: break exit$214;                                                                           
                                                                                                    
 goto exit$214_bottom;                                                                              
 exit$214_bottom:                                                                                   
                                                                                                    
 // 15.5: Inc j;                                                                                    
                                                                                                    
                                                                                                    
 // 15.5: j = new Inc();                                                                            
                                                                                                    
 havoc j;                                                                                           
 assume j != Inc.null && isFresh(Inc._state[j]);                                                    
 Inc._state[j] := LOCAL(tid);                                                                       
 assume Inc.next[j]  == Inc.null;                                                                   
 assume Inc._lock[j]  == Tid.null;                                                                  
 // inlined: j.init()}                                                                              
 exit$215_top:                                                                                      
                                                                                                    
 // 15.5: Inc this$215;                                                                             
                                                                                                    
                                                                                                    
 // 15.5: this$215 = j;                                                                             
                                                                                                    
 this$215 := j;                                                                                     
                                                                                                    
 // 3.11: assume this$215.next == Inc.null;                                                         
                                                                                                    
 assume (Inc.next[this$215]==Inc.null);                                                             
                                                                                                    
 // 20.1: break exit$215;                                                                           
                                                                                                    
 goto exit$215_bottom;                                                                              
 exit$215_bottom:                                                                                   
                                                                                                    
 // 16.5: i.next := j, j.next := i;                                                                 
                                                                                                    
 assert $pc == PreCommit;                                                                                  // (16.5): Local Write block must appear pre commit.
                                                                                                    
 // 16.5: i.next := j;                                                                              
                                                                                                    
                                                                                                    
 moverPath2389206 := WriteEval.Inc.next(tid: Tid,i: Inc,j: Inc,Inc._state,Inc.next,Inc._lock);      
 mover2389206 := m#moverPath(moverPath2389206);                                                     
 path2389206 := p#moverPath(moverPath2389206);                                                      
 assume Inc._state2389206 == Inc._state && Inc.next2389206 == Inc.next && Inc._lock2389206 == Inc._lock && j2389206 == j && i2389206 == i && this2389206 == this && tid2389206 == tid && $pc2389206 == $pc;
 assume $recorded.state2389206 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume i != Inc.null;                                                                             
 } else {                                                                                           
  assert i != Inc.null;                                                                                    // (16.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2389206);                                                              
 assert $pc != PhaseError;                                                                                 // (16.5): Reduction failure
 assert $pc == PreCommit;                                                                                  // (16.5): Local Write block can only include right-movers.
 Inc.next[i] := j;                                                                                  
                                                                                                    
 // 17.5: j.next := i;                                                                              
                                                                                                    
                                                                                                    
 moverPath2389209 := WriteEval.Inc.next(tid: Tid,j: Inc,i: Inc,Inc._state,Inc.next,Inc._lock);      
 mover2389209 := m#moverPath(moverPath2389209);                                                     
 path2389209 := p#moverPath(moverPath2389209);                                                      
 assume Inc._state2389209 == Inc._state && Inc.next2389209 == Inc.next && Inc._lock2389209 == Inc._lock && j2389209 == j && i2389209 == i && this2389209 == this && tid2389209 == tid && $pc2389209 == $pc;
 assume $recorded.state2389209 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume j != Inc.null;                                                                             
 } else {                                                                                           
  assert j != Inc.null;                                                                                    // (17.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2389209);                                                              
 assert $pc != PhaseError;                                                                                 // (17.5): Reduction failure
 assert $pc == PreCommit;                                                                                  // (17.5): Local Write block can only include right-movers.
 Inc.next[j] := i;                                                                                  
 assert isLocal(Inc._state[j], tid);                                                                       // (16.5): Can only have local designators in Local Write block.
 assert isLocal(Inc._state[i], tid);                                                                       // (17.5): Can only have local designators in Local Write block.
 Inc._state[j] := SHARED();                                                                         
 Inc._state[i] := SHARED();                                                                         
 assert isSharedAssignable(Inc._state[Inc.next[j]]);                                                       // (16.5): j became shared, but j.next may not be shared.
 assert isSharedAssignable(Inc._state[Inc.next[i]]);                                                       // (17.5): i became shared, but i.next may not be shared.
                                                                                                    
 // 13.19: // return;                                                                               
                                                                                                    
 assume Inc._state2389211 == Inc._state && Inc.next2389211 == Inc.next && Inc._lock2389211 == Inc._lock && j2389211 == j && i2389211 == i && this2389211 == this && tid2389211 == tid;
 assume $recorded.state2389211 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Inc._state: [Inc]State,Inc.next: [Inc]Inc,Inc._lock: [Inc]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Inc  :: _i == Inc.null <==> isNull(Inc._state[_i])) &&                                
  (forall _i: Inc ::  (isShared(Inc._state[_i]) ==> isSharedAssignable(Inc._state[Inc.next[_i]]))) &&
  (forall _i: Inc ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Inc._state[_i],_t) ==> isLocalAssignable(Inc._state[Inc.next[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, x: Inc)             
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
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
 var v_post: Inc;                                                                                   
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.next[x] := v;                                                                                  
 assume Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.next(u: Tid,x: Inc,w: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): Inc.next failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, x: Inc)              
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
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
 var v_post: Inc;                                                                                   
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.next[x] := v;                                                                                  
 assume Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Inc.next(u: Tid,x: Inc,Inc._state,Inc.next,Inc._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.3): Inc.next failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, x: Inc)              
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
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
 var v_post: Inc;                                                                                   
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.next[x];                                                                           
 assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Inc.next[x] := havocValue;                                                                         
 assume Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.next(u: Tid,x: Inc,w: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): Inc.next failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, x: Inc)               
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
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
 var v_post: Inc;                                                                                   
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Inc.next[x];                                                                           
 assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Inc.next(u: Tid,x: Inc,Inc._state,Inc.next,Inc._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.3): Inc.next failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, x: Inc)                   
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
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
 var v_post: Inc;                                                                                   
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.next(t: Tid,x: Inc,Inc._state,Inc.next,Inc._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Inc.next(u: Tid,x: Inc,w: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): Inc.next failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, x: Inc)                    
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
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
 var v_post: Inc;                                                                                   
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Inc.next[x];                                                                           
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.next(t: Tid,x: Inc,Inc._state,Inc.next,Inc._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Inc.next[x] := havocValue;                                                                         
 assume Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Inc.next(u: Tid,x: Inc,w: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): Inc.next failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.next.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
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
 var v_post: Inc;                                                                                   
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.next[x] := v;                                                                                  
 assume Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Inc._state,Inc.next,Inc._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): Inc.next is not Write-Write Stable with respect to Inc.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): Inc.next is not Write-Write Stable with respect to Inc.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): Inc.next is not Write-Write Stable with respect to Inc.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.next.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
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
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var v_post: Inc;                                                                                   
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.next[x];                                                                               
 Inc.next[x] := v;                                                                                  
                                                                                                    
 assume Inc._state_mid == Inc._state && Inc.next_mid == Inc.next && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.next[x] := tmpV;                                                                               
 Inc.next[y] := w;                                                                                  
 _writeByTPost := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Inc._state,Inc.next,Inc._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Inc.next is not Write-Write Stable with respect to Inc.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.next.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
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
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc.next_post: [Inc]Inc;                                                                       
 var Inc._state_post: [Inc]State;                                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var v_post: Inc;                                                                                   
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.next[x];                                                                               
 Inc.next[x] := v;                                                                                  
 assume Inc._state_mid == Inc._state && Inc.next_mid == Inc.next && Inc._lock_mid == Inc._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Inc._state,Inc.next,Inc._lock);           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.next[x] := tmpV;                                                                               
 Inc.next[y] := w;                                                                                  
 _writeByTPost := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Inc._state,Inc.next,Inc._lock);           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Inc.next is not Write-Write Stable with respect to Inc.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Inc.next is not Write-Write Stable with respect to Inc.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.next.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
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
 var v_post: Inc;                                                                                   
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.next(t: Tid,x: Inc,Inc._state,Inc.next,Inc._lock);                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.next(u: Tid,y: Inc,w: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.next[y] := w;                                                                                  
 assume Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.next(t: Tid,x: Inc,Inc._state,Inc.next,Inc._lock);                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Inc.next is not Read-Write Stable with respect to Inc.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Inc.next is not Read-Write Stable with respect to Inc.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Inc.next is not Read-Write Stable with respect to Inc.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.next.Inc.next(t: Tid, u: Tid, v: Inc, w: Inc, w0: Inc, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
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
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w_pre: Inc;                                                                                    
 var w0_pre: Inc;                                                                                   
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
 var v_post: Inc;                                                                                   
 var w0_post: Inc;                                                                                  
 var w_post: Inc;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.next(u: Tid,y: Inc,Inc._state,Inc.next,Inc._lock);                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.next(t: Tid,x: Inc,v: Inc,Inc._state,Inc.next,Inc._lock);               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.next[x] := v;                                                                                  
 assume Inc._state_post == Inc._state && Inc.next_post == Inc.next && Inc._lock_post == Inc._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.next(u: Tid,y: Inc,Inc._state,Inc.next,Inc._lock);                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Inc.next is not Write-Read Stable with respect to Inc.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Inc.next is not Write-Read Stable with respect to Inc.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): Inc.next is not Write-Read Stable with respect to Inc.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                           
requires ValidTid(tid);                                                                             
modifies Inc._state;                                                                                
modifies Inc.next;                                                                                  
modifies Inc._lock;                                                                                 
ensures StateInvariant(Inc._state, Inc.next, Inc._lock);                                            
ensures Y(tid , old(Inc._state), old(Inc.next), old(Inc._lock) , Inc._state, Inc.next, Inc._lock);  
                                                                                                    
// Inc.next:                                                                                        
                                                                                                    
function {:inline} Y_Inc.next(tid : Tid, this: Inc, newValue: Inc , Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc.next(tid: Tid,this: Inc,Inc._state,Inc.next,Inc._lock)), _R)) ==> (Inc.next[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.next(tid : Tid, this: Inc, newValue: Inc , Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc.next.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: Inc , Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var tid_yield: Tid;                                                                                 
var Inc.next_yield: [Inc]Inc;                                                                       
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
var newValue_yield: Inc;                                                                            
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc.next(u: Tid,this: Inc,newValue: Inc,Inc._state,Inc.next,Inc._lock)));
                                                                                                    
assume Inc._state_yield == Inc._state && Inc.next_yield == Inc.next && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.next(tid, this, newValue , Inc._state, Inc.next, Inc._lock);                          
}                                                                                                   
                                                                                                    
procedure Y_Inc.next.Reflexive(tid : Tid, this: Inc , Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var tid_yield: Tid;                                                                                 
var Inc.next_yield: [Inc]Inc;                                                                       
var $pc_yield: Phase;                                                                               
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Inc._state_yield == Inc._state && Inc.next_yield == Inc.next && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.next(tid, this, Inc.next[this] , Inc._state, Inc.next, Inc._lock);                    
}                                                                                                   
                                                                                                    
procedure Y_Inc.next.Transitive(tid : Tid, this: Inc, newValue : Inc , Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc._lock: [Inc]Tid , Inc._state_p: [Inc]State, Inc.next_p: [Inc]Inc, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
 requires StateInvariant(Inc._state_p, Inc.next_p, Inc._lock_p);                                    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
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
var tid_post: Tid;                                                                                  
var newValue_post: Inc;                                                                             
var Inc._lock_post: [Inc]Tid;                                                                       
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Inc._state, Inc.next, Inc._lock , Inc._state_p, Inc.next_p, Inc._lock_p);           
 assume Y_Inc.next(tid, this, newValue , Inc._state_p, Inc.next_p, Inc._lock_p);                    
assume Inc._state_post == Inc._state_p && Inc.next_post == Inc.next_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc.next(tid, this, newValue , Inc._state, Inc.next, Inc._lock);                          
}                                                                                                   
// Inc._lock:                                                                                       
                                                                                                    
function {:inline} Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Inc._state,Inc.next,Inc._lock)), _R)) ==> (Inc._lock[this] == newValue))
 &&(((Inc._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc._lock: [Inc]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var tid_yield: Tid;                                                                                 
var Inc.next_yield: [Inc]Inc;                                                                       
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc._lock(u: Tid,this: Inc,newValue: Tid,Inc._state,Inc.next,Inc._lock)));
 assume leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Inc._state,Inc.next,Inc._lock)), _N); 
assume Inc._state_yield == Inc._state && Inc.next_yield == Inc.next && Inc._lock_yield == Inc._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, newValue , Inc._state, Inc.next, Inc._lock);                         
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Reflexive(tid : Tid, this: Inc , Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc._lock: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var tid_yield: Tid;                                                                                 
var Inc.next_yield: [Inc]Inc;                                                                       
var $pc_yield: Phase;                                                                               
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Inc._state_yield == Inc._state && Inc.next_yield == Inc.next && Inc._lock_yield == Inc._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, Inc._lock[this] , Inc._state, Inc.next, Inc._lock);                  
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Transitive(tid : Tid, this: Inc, newValue : Tid , Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc._lock: [Inc]Tid , Inc._state_p: [Inc]State, Inc.next_p: [Inc]Inc, Inc._lock_p: [Inc]Tid)
 requires StateInvariant(Inc._state, Inc.next, Inc._lock);                                          
 requires StateInvariant(Inc._state_p, Inc.next_p, Inc._lock_p);                                    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
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
var tid_post: Tid;                                                                                  
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.next_pre == Inc.next && Inc._lock_pre == Inc._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Inc._state, Inc.next, Inc._lock , Inc._state_p, Inc.next_p, Inc._lock_p);           
 assume Y_Inc._lock(tid, this, newValue , Inc._state_p, Inc.next_p, Inc._lock_p);                   
assume Inc._state_post == Inc._state_p && Inc.next_post == Inc.next_p && Inc._lock_post == Inc._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc._lock(tid, this, newValue , Inc._state, Inc.next, Inc._lock);                         
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Inc._state: [Inc]State, Inc.next: [Inc]Inc, Inc._lock: [Inc]Tid , Inc._state_p: [Inc]State, Inc.next_p: [Inc]Inc, Inc._lock_p: [Inc]Tid): bool
{                                                                                                   
 (forall this: Inc :: Y_Inc.next(tid : Tid, this, Inc.next_p[this] , Inc._state, Inc.next, Inc._lock))
 && (forall this: Inc :: Y_Inc._lock(tid : Tid, this, Inc._lock_p[this] , Inc._state, Inc.next, Inc._lock))
 && (forall _i : Inc :: isShared(Inc._state[_i]) ==> isShared(Inc._state_p[_i]))                    
 && (forall _i : Inc :: isLocal(Inc._state[_i], tid) <==> isLocal(Inc._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 640.1-806.2: (Method:6.3)
// 647.1-647.24: (6.3): Bad tid
// 648.1-648.37: (6.3): this is not global
// 696.2-698.2: (class anchor.sink.VarDeclStmt:7.5)
// 699.2-706.35: (class anchor.sink.Alloc:7.5)
// 709.2-711.2: (class anchor.sink.VarDeclStmt:7.5)
// 712.2-715.16: (class anchor.sink.Assign:7.5)
// 716.2-719.40: (class anchor.sink.Assume:3.11)
// 720.2-723.23: (class anchor.sink.Break:20.1)
// 725.2-727.2: (class anchor.sink.VarDeclStmt:8.5)
// 728.2-735.35: (class anchor.sink.Alloc:8.5)
// 738.2-740.2: (class anchor.sink.VarDeclStmt:8.5)
// 741.2-744.16: (class anchor.sink.Assign:8.5)
// 745.2-748.40: (class anchor.sink.Assume:3.11)
// 749.2-752.23: (class anchor.sink.Break:20.1)
// 755.2-776.2: (class anchor.sink.Write:9.5)
// 767.1-767.24: (9.5): Cannot have potential null deference in left-mover part.
// 770.1-770.27: (9.5): Reduction failure
// 774.1-774.54: (9.5): j became shared, but j.next may not be shared.
// 778.2-799.2: (class anchor.sink.Write:10.5)
// 790.1-790.24: (10.5): Cannot have potential null deference in left-mover part.
// 793.1-793.27: (10.5): Reduction failure
// 797.1-797.54: (10.5): i became shared, but i.next may not be shared.
// 800.2-805.9: (class anchor.sink.Return:6.19)
// 807.1-975.2: (Method:13.3)
// 814.1-814.24: (13.3): Bad tid
// 815.1-815.37: (13.3): this is not global
// 863.2-865.2: (class anchor.sink.VarDeclStmt:14.5)
// 866.2-873.35: (class anchor.sink.Alloc:14.5)
// 876.2-878.2: (class anchor.sink.VarDeclStmt:14.5)
// 879.2-882.16: (class anchor.sink.Assign:14.5)
// 883.2-886.40: (class anchor.sink.Assume:3.11)
// 887.2-890.23: (class anchor.sink.Break:20.1)
// 892.2-894.2: (class anchor.sink.VarDeclStmt:15.5)
// 895.2-902.35: (class anchor.sink.Alloc:15.5)
// 905.2-907.2: (class anchor.sink.VarDeclStmt:15.5)
// 908.2-911.16: (class anchor.sink.Assign:15.5)
// 912.2-915.40: (class anchor.sink.Assume:3.11)
// 916.2-919.23: (class anchor.sink.Break:20.1)
// 921.2-968.53: (class anchor.sink.LocalWrites:16.5)
// 924.1-924.26: (16.5): Local Write block must appear pre commit.
// 925.2-943.19: (class anchor.sink.Write:16.5)
// 937.1-937.24: (16.5): Cannot have potential null deference in left-mover part.
// 941.1-941.27: (16.5): Reduction failure
// 942.1-942.26: (16.5): Local Write block can only include right-movers.
// 944.2-962.19: (class anchor.sink.Write:17.5)
// 956.1-956.24: (17.5): Cannot have potential null deference in left-mover part.
// 960.1-960.27: (17.5): Reduction failure
// 961.1-961.26: (17.5): Local Write block can only include right-movers.
// 963.1-963.37: (16.5): Can only have local designators in Local Write block.
// 964.1-964.37: (17.5): Can only have local designators in Local Write block.
// 967.1-967.53: (16.5): j became shared, but j.next may not be shared.
// 968.1-968.53: (17.5): i became shared, but i.next may not be shared.
// 969.2-974.9: (class anchor.sink.Return:13.19)
// 1051.1-1051.34: (4.3): Inc.next failed Write-Write Right-Mover Check
// 1108.1-1108.30: (4.3): Inc.next failed Write-Read Right-Mover Check
// 1169.1-1169.34: (4.3): Inc.next failed Write-Write Left-Mover Check
// 1227.1-1227.30: (4.3): Inc.next failed Write-Read Left-Mover Check
// 1282.1-1282.34: (4.3): Inc.next failed Read-Write Right-Mover Check
// 1340.1-1340.34: (4.3): Inc.next failed Read-Write Left-Mover Check
// 1409.1-1409.140: (4.3): Inc.next is not Write-Write Stable with respect to Inc.next (case A.1)
// 1410.1-1410.101: (4.3): Inc.next is not Write-Write Stable with respect to Inc.next (case A.2)
// 1411.1-1411.158: (4.3): Inc.next is not Write-Write Stable with respect to Inc.next (case A.3)
// 1504.1-1504.140: (4.3): Inc.next is not Write-Write Stable with respect to Inc.next (case C)
// 1602.1-1602.144: (4.3): Inc.next is not Write-Write Stable with respect to Inc.next (case D)
// 1603.1-1603.144: (4.3): Inc.next is not Write-Write Stable with respect to Inc.next (case R)
// 1672.1-1672.136: (4.3): Inc.next is not Read-Write Stable with respect to Inc.next (case F)
// 1673.1-1673.136: (4.3): Inc.next is not Read-Write Stable with respect to Inc.next (case H)
// 1674.1-1674.146: (4.3): Inc.next is not Read-Write Stable with respect to Inc.next (case I)
// 1742.1-1742.136: (4.3): Inc.next is not Write-Read Stable with respect to Inc.next (case J)
// 1743.1-1743.136: (4.3): Inc.next is not Write-Read Stable with respect to Inc.next (case K)
// 1744.1-1744.99: (4.3): Inc.next is not Write-Read Stable with respect to Inc.next (case L)
// 1775.1-1794.2: (4.3): yields_as clause for Inc.next is not valid
// 1799.1-1813.2: (4.3): yields_as clause for Inc.next is not reflexive
// 1819.1-1847.2: (4.3): yields_as clause for Inc.next is not transitive
// 1867.1-1886.2: (7.32): yields_as clause for Inc._lock is not valid
// 1891.1-1905.2: (7.32): yields_as clause for Inc._lock is not reflexive
// 1911.1-1939.2: (7.32): yields_as clause for Inc._lock is not transitive
