                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/stack-spec.anchor:                      
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       Node next isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.next == Node.null;                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Stack {                                                                                   
       Node head holds(this, tid) ? B : E                                                           
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.head == Node.null;                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures old(this.head) != Node.null;                                                        
      }                                                                                             
      public int pop2() {                                                                           
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          tmp1 = true;                                                                              
          if (!tmp1) break; else {                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            acquire(this);                                                                          
            boolean tmp2;                                                                           
            Node tmp3;                                                                              
            tmp3 := this.head;                                                                      
            tmp2 = tmp3 != Node.null;                                                               
            if (tmp2 /* == this.head != Node.null */) {                                             
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            release(this);                                                                          
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        Node tmp4;                                                                                  
        Node tmp5;                                                                                  
        tmp5 := this.head;                                                                          
        tmp4 := tmp5.next;                                                                          
        this.head := tmp4;                                                                          
        release(this);                                                                              
        // return -1;                                                                               
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       Node next isLocal(this, tid)                                                                 
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
        assume this.next == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Stack {                                                                                   
       Node head holds(this, tid) ? B : E                                                           
                                                                                                    
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
        assume this.head == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures old(this.head) != Node.null;                                                        
      }                                                                                             
      public int pop2() {                                                                           
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          tmp1 = true;                                                                              
          if (!tmp1) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            acquire(this);                                                                          
            boolean tmp2;                                                                           
            Node tmp3;                                                                              
            tmp3 := this.head;                                                                      
            tmp2 = tmp3 != Node.null;                                                               
            if (tmp2 /* == this.head != Node.null */) {                                             
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            release(this);                                                                          
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        Node tmp4;                                                                                  
        Node tmp5;                                                                                  
        tmp5 := this.head;                                                                          
        tmp4 := tmp5.next;                                                                          
        this.head := tmp4;                                                                          
        release(this);                                                                              
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       Node next isLocal(this, tid)                                                                 
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
        assume this.next == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Stack {                                                                                   
       Node head holds(this, tid) ? B : E                                                           
                                                                                                    
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
        assume this.head == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures old(this.head) != Node.null;                                                        
      }                                                                                             
      public int pop2() {                                                                           
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          tmp1 = true;                                                                              
          if (!tmp1) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            acquire(this);                                                                          
            boolean tmp2;                                                                           
            Node tmp3;                                                                              
            tmp3 := this.head;                                                                      
            tmp2 = tmp3 != Node.null;                                                               
            if (tmp2 /* == this.head != Node.null */) {                                             
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            release(this);                                                                          
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        Node tmp4;                                                                                  
        Node tmp5;                                                                                  
        tmp5 := this.head;                                                                          
        tmp4 := tmp5.next;                                                                          
        this.head := tmp4;                                                                          
        release(this);                                                                              
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       Node next isLocal(this, tid)                                                                 
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
        assume this.next == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Stack {                                                                                   
       Node head holds(this, tid) ? B : E                                                           
                                                                                                    
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
        assume this.head == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures old(this.head) != Node.null;                                                        
      }                                                                                             
      public int pop2() {                                                                           
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          tmp1 = true;                                                                              
          if (!tmp1) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            acquire(this);                                                                          
            boolean tmp2;                                                                           
            Node tmp3;                                                                              
            tmp3 := this.head;                                                                      
            tmp2 = tmp3 != Node.null;                                                               
            if (tmp2 /* == this.head != Node.null */) {                                             
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            release(this);                                                                          
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        Node tmp4;                                                                                  
        Node tmp5;                                                                                  
        tmp5 := this.head;                                                                          
        tmp4 := tmp5.next;                                                                          
        this.head := tmp4;                                                                          
        release(this);                                                                              
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
                                                                                                    
                                                                                                    
/*** Class Decl Node ***/                                                                           
                                                                                                    
type Node;                                                                                          
const unique Node.null: Node;                                                                       
var Node._state: [Node]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Node.next: [Node]Node;                                                                          
                                                                                                    
function {:inline} ReadEval.Node.next(tid: Tid,this : Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Node.null;                                                                        
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isLocal(Node._state[this], tid)) then                                                         
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
                                                                                                    
function {:inline} WriteEval.Node.next(tid: Tid,this : Node,newValue: Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isLocal(Node._state[this], tid)) then                                                         
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
                                                                                                    
var Node._lock: [Node]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Node._lock(tid: Tid,this : Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Node._lock(tid: Tid,this : Node,newValue: Tid,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl Stack ***/                                                                          
                                                                                                    
type Stack;                                                                                         
const unique Stack.null: Stack;                                                                     
var Stack._state: [Stack]State;                                                                     
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Stack.head: [Stack]Node;                                                                        
                                                                                                    
function {:inline} ReadEval.Stack.head(tid: Tid,this : Stack,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Node.null;                                                                        
 if ((isAccessible(Stack._state[this], tid) && Stack._lock[this] == tid)) then                      
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Stack.head(tid: Tid,this : Stack,newValue: Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(Stack._state[this], tid) && Stack._lock[this] == tid)) then                      
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Stack._lock: [Stack]Tid;                                                                        
                                                                                                    
function {:inline} ReadEval.Stack._lock(tid: Tid,this : Stack,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Stack._state[this], tid)) then                                                         
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Stack._lock[this]==tid)) then                                                               
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Stack._lock[this]==Tid.null)&&(newValue==tid))) then                                       
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Stack._lock[this]==tid)&&(newValue==Tid.null))) then                                      
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Stack._lock(tid: Tid,this : Stack,newValue: Tid,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Stack._state[this], tid)) then                                                         
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Stack._lock[this]==tid)) then                                                               
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Stack._lock[this]==Tid.null)&&(newValue==tid))) then                                       
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Stack._lock[this]==tid)&&(newValue==Tid.null))) then                                      
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Stack.pop2(tid:Tid, this : Stack)                                                        
returns ($result : int)                                                                             
modifies Node._state;                                                                               
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
modifies Stack._state;                                                                              
modifies Stack.head;                                                                                
modifies Stack._lock;                                                                               
                                                                                                    
