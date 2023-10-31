                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/test3.anchor:                           
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void g() {                                                                                    
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)   {                                                                          
            boolean tmp1;                                                                           
            tmp1 = i < 10;                                                                          
            if (!tmp1) break; else {                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              yield;                                                                                
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void bad() {                                                                           
        acquire(this);                                                                              
        this.g()                                                                                    
        release(this);                                                                              
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void good() {                                                                          
        acquire(this);                                                                              
        this.g()                                                                                    
          invariant holds(this, tid);                                                               
                                                                                                    
        release(this);                                                                              
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void g() {                                                                                    
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)   {                                                                          
            boolean tmp1;                                                                           
            tmp1 = i < 10;                                                                          
            if (!tmp1) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              yield;                                                                                
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void bad() {                                                                           
        acquire(this);                                                                              
        this.g()                                                                                    
        release(this);                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void good() {                                                                          
        acquire(this);                                                                              
        this.g()                                                                                    
          invariant holds(this, tid);                                                               
                                                                                                    
        release(this);                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void g() {                                                                                    
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)   {                                                                          
            boolean tmp1;                                                                           
            tmp1 = i < 10;                                                                          
            if (!tmp1) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              yield;                                                                                
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void bad() {                                                                           
        acquire(this);                                                                              
        {                                                                                           
          inlined this.g();                                                                         
          exit$259: {                                                                               
            Node this$259;                                                                          
            this$259 = this;                                                                        
            {                                                                                       
              {                                                                                     
                int i$259;                                                                          
                i$259 = 0;                                                                          
                while (true)   {                                                                    
                  boolean tmp1$259;                                                                 
                  tmp1$259 = i$259 < 10;                                                            
                  if (!tmp1$259) {                                                                  
                    break;                                                                          
                  } else {                                                                          
                                                                                                    
                  }                                                                                 
                  {                                                                                 
                    yield;                                                                          
                    i$259 = i$259 + 1;                                                              
                  }                                                                                 
                }                                                                                   
              }                                                                                     
              {                                                                                     
                break exit$259;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        release(this);                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void good() {                                                                          
        acquire(this);                                                                              
        {                                                                                           
          inlined this.g()                                                                          
            invariant holds(this, tid);                                                             
          ;                                                                                         
          exit$260: {                                                                               
            Node this$260;                                                                          
            this$260 = this;                                                                        
            {                                                                                       
              {                                                                                     
                int i$260;                                                                          
                i$260 = 0;                                                                          
                while (true)                                                                        
                  invariant holds(this, tid);                                                       
                  {                                                                                 
                  boolean tmp1$260;                                                                 
                  tmp1$260 = i$260 < 10;                                                            
                  if (!tmp1$260) {                                                                  
                    break;                                                                          
                  } else {                                                                          
                                                                                                    
                  }                                                                                 
                  {                                                                                 
                    yield;                                                                          
                    i$260 = i$260 + 1;                                                              
                  }                                                                                 
                }                                                                                   
              }                                                                                     
              {                                                                                     
                break exit$260;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        release(this);                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void g() {                                                                                    
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)   {                                                                          
            boolean tmp1;                                                                           
            tmp1 = i < 10;                                                                          
            if (!tmp1) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              yield;                                                                                
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void bad() {                                                                           
        acquire(this);                                                                              
        {                                                                                           
          inlined this.g();                                                                         
          exit$259: {                                                                               
            Node this$259;                                                                          
            this$259 = this;                                                                        
            {                                                                                       
              {                                                                                     
                int i$259;                                                                          
                i$259 = 0;                                                                          
                while (true)   {                                                                    
                  boolean tmp1$259;                                                                 
                  tmp1$259 = i$259 < 10;                                                            
                  if (!tmp1$259) {                                                                  
                    break;                                                                          
                  } else {                                                                          
                                                                                                    
                  }                                                                                 
                  {                                                                                 
                    yield;                                                                          
                    i$259 = i$259 + 1;                                                              
                  }                                                                                 
                }                                                                                   
              }                                                                                     
              {                                                                                     
                break exit$259;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        release(this);                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void good() {                                                                          
        acquire(this);                                                                              
        {                                                                                           
          inlined this.g()                                                                          
            invariant holds(this, tid);                                                             
          ;                                                                                         
          exit$260: {                                                                               
            Node this$260;                                                                          
            this$260 = this;                                                                        
            {                                                                                       
              {                                                                                     
                int i$260;                                                                          
                i$260 = 0;                                                                          
                while (true)                                                                        
                  invariant holds(this, tid);                                                       
                  {                                                                                 
                  boolean tmp1$260;                                                                 
                  tmp1$260 = i$260 < 10;                                                            
                  if (!tmp1$260) {                                                                  
                    break;                                                                          
                  } else {                                                                          
                                                                                                    
                  }                                                                                 
                  {                                                                                 
                    yield;                                                                          
                    i$260 = i$260 + 1;                                                              
                  }                                                                                 
                }                                                                                   
              }                                                                                     
              {                                                                                     
                break exit$260;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        release(this);                                                                              
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
                                                                                                    
                                                                                                    
/*** Class Decl Node ***/                                                                           
                                                                                                    
type Node;                                                                                          
const unique Node.null: Node;                                                                       
var Node._state: [Node]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Node._lock: [Node]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Node._lock(tid: Tid,this : Node,Node._state: [Node]State,Node._lock: [Node]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Node._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Node._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Node._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node._lock(tid: Tid,this : Node,newValue: Tid,Node._state: [Node]State,Node._lock: [Node]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Node._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Node._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Node._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Node.bad(tid:Tid, this : Node)                                                           
modifies Node._state;                                                                               
modifies Node._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (10.5): Bad tid
requires isShared(Node._state[this]);                                                                      // (10.5): this is not global
                                                                                                    
requires StateInvariant(Node._state, Node._lock);                                                   
                                                                                                    
ensures StateInvariant(Node._state, Node._lock);                                                    
{                                                                                                   
 var $pc4576300: Phase;                                                                             
 var Node._lock4576290: [Node]Tid;                                                                  
 var Node._state4576313: [Node]State;                                                               
 var tid4576300: Tid;                                                                               
 var Node._lock4576290_post: [Node]Tid;                                                             
 var tmp1$2594576290: bool;                                                                         
 var this$2594576290_post: Node;                                                                    
 var $recorded.state4576313: int;                                                                   
 var Node._lock4576313: [Node]Tid;                                                                  
 var Node._lock4576300_bottom: [Node]Tid;                                                           
 var $pc4576290: Phase;                                                                             
 var tmp1$2594576290_post: bool;                                                                    
 var this4576300: Node;                                                                             
 var tmp1$259: bool;                                                                                
 var this4576300_bottom: Node;                                                                      
 var i$2594576290: int;                                                                             
 var $recorded.state4576290: int;                                                                   
 var Node._lock4576300: [Node]Tid;                                                                  
 var tid4576313: Tid;                                                                               
 var $recorded.state4576290_post: int;                                                              
 var $pc4576313: Phase;                                                                             
 var tid4576290: Tid;                                                                               
 var this$259: Node;                                                                                
 var i$2594576290_post: int;                                                                        
 var this4576290_post: Node;                                                                        
 var Node._state4576300_bottom: [Node]State;                                                        
 var $recorded.state4576300: int;                                                                   
 var Node._state4576300: [Node]State;                                                               
 var tid4576290_post: Tid;                                                                          
 var $recorded.state4576300_bottom: int;                                                            
 var Node._state4576290_post: [Node]State;                                                          
 var Node._state4576290: [Node]State;                                                               
 var this4576290: Node;                                                                             
 var tid4576300_bottom: Tid;                                                                        
 var i$2594576300: int;                                                                             
 var $pc4576300_bottom: Phase;                                                                      
 var i$2594576300_bottom: int;                                                                      
 var this4576313: Node;                                                                             
 var i$259: int;                                                                                    
 var this$2594576300_bottom: Node;                                                                  
 var phase4576300: Phase;                                                                           
 var $pc4576290_post: Phase;                                                                        
 var this$2594576300: Node;                                                                         
 var this$2594576290: Node;                                                                         
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Node.null;                                                                         
 } else {                                                                                           
  assert this != Node.null;                                                                                // (11.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Node._lock[this] == Tid.null;                                                               
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (11.7): Reduction failure
 Node._lock[this] := tid;                                                                           
 // inlined: this.g()}                                                                              
 exit$259_top:                                                                                      
                                                                                                    
 // 12.7: Node this$259;                                                                            
                                                                                                    
                                                                                                    
 // 12.7: this$259 = this;                                                                          
                                                                                                    
 this$259 := this;                                                                                  
                                                                                                    
 // 5.12: int i$259;                                                                                
                                                                                                    
                                                                                                    
 // 5.12: i$259 = 0;                                                                                
                                                                                                    
 i$259 := 0;                                                                                        
 assume Node._state4576300 == Node._state && Node._lock4576300 == Node._lock && i$2594576300 == i$259 && this$2594576300 == this$259 && this4576300 == this && tid4576300 == tid;
 assume $recorded.state4576300 == 1;                                                                
                                                                                                    
 // 5.25: while (true)   {                                                                          
                                                                                                    
 phase4576300 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (10.5): Bad tid
  invariant isShared(Node._state[this]);                                                                   // (10.5): this is not global
                                                                                                    
  invariant StateInvariant(Node._state, Node._lock);                                                
  invariant phase4576300 == $pc;                                                                           // (5.25): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (5.25): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 5.25: boolean tmp1$259;                                                                        
                                                                                                    
                                                                                                    
  // 5.25: tmp1$259 = i$259 < 10;                                                                   
                                                                                                    
  tmp1$259 := (i$259<10);                                                                           
  if (!(tmp1$259)) {                                                                                
                                                                                                    
   // 5.25: break;                                                                                  
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 6.9: yield;                                                                                    
                                                                                                    
  assume Node._state4576290 == Node._state && Node._lock4576290 == Node._lock && tmp1$2594576290 == tmp1$259 && i$2594576290 == i$259 && this$2594576290 == this$259 && this4576290 == this && tid4576290 == tid;
  assume $recorded.state4576290 == 1;                                                               
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume Node._state4576290_post == Node._state && Node._lock4576290_post == Node._lock && tmp1$2594576290_post == tmp1$259 && i$2594576290_post == i$259 && this$2594576290_post == this$259 && this4576290_post == this && tid4576290_post == tid;
  assume $recorded.state4576290_post == 1;                                                          
                                                                                                    
  // 5.31: i$259 = i$259 + 1;                                                                       
                                                                                                    
  i$259 := (i$259+1);                                                                               
  assume Node._state4576300_bottom == Node._state && Node._lock4576300_bottom == Node._lock && i$2594576300_bottom == i$259 && this$2594576300_bottom == this$259 && this4576300_bottom == this && tid4576300_bottom == tid;
  assume $recorded.state4576300_bottom == 1;                                                        
  assert phase4576300 == $pc;                                                                              // (5.25): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 4.14: break exit$259;                                                                           
                                                                                                    
 goto exit$259_bottom;                                                                              
 exit$259_bottom:                                                                                   
 if ($pc == PreCommit) {                                                                            
  assume this != Node.null;                                                                         
 } else {                                                                                           
  assert this != Node.null;                                                                                // (13.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Node._lock[this] == tid;                                                                           // (13.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (13.7): Reduction failure
 Node._lock[this] := Tid.null;                                                                      
                                                                                                    
 // 10.23: // return;                                                                               
                                                                                                    
 assume Node._state4576313 == Node._state && Node._lock4576313 == Node._lock && this4576313 == this && tid4576313 == tid;
 assume $recorded.state4576313 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Node.good(tid:Tid, this : Node)                                                          
modifies Node._state;                                                                               
modifies Node._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (16.5): Bad tid
requires isShared(Node._state[this]);                                                                      // (16.5): this is not global
                                                                                                    
requires StateInvariant(Node._state, Node._lock);                                                   
                                                                                                    
ensures StateInvariant(Node._state, Node._lock);                                                    
{                                                                                                   
 var Node._state4576355_post: [Node]State;                                                          
 var this4576355: Node;                                                                             
 var tid4576355_post: Tid;                                                                          
 var $pc4576355: Phase;                                                                             
 var Node._state4576355: [Node]State;                                                               
 var $recorded.state4576355_post: int;                                                              
 var Node._state4576381: [Node]State;                                                               
 var Node._lock4576355: [Node]Tid;                                                                  
 var i$2604576365_bottom: int;                                                                      
 var tmp1$260: bool;                                                                                
 var Node._lock4576365_bottom: [Node]Tid;                                                           
 var i$2604576355: int;                                                                             
 var Node._lock4576381: [Node]Tid;                                                                  
 var this$2604576355: Node;                                                                         
 var Node._state4576365_bottom: [Node]State;                                                        
 var this4576355_post: Node;                                                                        
 var this4576381: Node;                                                                             
 var $recorded.state4576365_bottom: int;                                                            
 var $pc4576381: Phase;                                                                             
 var this4576365: Node;                                                                             
 var this$2604576355_post: Node;                                                                    
 var tid4576381: Tid;                                                                               
 var this$2604576365: Node;                                                                         
 var $recorded.state4576365: int;                                                                   
 var i$2604576365: int;                                                                             
 var Node._state4576365: [Node]State;                                                               
 var $pc4576365: Phase;                                                                             
 var $pc4576365_bottom: Phase;                                                                      
 var $recorded.state4576381: int;                                                                   
 var this$2604576365_bottom: Node;                                                                  
 var tid4576365_bottom: Tid;                                                                        
 var i$260: int;                                                                                    
 var tmp1$2604576355_post: bool;                                                                    
 var this$260: Node;                                                                                
 var tid4576365: Tid;                                                                               
 var this4576365_bottom: Node;                                                                      
 var Node._lock4576365: [Node]Tid;                                                                  
 var tmp1$2604576355: bool;                                                                         
 var tid4576355: Tid;                                                                               
 var $recorded.state4576355: int;                                                                   
 var Node._lock4576355_post: [Node]Tid;                                                             
 var phase4576365: Phase;                                                                           
 var $pc4576355_post: Phase;                                                                        
 var i$2604576355_post: int;                                                                        
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Node.null;                                                                         
 } else {                                                                                           
  assert this != Node.null;                                                                                // (17.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Node._lock[this] == Tid.null;                                                               
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (17.7): Reduction failure
 Node._lock[this] := tid;                                                                           
 // inlined: this.g()}                                                                              
 exit$260_top:                                                                                      
                                                                                                    
 // 18.7: Node this$260;                                                                            
                                                                                                    
                                                                                                    
 // 18.7: this$260 = this;                                                                          
                                                                                                    
 this$260 := this;                                                                                  
                                                                                                    
 // 5.12: int i$260;                                                                                
                                                                                                    
                                                                                                    
 // 5.12: i$260 = 0;                                                                                
                                                                                                    
 i$260 := 0;                                                                                        
 assume Node._state4576365 == Node._state && Node._lock4576365 == Node._lock && i$2604576365 == i$260 && this$2604576365 == this$260 && this4576365 == this && tid4576365 == tid;
 assume $recorded.state4576365 == 1;                                                                
                                                                                                    
 // 5.25: while (true)                                                                              
                                                                                                    
 phase4576365 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (16.5): Bad tid
  invariant isShared(Node._state[this]);                                                                   // (16.5): this is not global
                                                                                                    
  invariant StateInvariant(Node._state, Node._lock);                                                
  invariant (isAccessible(Node._state[this], tid) && Node._lock[this] == tid);                      
  invariant phase4576365 == $pc;                                                                           // (5.25): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (5.25): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 5.25: boolean tmp1$260;                                                                        
                                                                                                    
                                                                                                    
  // 5.25: tmp1$260 = i$260 < 10;                                                                   
                                                                                                    
  tmp1$260 := (i$260<10);                                                                           
  if (!(tmp1$260)) {                                                                                
                                                                                                    
   // 5.25: break;                                                                                  
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 6.9: yield;                                                                                    
                                                                                                    
  assume Node._state4576355 == Node._state && Node._lock4576355 == Node._lock && tmp1$2604576355 == tmp1$260 && i$2604576355 == i$260 && this$2604576355 == this$260 && this4576355 == this && tid4576355 == tid;
  assume $recorded.state4576355 == 1;                                                               
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume Node._state4576355_post == Node._state && Node._lock4576355_post == Node._lock && tmp1$2604576355_post == tmp1$260 && i$2604576355_post == i$260 && this$2604576355_post == this$260 && this4576355_post == this && tid4576355_post == tid;
  assume $recorded.state4576355_post == 1;                                                          
                                                                                                    
  // 5.31: i$260 = i$260 + 1;                                                                       
                                                                                                    
  i$260 := (i$260+1);                                                                               
  assume Node._state4576365_bottom == Node._state && Node._lock4576365_bottom == Node._lock && i$2604576365_bottom == i$260 && this$2604576365_bottom == this$260 && this4576365_bottom == this && tid4576365_bottom == tid;
  assume $recorded.state4576365_bottom == 1;                                                        
  assert phase4576365 == $pc;                                                                              // (5.25): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 4.14: break exit$260;                                                                           
                                                                                                    
 goto exit$260_bottom;                                                                              
 exit$260_bottom:                                                                                   
 if ($pc == PreCommit) {                                                                            
  assume this != Node.null;                                                                         
 } else {                                                                                           
  assert this != Node.null;                                                                                // (19.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Node._lock[this] == tid;                                                                           // (19.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (19.7): Reduction failure
 Node._lock[this] := Tid.null;                                                                      
                                                                                                    
 // 16.24: // return;                                                                               
                                                                                                    
 assume Node._state4576381 == Node._state && Node._lock4576381 == Node._lock && this4576381 == this && tid4576381 == tid;
 assume $recorded.state4576381 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Node._state: [Node]State,Node._lock: [Node]Tid) returns (bool) { 
  true &&                                                                                           
  (forall _i: Node  :: _i == Node.null <==> isNull(Node._state[_i])) &&                             
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Node._state, Node._lock);                                                   
requires ValidTid(tid);                                                                             
modifies Node._state;                                                                               
modifies Node._lock;                                                                                
ensures StateInvariant(Node._state, Node._lock);                                                    
ensures Y(tid , old(Node._state), old(Node._lock) , Node._state, Node._lock);                       
                                                                                                    
// Node._lock:                                                                                      
                                                                                                    
function {:inline} Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node._lock: [Node]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node._lock)), _R)) ==> (Node._lock[this] == newValue))
 &&(((Node._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node._lock: [Node]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node._lock: [Node]Tid)
 requires StateInvariant(Node._state, Node._lock);                                                  
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: Node;                                                                               
var newValue_yield: Tid;                                                                            
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node._lock(u: Tid,this: Node,newValue: Tid,Node._state,Node._lock)));
 assume leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node._lock)), _N);      
assume Node._state_yield == Node._state && Node._lock_yield == Node._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, newValue , Node._state, Node._lock);                                
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node._lock: [Node]Tid)
 requires StateInvariant(Node._state, Node._lock);                                                  
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: Node;                                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node._lock_yield == Node._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, Node._lock[this] , Node._state, Node._lock);                        
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Transitive(tid : Tid, this: Node, newValue : Tid , Node._state: [Node]State, Node._lock: [Node]Tid , Node._state_p: [Node]State, Node._lock_p: [Node]Tid)
 requires StateInvariant(Node._state, Node._lock);                                                  
 requires StateInvariant(Node._state_p, Node._lock_p);                                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Node._state_post: [Node]State;                                                                  
var this_post: Node;                                                                                
var newValue_post: Tid;                                                                             
                                                                                                    
assume Node._state_pre == Node._state && Node._lock_pre == Node._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node._lock , Node._state_p, Node._lock_p);                             
 assume Y_Node._lock(tid, this, newValue , Node._state_p, Node._lock_p);                            
assume Node._state_post == Node._state_p && Node._lock_post == Node._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node._lock(tid, this, newValue , Node._state, Node._lock);                                
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Node._state: [Node]State, Node._lock: [Node]Tid , Node._state_p: [Node]State, Node._lock_p: [Node]Tid): bool
{                                                                                                   
 (forall this: Node :: Y_Node._lock(tid : Tid, this, Node._lock_p[this] , Node._state, Node._lock)) 
 && (forall _i : Node :: isShared(Node._state[_i]) ==> isShared(Node._state_p[_i]))                 
 && (forall _i : Node :: isLocal(Node._state[_i], tid) <==> isLocal(Node._state_p[_i], tid))        
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 646.1-799.2: (Method:10.5)
// 652.1-652.24: (10.5): Bad tid
// 653.1-653.38: (10.5): this is not global
// 711.1-711.28: (11.7): Cannot have potential null deference in left-mover part.
// 715.1-715.27: (11.7): Reduction failure
// 719.2-721.2: (class anchor.sink.VarDeclStmt:12.7)
// 722.2-725.19: (class anchor.sink.Assign:12.7)
// 726.2-728.2: (class anchor.sink.VarDeclStmt:5.12)
// 729.2-732.13: (class anchor.sink.Assign:5.12)
// 735.2-739.14: (class anchor.sink.While:5.25)
// 741.1-741.27: (10.5): Bad tid
// 742.1-742.41: (10.5): this is not global
// 745.1-745.33: (5.25): Phase must be invariant at loop head
// 746.1-746.30: (5.25): Potentially infinite loop cannot be in post-commit phase.
// 748.3-750.3: (class anchor.sink.VarDeclStmt:5.25)
// 751.3-754.26: (class anchor.sink.Assign:5.25)
// 756.4-759.10: (class anchor.sink.Break:5.25)
// 762.3-770.43: (class anchor.sink.Yield:6.9)
// 771.3-774.22: (class anchor.sink.Assign:5.31)
// 777.1-777.30: (5.25): Phase must be invariant at loop head
// 779.2-782.23: (class anchor.sink.Break:4.14)
// 787.1-787.28: (13.7): Cannot have potential null deference in left-mover part.
// 789.1-789.33: (13.7): lock not held
// 791.1-791.27: (13.7): Reduction failure
// 793.2-798.9: (class anchor.sink.Return:10.23)
// 800.1-954.2: (Method:16.5)
// 806.1-806.24: (16.5): Bad tid
// 807.1-807.38: (16.5): this is not global
// 865.1-865.28: (17.7): Cannot have potential null deference in left-mover part.
// 869.1-869.27: (17.7): Reduction failure
// 873.2-875.2: (class anchor.sink.VarDeclStmt:18.7)
// 876.2-879.19: (class anchor.sink.Assign:18.7)
// 880.2-882.2: (class anchor.sink.VarDeclStmt:5.12)
// 883.2-886.13: (class anchor.sink.Assign:5.12)
// 889.2-893.14: (class anchor.sink.While:5.25)
// 895.1-895.27: (16.5): Bad tid
// 896.1-896.41: (16.5): this is not global
// 898.53-899.79: (5.25): invariant holds(this, tid) may not hold
// 900.1-900.33: (5.25): Phase must be invariant at loop head
// 901.1-901.30: (5.25): Potentially infinite loop cannot be in post-commit phase.
// 903.3-905.3: (class anchor.sink.VarDeclStmt:5.25)
// 906.3-909.26: (class anchor.sink.Assign:5.25)
// 911.4-914.10: (class anchor.sink.Break:5.25)
// 917.3-925.43: (class anchor.sink.Yield:6.9)
// 926.3-929.22: (class anchor.sink.Assign:5.31)
// 932.1-932.30: (5.25): Phase must be invariant at loop head
// 934.2-937.23: (class anchor.sink.Break:4.14)
// 942.1-942.28: (19.7): Cannot have potential null deference in left-mover part.
// 944.1-944.33: (19.7): lock not held
// 946.1-946.27: (19.7): Reduction failure
// 948.2-953.9: (class anchor.sink.Return:16.24)
// 1001.1-1019.2: (7.32): yields_as clause for Node._lock is not valid
// 1024.1-1037.2: (7.32): yields_as clause for Node._lock is not reflexive
// 1043.1-1069.2: (7.32): yields_as clause for Node._lock is not transitive