requires ValidTid(tid);                                                                                    // (10.3): Bad tid
requires isShared(Stack._state[this]);                                                                     // (10.3): this is not global
                                                                                                    
requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock); 
                                                                                                    
ensures StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);  
{                                                                                                   
 var tmp3: Node;                                                                                    
 var Node._lock4415344: [Node]Tid;                                                                  
 var $result4415347_bottom: int;                                                                    
 var Stack._lock4415367: [Stack]Tid;                                                                
 var Stack.head4415356: [Stack]Node;                                                                
 var Stack._lock4415328: [Stack]Tid;                                                                
 var Stack._lock4415344_post: [Stack]Tid;                                                           
 var mover4415356: Mover;                                                                           
 var Stack._state4415359: [Stack]State;                                                             
 var Node._state4415362: [Node]State;                                                               
 var $pc4415362: Phase;                                                                             
 var Stack._lock4415347_bottom: [Stack]Tid;                                                         
 var Node.next4415344_post: [Node]Node;                                                             
 var path4415328: int;                                                                              
 var $result4415356: int;                                                                           
 var tmp4: Node;                                                                                    
 var $pc4415347_bottom: Phase;                                                                      
 var tmp44415356: Node;                                                                             
 var Node._state4415344: [Node]State;                                                               
 var $pc4415347: Phase;                                                                             
 var $result4415347: int;                                                                           
 var path4415356: int;                                                                              
 var this4415362: Stack;                                                                            
 var $recorded.state4415328: int;                                                                   
 var this4415347: Stack;                                                                            
 var $recorded.state4415356: int;                                                                   
 var Node._lock4415344_post: [Node]Tid;                                                             
 var tmp1: bool;                                                                                    
 var tmp34415344_post: Node;                                                                        
 var mover4415359: Mover;                                                                           
 var tid4415359: Tid;                                                                               
 var Stack.head4415347: [Stack]Node;                                                                
 var Node._lock4415362: [Node]Tid;                                                                  
 var tid4415347_bottom: Tid;                                                                        
 var this4415356: Stack;                                                                            
 var tmp2: bool;                                                                                    
 var mover4415362: Mover;                                                                           
 var Stack._state4415328: [Stack]State;                                                             
 var $result4415344_post: int;                                                                      
 var $recorded.state4415347_bottom: int;                                                            
 var $pc4415356: Phase;                                                                             
 var moverPath4415328: MoverPath;                                                                   
 var Node.next4415344: [Node]Node;                                                                  
 var $recorded.state4415344_post: int;                                                              
 var this4415328: Stack;                                                                            
 var tid4415347: Tid;                                                                               
 var Node.next4415347: [Node]Node;                                                                  
 var Node._state4415347_bottom: [Node]State;                                                        
 var $pc4415344_post: Phase;                                                                        
 var Node._state4415344_post: [Node]State;                                                          
 var tmp34415328: Node;                                                                             
 var $result4415367: int;                                                                           
 var tmp14415328: bool;                                                                             
 var tid4415344_post: Tid;                                                                          
 var tid4415362: Tid;                                                                               
 var $result4415328: int;                                                                           
 var Stack.head4415344_post: [Stack]Node;                                                           
 var moverPath4415356: MoverPath;                                                                   
 var Node._state4415367: [Node]State;                                                               
 var Stack._lock4415362: [Stack]Tid;                                                                
 var Stack._state4415362: [Stack]State;                                                             
 var tid4415356: Tid;                                                                               
 var tmp44415367: Node;                                                                             
 var $pc4415328: Phase;                                                                             
 var tmp54415362: Node;                                                                             
 var tmp24415344_post: bool;                                                                        
 var Stack._state4415367: [Stack]State;                                                             
 var this4415347_bottom: Stack;                                                                     
 var $recorded.state4415359: int;                                                                   
 var Node.next4415328: [Node]Node;                                                                  
 var $recorded.state4415362: int;                                                                   
 var Node._lock4415367: [Node]Tid;                                                                  
 var Node.next4415359: [Node]Node;                                                                  
 var Stack._lock4415359: [Stack]Tid;                                                                
 var Node.next4415347_bottom: [Node]Node;                                                           
 var tmp54415367: Node;                                                                             
 var $pc4415344: Phase;                                                                             
 var Node.next4415367: [Node]Node;                                                                  
 var tmp54415359: Node;                                                                             
 var Node._lock4415347_bottom: [Node]Tid;                                                           
 var Node._state4415356: [Node]State;                                                               
 var Node._lock4415347: [Node]Tid;                                                                  
 var tmp5: Node;                                                                                    
 var Stack.head4415359: [Stack]Node;                                                                
 var moverPath4415359: MoverPath;                                                                   
 var Node._lock4415328: [Node]Tid;                                                                  
 var Stack.head4415362: [Stack]Node;                                                                
 var Stack._lock4415356: [Stack]Tid;                                                                
 var path4415362: int;                                                                              
 var Node.next4415356: [Node]Node;                                                                  
 var Stack._state4415347_bottom: [Stack]State;                                                      
 var $recorded.state4415344: int;                                                                   
 var this4415344_post: Stack;                                                                       
 var Stack.head4415344: [Stack]Node;                                                                
 var tid4415344: Tid;                                                                               
 var tmp24415328: bool;                                                                             
 var tmp24415344: bool;                                                                             
 var tid4415328: Tid;                                                                               
 var Node._state4415359: [Node]State;                                                               
 var Stack._state4415356: [Stack]State;                                                             
 var Stack.head4415328: [Stack]Node;                                                                
 var $result4415344: int;                                                                           
 var tid4415367: Tid;                                                                               
 var tmp14415344: bool;                                                                             
 var Stack._lock4415344: [Stack]Tid;                                                                
 var Stack.head4415347_bottom: [Stack]Node;                                                         
 var $recorded.state4415367: int;                                                                   
 var Node._lock4415359: [Node]Tid;                                                                  
 var Node._lock4415356: [Node]Tid;                                                                  
 var $result4415359: int;                                                                           
 var Node.next4415362: [Node]Node;                                                                  
 var this4415344: Stack;                                                                            
 var this4415359: Stack;                                                                            
 var phase4415347: Phase;                                                                           
 var moverPath4415362: MoverPath;                                                                   
 var this4415367: Stack;                                                                            
 var tmp54415356: Node;                                                                             
 var Node._state4415328: [Node]State;                                                               
 var Stack._lock4415347: [Stack]Tid;                                                                
 var $recorded.state4415347: int;                                                                   
 var Stack._state4415344: [Stack]State;                                                             
 var $pc4415367: Phase;                                                                             
 var Stack.head4415367: [Stack]Node;                                                                
 var $result4415362: int;                                                                           
 var mover4415328: Mover;                                                                           
 var Stack._state4415347: [Stack]State;                                                             
 var Stack._state4415344_post: [Stack]State;                                                        
 var tmp14415344_post: bool;                                                                        
 var Node._state4415347: [Node]State;                                                               
 var $pc4415359: Phase;                                                                             
 var tmp34415344: Node;                                                                             
 var tmp44415362: Node;                                                                             
 var tmp44415359: Node;                                                                             
 var path4415359: int;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state4415347 == Node._state && Node.next4415347 == Node.next && Node._lock4415347 == Node._lock && Stack._state4415347 == Stack._state && Stack.head4415347 == Stack.head && Stack._lock4415347 == Stack._lock && $result4415347 == $result && this4415347 == this && tid4415347 == tid;
 assume $recorded.state4415347 == 1;                                                                
                                                                                                    
 // 12.5: while (true)   {                                                                          
                                                                                                    
 phase4415347 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (10.3): Bad tid
  invariant isShared(Stack._state[this]);                                                                  // (10.3): this is not global
                                                                                                    
  invariant StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
  invariant (forall _this : Node :: Invariant.Y_Node.next(tid : Tid, _this, Node.next[_this] ,Node._state4415347,Node.next4415347,Node._lock4415347,Stack._state4415347,Stack.head4415347,Stack._lock4415347));       // (12.5): Loop does not preserve yields_as annotation for field next
  invariant (forall _this : Stack :: Invariant.Y_Stack.head(tid : Tid, _this, Stack.head[_this] ,Node._state4415347,Node.next4415347,Node._lock4415347,Stack._state4415347,Stack.head4415347,Stack._lock4415347));       // (12.5): Loop does not preserve yields_as annotation for field head
  invariant phase4415347 == $pc;                                                                           // (12.5): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (12.5): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 12.11: boolean tmp1;                                                                           
                                                                                                    
                                                                                                    
  // 12.11: tmp1 = true;                                                                            
                                                                                                    
  tmp1 := true;                                                                                     
  if (!(tmp1)) {                                                                                    
                                                                                                    
   // 12.5: break;                                                                                  
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume this != Stack.null;                                                                       
  } else {                                                                                          
   assert this != Stack.null;                                                                              // (13.7): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume Stack._lock[this] == Tid.null;                                                             
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (13.7): Reduction failure
  Stack._lock[this] := tid;                                                                         
                                                                                                    
  // 14.7: boolean tmp2;                                                                            
                                                                                                    
                                                                                                    
  // 14.7: Node tmp3;                                                                               
                                                                                                    
                                                                                                    
  // 14.7: tmp3 := this.head;                                                                       
                                                                                                    
                                                                                                    
  moverPath4415328 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
  mover4415328 := m#moverPath(moverPath4415328);                                                    
  path4415328 := p#moverPath(moverPath4415328);                                                     
  assume Node._state4415328 == Node._state && Node.next4415328 == Node.next && Node._lock4415328 == Node._lock && Stack._state4415328 == Stack._state && Stack.head4415328 == Stack.head && Stack._lock4415328 == Stack._lock && tmp34415328 == tmp3 && tmp24415328 == tmp2 && tmp14415328 == tmp1 && $result4415328 == $result && this4415328 == this && tid4415328 == tid && $pc4415328 == $pc;
  assume $recorded.state4415328 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != Stack.null;                                                                       
  } else {                                                                                          
   assert this != Stack.null;                                                                              // (14.7): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover4415328);                                                             
  assert $pc != PhaseError;                                                                                // (14.7): Reduction failure
  tmp3 := Stack.head[this];                                                                         
                                                                                                    
  // 14.7: tmp2 = tmp3 != Node.null;                                                                
                                                                                                    
  tmp2 := (tmp3!=Node.null);                                                                        
  if (tmp2 /* lowered (Stack.head[this]!=Node.null) */) {                                           
                                                                                                    
   // 15.9: break;                                                                                  
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume this != Stack.null;                                                                       
  } else {                                                                                          
   assert this != Stack.null;                                                                              // (17.7): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Stack._lock[this] == tid;                                                                         // (17.7): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (17.7): Reduction failure
  Stack._lock[this] := Tid.null;                                                                    
                                                                                                    
  // 18.7: yield;                                                                                   
                                                                                                    
  assume Node._state4415344 == Node._state && Node.next4415344 == Node.next && Node._lock4415344 == Node._lock && Stack._state4415344 == Stack._state && Stack.head4415344 == Stack.head && Stack._lock4415344 == Stack._lock && tmp34415344 == tmp3 && tmp24415344 == tmp2 && tmp14415344 == tmp1 && $result4415344 == $result && this4415344 == this && tid4415344 == tid;
  assume $recorded.state4415344 == 1;                                                               
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume Node._state4415344_post == Node._state && Node.next4415344_post == Node.next && Node._lock4415344_post == Node._lock && Stack._state4415344_post == Stack._state && Stack.head4415344_post == Stack.head && Stack._lock4415344_post == Stack._lock && tmp34415344_post == tmp3 && tmp24415344_post == tmp2 && tmp14415344_post == tmp1 && $result4415344_post == $result && this4415344_post == this && tid4415344_post == tid;
  assume $recorded.state4415344_post == 1;                                                          
  assume Node._state4415347_bottom == Node._state && Node.next4415347_bottom == Node.next && Node._lock4415347_bottom == Node._lock && Stack._state4415347_bottom == Stack._state && Stack.head4415347_bottom == Stack.head && Stack._lock4415347_bottom == Stack._lock && $result4415347_bottom == $result && this4415347_bottom == this && tid4415347_bottom == tid;
  assume $recorded.state4415347_bottom == 1;                                                        
  assert phase4415347 == $pc;                                                                              // (12.5): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 20.5: Node tmp4;                                                                                
                                                                                                    
                                                                                                    
 // 20.5: Node tmp5;                                                                                
                                                                                                    
                                                                                                    
 // 20.5: tmp5 := this.head;                                                                        
                                                                                                    
                                                                                                    
 moverPath4415356 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4415356 := m#moverPath(moverPath4415356);                                                     
 path4415356 := p#moverPath(moverPath4415356);                                                      
 assume Node._state4415356 == Node._state && Node.next4415356 == Node.next && Node._lock4415356 == Node._lock && Stack._state4415356 == Stack._state && Stack.head4415356 == Stack.head && Stack._lock4415356 == Stack._lock && tmp54415356 == tmp5 && tmp44415356 == tmp4 && $result4415356 == $result && this4415356 == this && tid4415356 == tid && $pc4415356 == $pc;
 assume $recorded.state4415356 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (20.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4415356);                                                              
 assert $pc != PhaseError;                                                                                 // (20.5): Reduction failure
 tmp5 := Stack.head[this];                                                                          
                                                                                                    
 // 20.5: tmp4 := tmp5.next;                                                                        
                                                                                                    
                                                                                                    
 moverPath4415359 := ReadEval.Node.next(tid: Tid,tmp5: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4415359 := m#moverPath(moverPath4415359);                                                     
 path4415359 := p#moverPath(moverPath4415359);                                                      
 assume Node._state4415359 == Node._state && Node.next4415359 == Node.next && Node._lock4415359 == Node._lock && Stack._state4415359 == Stack._state && Stack.head4415359 == Stack.head && Stack._lock4415359 == Stack._lock && tmp54415359 == tmp5 && tmp44415359 == tmp4 && $result4415359 == $result && this4415359 == this && tid4415359 == tid && $pc4415359 == $pc;
 assume $recorded.state4415359 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume tmp5 != Node.null;                                                                         
 } else {                                                                                           
  assert tmp5 != Node.null;                                                                                // (20.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4415359);                                                              
 assert $pc != PhaseError;                                                                                 // (20.5): Reduction failure
 tmp4 := Node.next[tmp5];                                                                           
                                                                                                    
                                                                                                    
 // 20.5: this.head := tmp4;                                                                        
                                                                                                    
                                                                                                    
 moverPath4415362 := WriteEval.Stack.head(tid: Tid,this: Stack,tmp4: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4415362 := m#moverPath(moverPath4415362);                                                     
 path4415362 := p#moverPath(moverPath4415362);                                                      
 assume Node._state4415362 == Node._state && Node.next4415362 == Node.next && Node._lock4415362 == Node._lock && Stack._state4415362 == Stack._state && Stack.head4415362 == Stack.head && Stack._lock4415362 == Stack._lock && tmp54415362 == tmp5 && tmp44415362 == tmp4 && $result4415362 == $result && this4415362 == this && tid4415362 == tid && $pc4415362 == $pc;
 assume $recorded.state4415362 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (20.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover4415362);                                                              
 assert $pc != PhaseError;                                                                                 // (20.5): Reduction failure
 Stack.head[this] := tmp4;                                                                          
 if (isLocal(Node._state[tmp4], tid)) {                                                             
  Node._state[tmp4] := SHARED();                                                                    
  assert isSharedAssignable(Node._state[Node.next[tmp4]]);                                                 // (20.5): tmp4 became shared, but tmp4.next may not be shared.
 }                                                                                                  
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (21.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Stack._lock[this] == tid;                                                                          // (21.5): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (21.5): Reduction failure
 Stack._lock[this] := Tid.null;                                                                     
                                                                                                    
 // 11.21: // return -1;                                                                            
                                                                                                    
 assume Node._state4415367 == Node._state && Node.next4415367 == Node.next && Node._lock4415367 == Node._lock && Stack._state4415367 == Stack._state && Stack.head4415367 == Stack.head && Stack._lock4415367 == Stack._lock && tmp54415367 == tmp5 && tmp44415367 == tmp4 && $result4415367 == $result && this4415367 == this && tid4415367 == tid;
 assume $recorded.state4415367 == 1;                                                                
 $result := -1;                                                                                     
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Node  :: _i == Node.null <==> isNull(Node._state[_i])) &&                             
  (forall _i: Stack  :: _i == Stack.null <==> isNull(Stack._state[_i])) &&                          
  (forall _i: Node ::  (isShared(Node._state[_i]) ==> isSharedAssignable(Node._state[Node.next[_i]]))) &&
  (forall _i: Node ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Node._state[_i],_t) ==> isLocalAssignable(Node._state[Node.next[_i]], _t)))) &&
  (forall _i: Stack ::  (isShared(Stack._state[_i]) ==> isSharedAssignable(Node._state[Stack.head[_i]]))) &&
  (forall _i: Stack ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Stack._state[_i],_t) ==> isLocalAssignable(Node._state[Stack.head[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)         
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.5): Node.next failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)          
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Node.next(u: Tid,x: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (2.5): Node.next failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)          
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == Node.next[x];                                                                          
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Node.next[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.5): Node.next failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)           
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == Node.next[x];                                                                          
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Node.next(u: Tid,x: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (2.5): Node.next failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)               
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): Node.next failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)                
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume w == Node.next[x];                                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Node.next[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): Node.next failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Stack.head(t: Tid, u: Tid, v: Node, w: Node, x: Stack)       
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[x], u);                                                         
 modifies Stack.head;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Stack.head(u: Tid,x: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (7.3): Stack.head failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Stack.head(t: Tid, u: Tid, v: Node, w: Node, x: Stack)        
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[x], u);                                                         
 modifies Stack.head;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Stack.head(u: Tid,x: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (7.3): Stack.head failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Stack.head(t: Tid, u: Tid, v: Node, w: Node, x: Stack)        
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[x], u);                                                         
 modifies Stack.head;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == Stack.head[x];                                                                         
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Stack.head[x] := havocValue;                                                                       
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Stack.head(u: Tid,x: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (7.3): Stack.head failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Stack.head(t: Tid, u: Tid, v: Node, w: Node, x: Stack)         
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[x], u);                                                         
 modifies Stack.head;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == Stack.head[x];                                                                         
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Stack.head(u: Tid,x: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (7.3): Stack.head failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Stack.head(t: Tid, u: Tid, v: Node, w: Node, x: Stack)             
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[x], u);                                                         
 modifies Stack.head;                                                                               
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Stack.head(u: Tid,x: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.3): Stack.head failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Stack.head(t: Tid, u: Tid, v: Node, w: Node, x: Stack)              
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[x], u);                                                         
 modifies Stack.head;                                                                               
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume w == Stack.head[x];                                                                         
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Stack.head[x] := havocValue;                                                                       
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Stack.head(u: Tid,x: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.3): Stack.head failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w0_mid: Node;                                                                                  
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w0_mid: Node;                                                                                  
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Node.next;                                                                                
 modifies Stack.head;                                                                               
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.3): Stack.head is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.3): Stack.head is not Write-Write Stable with respect to Node.next (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.3): Stack.head is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Node.next;                                                                                
 modifies Stack.head;                                                                               
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w0_mid: Node;                                                                                  
 var y_mid: Stack;                                                                                  
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Stack.head[y] := w;                                                                                
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.next is not Write-Write Stable with respect to Stack.head (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Node.next;                                                                                
 modifies Stack.head;                                                                               
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w0_mid: Node;                                                                                  
 var y_mid: Stack;                                                                                  
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Stack.head[y] := w;                                                                                
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.next is not Write-Write Stable with respect to Stack.head (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.next is not Write-Write Stable with respect to Stack.head (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Node.next;                                                                                
 modifies Stack.head;                                                                               
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[y] := w;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.next is not Read-Write Stable with respect to Stack.head (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.next is not Read-Write Stable with respect to Stack.head (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.next is not Read-Write Stable with respect to Stack.head (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Node.next;                                                                                
 modifies Stack.head;                                                                               
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Stack.head(u: Tid,y: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Stack.head(u: Tid,y: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.3): Stack.head is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.3): Stack.head is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.3): Stack.head is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Stack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Stack.head;                                                                               
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): Node.next is not Write-Write Stable with respect to Stack.head (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): Node.next is not Write-Write Stable with respect to Stack.head (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): Node.next is not Write-Write Stable with respect to Stack.head (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Stack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Stack.head;                                                                               
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w0_mid: Node;                                                                                  
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var x_mid: Stack;                                                                                  
 var Node._state_mid: [Node]State;                                                                  
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Stack.head[x];                                                                             
 Stack.head[x] := v;                                                                                
                                                                                                    
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Stack.head[x] := tmpV;                                                                             
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.3): Stack.head is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Stack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Stack.head;                                                                               
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w0_mid: Node;                                                                                  
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var x_mid: Stack;                                                                                  
 var Node._state_mid: [Node]State;                                                                  
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Stack.head[x];                                                                             
 Stack.head[x] := v;                                                                                
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Stack.head[x] := tmpV;                                                                             
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.3): Stack.head is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.3): Stack.head is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Stack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Stack.head;                                                                               
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.3): Stack.head is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.3): Stack.head is not Read-Write Stable with respect to Node.next (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.3): Stack.head is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Stack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Stack.head;                                                                               
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.next is not Write-Read Stable with respect to Stack.head (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.next is not Write-Read Stable with respect to Stack.head (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): Node.next is not Write-Read Stable with respect to Stack.head (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Stack.head.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Stack)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Stack.head;                                                                               
 modifies Stack.head;                                                                               
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.3): Stack.head is not Write-Write Stable with respect to Stack.head (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.3): Stack.head is not Write-Write Stable with respect to Stack.head (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.3): Stack.head is not Write-Write Stable with respect to Stack.head (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Stack.head.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Stack)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Stack.head;                                                                               
 modifies Stack.head;                                                                               
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w0_mid: Node;                                                                                  
 var y_mid: Stack;                                                                                  
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var x_mid: Stack;                                                                                  
 var Node._state_mid: [Node]State;                                                                  
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Stack.head[x];                                                                             
 Stack.head[x] := v;                                                                                
                                                                                                    
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Stack.head[x] := tmpV;                                                                             
 Stack.head[y] := w;                                                                                
 _writeByTPost := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.3): Stack.head is not Write-Write Stable with respect to Stack.head (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Stack.head.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Stack)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Stack.head;                                                                               
 modifies Stack.head;                                                                               
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w0_mid: Node;                                                                                  
 var y_mid: Stack;                                                                                  
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var x_mid: Stack;                                                                                  
 var Node._state_mid: [Node]State;                                                                  
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Stack.head[x];                                                                             
 Stack.head[x] := v;                                                                                
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Stack.head[x] := tmpV;                                                                             
 Stack.head[y] := w;                                                                                
 _writeByTPost := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.3): Stack.head is not Write-Write Stable with respect to Stack.head (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.3): Stack.head is not Write-Write Stable with respect to Stack.head (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Stack.head.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Stack)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Stack.head;                                                                               
 modifies Stack.head;                                                                               
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[y] := w;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.3): Stack.head is not Read-Write Stable with respect to Stack.head (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.3): Stack.head is not Read-Write Stable with respect to Stack.head (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.3): Stack.head is not Read-Write Stable with respect to Stack.head (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Stack.head.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Stack)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Stack.head;                                                                               
 modifies Stack.head;                                                                               
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Stack.head(u: Tid,y: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Stack.head(u: Tid,y: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.3): Stack.head is not Write-Read Stable with respect to Stack.head (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.3): Stack.head is not Write-Read Stable with respect to Stack.head (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.3): Stack.head is not Write-Read Stable with respect to Stack.head (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock); 
requires ValidTid(tid);                                                                             
modifies Node._state;                                                                               
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
modifies Stack._state;                                                                              
modifies Stack.head;                                                                                
modifies Stack._lock;                                                                               
ensures StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);  
ensures Y(tid , old(Node._state), old(Node.next), old(Node._lock), old(Stack._state), old(Stack.head), old(Stack._lock) , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
                                                                                                    
// Node.next:                                                                                       
                                                                                                    
function {:inline} Y_Node.next(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.next(tid: Tid,this: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _R)) ==> (Node.next[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.next(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var this_yield: Node;                                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var newValue_yield: Node;                                                                           
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node.next(u: Tid,this: Node,newValue: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.next(tid, this, newValue , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var this_yield: Node;                                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.next(tid, this, Node.next[this] , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Transitive(tid : Tid, this: Node, newValue : Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Stack._state_p: [Stack]State, Stack.head_p: [Stack]Node, Stack._lock_p: [Stack]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires StateInvariant(Node._state_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var newValue_pre: Node;                                                                             
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var Stack._lock_pre: [Stack]Tid;                                                                    
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var Stack._state_pre: [Stack]State;                                                                 
var Stack.head_pre: [Stack]Node;                                                                    
                                                                                                    
var Stack.head_post: [Stack]Node;                                                                   
var Stack._state_post: [Stack]State;                                                                
var $recorded.state_post: int;                                                                      
var newValue_post: Node;                                                                            
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Stack._lock_post: [Stack]Tid;                                                                   
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var this_post: Node;                                                                                
                                                                                                    
assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock , Node._state_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 assume Y_Node.next(tid, this, newValue , Node._state_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
assume Node._state_post == Node._state_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Stack._state_post == Stack._state_p && Stack.head_post == Stack.head_p && Stack._lock_post == Stack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node.next(tid, this, newValue , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
// Node._lock:                                                                                      
                                                                                                    
function {:inline} Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _R)) ==> (Node._lock[this] == newValue))
 &&(((Node._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var this_yield: Node;                                                                               
var newValue_yield: Tid;                                                                            
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node._lock(u: Tid,this: Node,newValue: Tid,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)));
 assume leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _N);
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, newValue , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var this_yield: Node;                                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, Node._lock[this] , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Transitive(tid : Tid, this: Node, newValue : Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Stack._state_p: [Stack]State, Stack.head_p: [Stack]Node, Stack._lock_p: [Stack]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires StateInvariant(Node._state_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var Stack._lock_pre: [Stack]Tid;                                                                    
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var Stack._state_pre: [Stack]State;                                                                 
var Stack.head_pre: [Stack]Node;                                                                    
var newValue_pre: Tid;                                                                              
                                                                                                    
var Stack.head_post: [Stack]Node;                                                                   
var Stack._state_post: [Stack]State;                                                                
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Stack._lock_post: [Stack]Tid;                                                                   
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var this_post: Node;                                                                                
var newValue_post: Tid;                                                                             
                                                                                                    
assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock , Node._state_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 assume Y_Node._lock(tid, this, newValue , Node._state_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
assume Node._state_post == Node._state_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Stack._state_post == Stack._state_p && Stack.head_post == Stack.head_p && Stack._lock_post == Stack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node._lock(tid, this, newValue , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
// Stack.head:                                                                                      
                                                                                                    
function {:inline} Y_Stack.head(tid : Tid, this: Stack, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 ((isAccessible(Stack._state[this], tid) && leq(m#moverPath(ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _R)) ==> (Stack.head[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Stack.head(tid : Tid, this: Stack, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Stack.head.Subsumes.W(tid : Tid, u : Tid, this: Stack, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var this_yield: Stack;                                                                              
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var newValue_yield: Node;                                                                           
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
 assume isAccessible(Stack._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Stack.head(u: Tid,this: Stack,newValue: Node,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Stack.head(tid, this, newValue , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Stack.head.Reflexive(tid : Tid, this: Stack , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var this_yield: Stack;                                                                              
var $pc_yield: Phase;                                                                               
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Stack.head(tid, this, Stack.head[this] , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Stack.head.Transitive(tid : Tid, this: Stack, newValue : Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Stack._state_p: [Stack]State, Stack.head_p: [Stack]Node, Stack._lock_p: [Stack]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires StateInvariant(Node._state_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var newValue_pre: Node;                                                                             
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var Node._state_pre: [Node]State;                                                                   
var this_pre: Stack;                                                                                
var tid_pre: Tid;                                                                                   
var Stack._lock_pre: [Stack]Tid;                                                                    
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var Stack._state_pre: [Stack]State;                                                                 
var Stack.head_pre: [Stack]Node;                                                                    
                                                                                                    
var Stack.head_post: [Stack]Node;                                                                   
var Stack._state_post: [Stack]State;                                                                
var $recorded.state_post: int;                                                                      
var newValue_post: Node;                                                                            
var this_post: Stack;                                                                               
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Stack._lock_post: [Stack]Tid;                                                                   
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
                                                                                                    
assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
 assume Y(tid , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock , Node._state_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 assume Y_Stack.head(tid, this, newValue , Node._state_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
assume Node._state_post == Node._state_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Stack._state_post == Stack._state_p && Stack.head_post == Stack.head_p && Stack._lock_post == Stack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Stack.head(tid, this, newValue , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
// Stack._lock:                                                                                     
                                                                                                    
function {:inline} Y_Stack._lock(tid : Tid, this: Stack, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 ((isAccessible(Stack._state[this], tid) && leq(m#moverPath(ReadEval.Stack._lock(tid: Tid,this: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _R)) ==> (Stack._lock[this] == newValue))
 &&(((Stack._lock[this]==tid)==(newValue==tid)))                                                    
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Stack._lock(tid : Tid, this: Stack, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Stack._lock.Subsumes.W(tid : Tid, u : Tid, this: Stack, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var newValue_yield: Tid;                                                                            
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var this_yield: Stack;                                                                              
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
 assume isAccessible(Stack._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Stack._lock(u: Tid,this: Stack,newValue: Tid,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)));
 assume leq(m#moverPath(ReadEval.Stack._lock(tid: Tid,this: Stack,Node._state,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _N);
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Stack._lock(tid, this, newValue , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Stack._lock.Reflexive(tid : Tid, this: Stack , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var this_yield: Stack;                                                                              
var $pc_yield: Phase;                                                                               
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Stack._lock(tid, this, Stack._lock[this] , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Stack._lock.Transitive(tid : Tid, this: Stack, newValue : Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Stack._state_p: [Stack]State, Stack.head_p: [Stack]Node, Stack._lock_p: [Stack]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires StateInvariant(Node._state_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var Node._state_pre: [Node]State;                                                                   
var this_pre: Stack;                                                                                
var tid_pre: Tid;                                                                                   
var Stack._lock_pre: [Stack]Tid;                                                                    
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var Stack._state_pre: [Stack]State;                                                                 
var Stack.head_pre: [Stack]Node;                                                                    
var newValue_pre: Tid;                                                                              
                                                                                                    
var Stack.head_post: [Stack]Node;                                                                   
var Stack._state_post: [Stack]State;                                                                
var $recorded.state_post: int;                                                                      
var this_post: Stack;                                                                               
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Stack._lock_post: [Stack]Tid;                                                                   
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var newValue_post: Tid;                                                                             
                                                                                                    
assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
 assume Y(tid , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock , Node._state_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 assume Y_Stack._lock(tid, this, newValue , Node._state_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
assume Node._state_post == Node._state_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Stack._state_post == Stack._state_p && Stack.head_post == Stack.head_p && Stack._lock_post == Stack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Stack._lock(tid, this, newValue , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Stack._state_p: [Stack]State, Stack.head_p: [Stack]Node, Stack._lock_p: [Stack]Tid): bool
{                                                                                                   
 (forall this: Node :: Y_Node.next(tid : Tid, this, Node.next_p[this] , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock))
 && (forall this: Node :: Y_Node._lock(tid : Tid, this, Node._lock_p[this] , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock))
 && (forall this: Stack :: Y_Stack.head(tid : Tid, this, Stack.head_p[this] , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock))
 && (forall this: Stack :: Y_Stack._lock(tid : Tid, this, Stack._lock_p[this] , Node._state, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock))
 && (forall _i : Node :: isShared(Node._state[_i]) ==> isShared(Node._state_p[_i]))                 
 && (forall _i : Node :: isLocal(Node._state[_i], tid) <==> isLocal(Node._state_p[_i], tid))        
 && (forall _i : Stack :: isShared(Stack._state[_i]) ==> isShared(Stack._state_p[_i]))              
 && (forall _i : Stack :: isLocal(Stack._state[_i], tid) <==> isLocal(Stack._state_p[_i], tid))     
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 755.1-1090.2: (Method:10.3)
// 766.1-766.24: (10.3): Bad tid
// 767.1-767.39: (10.3): this is not global
// 914.2-918.14: (class anchor.sink.While:12.5)
// 920.1-920.27: (10.3): Bad tid
// 921.1-921.42: (10.3): this is not global
// 924.1-924.208: (12.5): Loop does not preserve yields_as annotation for field next
// 925.1-925.211: (12.5): Loop does not preserve yields_as annotation for field head
// 926.1-926.33: (12.5): Phase must be invariant at loop head
// 927.1-927.30: (12.5): Potentially infinite loop cannot be in post-commit phase.
// 929.3-931.3: (class anchor.sink.VarDeclStmt:12.11)
// 932.3-935.16: (class anchor.sink.Assign:12.11)
// 937.4-940.10: (class anchor.sink.Break:12.5)
// 946.1-946.30: (13.7): Cannot have potential null deference in left-mover part.
// 950.1-950.28: (13.7): Reduction failure
// 952.3-954.3: (class anchor.sink.VarDeclStmt:14.7)
// 955.3-957.3: (class anchor.sink.VarDeclStmt:14.7)
// 958.3-975.28: (class anchor.sink.Read:14.7)
// 970.1-970.30: (14.7): Cannot have potential null deference in left-mover part.
// 974.1-974.28: (14.7): Reduction failure
// 976.3-979.29: (class anchor.sink.Assign:14.7)
// 981.4-984.10: (class anchor.sink.Break:15.9)
// 990.1-990.30: (17.7): Cannot have potential null deference in left-mover part.
// 992.1-992.35: (17.7): lock not held
// 994.1-994.28: (17.7): Reduction failure
// 996.3-1004.43: (class anchor.sink.Yield:18.7)
// 1007.1-1007.30: (12.5): Phase must be invariant at loop head
// 1009.2-1011.2: (class anchor.sink.VarDeclStmt:20.5)
// 1012.2-1014.2: (class anchor.sink.VarDeclStmt:20.5)
// 1015.2-1032.27: (class anchor.sink.Read:20.5)
// 1027.1-1027.29: (20.5): Cannot have potential null deference in left-mover part.
// 1031.1-1031.27: (20.5): Reduction failure
// 1033.2-1050.26: (class anchor.sink.Read:20.5)
// 1045.1-1045.28: (20.5): Cannot have potential null deference in left-mover part.
// 1049.1-1049.27: (20.5): Reduction failure
// 1052.2-1073.2: (class anchor.sink.Write:20.5)
// 1064.1-1064.29: (20.5): Cannot have potential null deference in left-mover part.
// 1067.1-1067.27: (20.5): Reduction failure
// 1071.1-1071.59: (20.5): tmp4 became shared, but tmp4.next may not be shared.
// 1077.1-1077.29: (21.5): Cannot have potential null deference in left-mover part.
// 1079.1-1079.34: (21.5): lock not held
// 1081.1-1081.27: (21.5): Reduction failure
// 1083.2-1089.9: (class anchor.sink.Return:11.21)
// 1175.1-1175.34: (2.5): Node.next failed Write-Write Right-Mover Check
// 1238.1-1238.30: (2.5): Node.next failed Write-Read Right-Mover Check
// 1305.1-1305.34: (2.5): Node.next failed Write-Write Left-Mover Check
// 1369.1-1369.30: (2.5): Node.next failed Write-Read Left-Mover Check
// 1430.1-1430.34: (2.5): Node.next failed Read-Write Right-Mover Check
// 1494.1-1494.34: (2.5): Node.next failed Read-Write Left-Mover Check
// 1557.1-1557.34: (7.3): Stack.head failed Write-Write Right-Mover Check
// 1620.1-1620.30: (7.3): Stack.head failed Write-Read Right-Mover Check
// 1687.1-1687.34: (7.3): Stack.head failed Write-Write Left-Mover Check
// 1751.1-1751.30: (7.3): Stack.head failed Write-Read Left-Mover Check
// 1812.1-1812.34: (7.3): Stack.head failed Read-Write Right-Mover Check
// 1876.1-1876.34: (7.3): Stack.head failed Read-Write Left-Mover Check
// 1951.1-1951.140: (2.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
// 1952.1-1952.101: (2.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
// 1953.1-1953.158: (2.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
// 2055.1-2055.140: (2.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
// 2162.1-2162.144: (2.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
// 2163.1-2163.144: (2.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
// 2238.1-2238.136: (2.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
// 2239.1-2239.136: (2.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
// 2240.1-2240.146: (2.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
// 2314.1-2314.136: (2.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
// 2315.1-2315.136: (2.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
// 2316.1-2316.99: (2.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
// 2392.1-2392.140: (7.3): Stack.head is not Write-Write Stable with respect to Node.next (case A.1)
// 2393.1-2393.101: (7.3): Stack.head is not Write-Write Stable with respect to Node.next (case A.2)
// 2394.1-2394.156: (7.3): Stack.head is not Write-Write Stable with respect to Node.next (case A.3)
// 2496.1-2496.140: (2.5): Node.next is not Write-Write Stable with respect to Stack.head (case C)
// 2603.1-2603.144: (2.5): Node.next is not Write-Write Stable with respect to Stack.head (case D)
// 2604.1-2604.144: (2.5): Node.next is not Write-Write Stable with respect to Stack.head (case R)
// 2679.1-2679.136: (2.5): Node.next is not Read-Write Stable with respect to Stack.head (case F)
// 2680.1-2680.136: (2.5): Node.next is not Read-Write Stable with respect to Stack.head (case H)
// 2681.1-2681.144: (2.5): Node.next is not Read-Write Stable with respect to Stack.head (case I)
// 2755.1-2755.136: (7.3): Stack.head is not Write-Read Stable with respect to Node.next (case J)
// 2756.1-2756.136: (7.3): Stack.head is not Write-Read Stable with respect to Node.next (case K)
// 2757.1-2757.99: (7.3): Stack.head is not Write-Read Stable with respect to Node.next (case L)
// 2833.1-2833.140: (2.5): Node.next is not Write-Write Stable with respect to Stack.head (case A.1)
// 2834.1-2834.101: (2.5): Node.next is not Write-Write Stable with respect to Stack.head (case A.2)
// 2835.1-2835.156: (2.5): Node.next is not Write-Write Stable with respect to Stack.head (case A.3)
// 2937.1-2937.140: (7.3): Stack.head is not Write-Write Stable with respect to Node.next (case C)
// 3044.1-3044.144: (7.3): Stack.head is not Write-Write Stable with respect to Node.next (case D)
// 3045.1-3045.144: (7.3): Stack.head is not Write-Write Stable with respect to Node.next (case R)
// 3120.1-3120.136: (7.3): Stack.head is not Read-Write Stable with respect to Node.next (case F)
// 3121.1-3121.136: (7.3): Stack.head is not Read-Write Stable with respect to Node.next (case H)
// 3122.1-3122.144: (7.3): Stack.head is not Read-Write Stable with respect to Node.next (case I)
// 3196.1-3196.136: (2.5): Node.next is not Write-Read Stable with respect to Stack.head (case J)
// 3197.1-3197.136: (2.5): Node.next is not Write-Read Stable with respect to Stack.head (case K)
// 3198.1-3198.99: (2.5): Node.next is not Write-Read Stable with respect to Stack.head (case L)
// 3274.1-3274.140: (7.3): Stack.head is not Write-Write Stable with respect to Stack.head (case A.1)
// 3275.1-3275.101: (7.3): Stack.head is not Write-Write Stable with respect to Stack.head (case A.2)
// 3276.1-3276.158: (7.3): Stack.head is not Write-Write Stable with respect to Stack.head (case A.3)
// 3378.1-3378.140: (7.3): Stack.head is not Write-Write Stable with respect to Stack.head (case C)
// 3485.1-3485.144: (7.3): Stack.head is not Write-Write Stable with respect to Stack.head (case D)
// 3486.1-3486.144: (7.3): Stack.head is not Write-Write Stable with respect to Stack.head (case R)
// 3561.1-3561.136: (7.3): Stack.head is not Read-Write Stable with respect to Stack.head (case F)
// 3562.1-3562.136: (7.3): Stack.head is not Read-Write Stable with respect to Stack.head (case H)
// 3563.1-3563.146: (7.3): Stack.head is not Read-Write Stable with respect to Stack.head (case I)
// 3637.1-3637.136: (7.3): Stack.head is not Write-Read Stable with respect to Stack.head (case J)
// 3638.1-3638.136: (7.3): Stack.head is not Write-Read Stable with respect to Stack.head (case K)
// 3639.1-3639.99: (7.3): Stack.head is not Write-Read Stable with respect to Stack.head (case L)
// 3673.1-3695.2: (2.5): yields_as clause for Node.next is not valid
// 3700.1-3717.2: (2.5): yields_as clause for Node.next is not reflexive
// 3723.1-3757.2: (2.5): yields_as clause for Node.next is not transitive
// 3777.1-3799.2: (7.32): yields_as clause for Node._lock is not valid
// 3804.1-3821.2: (7.32): yields_as clause for Node._lock is not reflexive
// 3827.1-3861.2: (7.32): yields_as clause for Node._lock is not transitive
// 3880.1-3902.2: (7.3): yields_as clause for Stack.head is not valid
// 3907.1-3924.2: (7.3): yields_as clause for Stack.head is not reflexive
// 3930.1-3964.2: (7.3): yields_as clause for Stack.head is not transitive
// 3984.1-4006.2: (7.32): yields_as clause for Stack._lock is not valid
// 4011.1-4028.2: (7.32): yields_as clause for Stack._lock is not reflexive
// 4034.1-4068.2: (7.32): yields_as clause for Stack._lock is not transitive
